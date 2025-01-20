@interface SUCoreDDMDeclaration
+ (BOOL)supportsSecureCoding;
- (BOOL)enableNotifications;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstallOverdue;
- (BOOL)isValidDeclaration;
- (BOOL)isValidDeclarationWithReason:(id *)a3;
- (NSDate)enforcedInstallDate;
- (NSDictionary)additionalOptions;
- (NSString)buildVersionString;
- (NSString)companyName;
- (NSString)declarationKey;
- (NSString)detailsURL;
- (NSString)versionString;
- (SUCoreDDMDeclaration)initWithCoder:(id)a3;
- (SUCoreDDMDeclaration)initWithDeclarationKeys:(id)a3;
- (SUCoreDevice)device;
- (id)_dateFromString:(id)a3;
- (id)_stringFromDate:(id)a3;
- (id)copy;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBuildVersionString:(id)a3;
- (void)setCompanyName:(id)a3;
- (void)setDeclarationKey:(id)a3;
- (void)setDetailsURL:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEnableNotifications:(BOOL)a3;
- (void)setEnforcedInstallDate:(id)a3;
- (void)setVersionString:(id)a3;
@end

@implementation SUCoreDDMDeclaration

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  if (!v5) {
    goto LABEL_14;
  }
  v6 = (void *)v5;
  [v4 enforcedInstallDate];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        [v4 enforcedInstallDate],
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = (void *)[v8 compare:v9],
        v9,
        v8,
        !v10))
  {
LABEL_14:
    uint64_t v11 = -[SUCoreDDMDeclaration versionString](self, "versionString");
    if (!v11) {
      goto LABEL_7;
    }
    v12 = (void *)v11;
    [v4 versionString];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13
      || (-[SUCoreDDMDeclaration versionString](self, "versionString"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          [v4 versionString],
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = (void *)[v14 compare:v15 options:64],
          v15,
          v14,
          !v10))
    {
LABEL_7:
      v10 = -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
      if (v10)
      {
        [v4 buildVersionString];
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
          [v4 buildVersionString];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)[v17 compare:v18 options:64];
        }

        else
        {
          v10 = 0LL;
        }
      }
    }
  }

  return (int64_t)v10;
}

- (SUCoreDDMDeclaration)initWithDeclarationKeys:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SUCoreDDMDeclaration;
  uint64_t v5 = -[SUCoreDDMDeclaration init](&v24, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 safeStringForKey:@"RMStoreDeclarationKey"];
    declarationKey = v5->_declarationKey;
    v5->_declarationKey = (NSString *)v6;

    [v4 safeStringForKey:@"TargetLocalDateTime"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[SUCoreDDMDeclaration _dateFromString:](v5, "_dateFromString:", v8);
    enforcedInstallDate = v5->_enforcedInstallDate;
    v5->_enforcedInstallDate = (NSDate *)v9;

    uint64_t v11 = [v4 safeStringForKey:@"TargetOSVersion"];
    versionString = v5->_versionString;
    v5->_versionString = (NSString *)v11;

    uint64_t v13 = [v4 safeStringForKey:@"TargetBuildVersion"];
    buildVersionString = v5->_buildVersionString;
    v5->_buildVersionString = (NSString *)v13;

    v5->_enableNotifications = 1;
    uint64_t v15 = [v4 safeStringForKey:@"DetailsURL"];
    detailsURL = v5->_detailsURL;
    v5->_detailsURL = (NSString *)v15;

    uint64_t v17 = [v4 safeStringForKey:@"CompanyName"];
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v17;

    uint64_t v19 = [v4 safeDictionaryForKey:@"AdditionalOptions"];
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = (NSDictionary *)v19;

    uint64_t v21 = [MEMORY[0x189612770] sharedDevice];
    device = v5->_device;
    v5->_device = (SUCoreDevice *)v21;
  }

  return v5;
}

- (SUCoreDDMDeclaration)initWithCoder:(id)a3
{
  v11[14] = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x189604010];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v11[9] = objc_opt_class();
  v11[10] = objc_opt_class();
  v11[11] = objc_opt_class();
  v11[12] = objc_opt_class();
  v11[13] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v11 count:14];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithArray:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 decodeObjectOfClasses:v7 forKey:@"ddmDeclaration"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = -[SUCoreDDMDeclaration initWithDeclarationKeys:](self, "initWithDeclarationKeys:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCoreDDMDeclaration dictionaryRepresentation](self, "dictionaryRepresentation");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"ddmDeclaration"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dateFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x189607848];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  [v5 dateFromString:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stringFromDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x189607848];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  [v5 stringFromDate:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  -[SUCoreDDMDeclaration declarationKey](self, "declarationKey");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration _stringFromDate:](self, "_stringFromDate:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreDDMDeclaration versionString](self, "versionString");
  v8 = -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
  -[SUCoreDDMDeclaration detailsURL](self, "detailsURL");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUCoreDDMDeclaration companyName](self, "companyName");
  BOOL v11 = -[SUCoreDDMDeclaration enableNotifications](self, "enableNotifications");
  v12 = @"NO";
  if (v11) {
    v12 = @"YES";
  }
  [v3 stringWithFormat:@"SUCoreDDMDeclaration (DeclarationKey:%@|EnforcedInstallDate:%@|VersionString:%@|BuildVersionString:%@|DetailsURL:%@|companyName:%@|NotificationsEnabled:%@)", v4, v6, v7, v8, v9, v10, v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration declarationKey](self, "declarationKey");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v4 forKey:@"RMStoreDeclarationKey"];

  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration _stringFromDate:](self, "_stringFromDate:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v6 forKey:@"TargetLocalDateTime"];
  v7 = -[SUCoreDDMDeclaration versionString](self, "versionString");
  [v3 setSafeObject:v7 forKey:@"TargetOSVersion"];
  v8 = -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
  [v3 setSafeObject:v8 forKey:@"TargetBuildVersion"];

  -[SUCoreDDMDeclaration companyName](self, "companyName");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v9 forKey:@"CompanyName"];
  v10 = -[SUCoreDDMDeclaration additionalOptions](self, "additionalOptions");
  [v3 setSafeObject:v10 forKey:@"AdditionalOptions"];

  -[SUCoreDDMDeclaration detailsURL](self, "detailsURL");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v11 forKey:@"DetailsURL"];

  v12 = (void *)[v3 copy];
  return v12;
}

- (BOOL)isValidDeclaration
{
  return -[SUCoreDDMDeclaration isValidDeclarationWithReason:](self, "isValidDeclarationWithReason:", 0LL);
}

- (BOOL)isInstallOverdue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] now];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (BOOL)isValidDeclarationWithReason:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  -[SUCoreDDMDeclaration declarationKey](self, "declarationKey");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [NSString stringWithFormat:@"Invalid declaration: invalid declaration key"];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    [NSString stringWithFormat:@"Invalid declaration: invalid enforced install date"];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = -[SUCoreDDMDeclaration versionString](self, "versionString");
  if (v7)
  {

LABEL_13:
    -[SUCoreDDMDeclaration device](self, "device");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      [NSString stringWithFormat:@"Internal error: failed to get a core device"];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 oslog];
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDDMDeclaration isValidDeclarationWithReason:].cold.1();
      }

      if (a3)
      {
        id v14 = v14;
        BOOL v12 = 0;
        *a3 = v14;
      }

      else
      {
        BOOL v12 = 0;
      }

      goto LABEL_43;
    }

    -[SUCoreDDMDeclaration versionString](self, "versionString");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v8 productVersion];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
    -[SUCoreDDMDeclaration versionString](self, "versionString");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17) {
      goto LABEL_23;
    }
    if (([v8 isCorrectlyFormattedProductVersion:v14] & 1) == 0)
    {
      [NSString stringWithFormat:@"Invalid declaration: target OS version (%@) has an invalid format", v14];
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v29 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
      [v29 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }

    if ([v15 compare:v14 options:64] == 1)
    {
      [NSString stringWithFormat:@"Invalid declaration: target OS version (%@) is older than current version (%@)", v14, v15];
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
    }

    else
    {
LABEL_23:
      v23 = -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
      if (!v23 || ([v8 isCorrectlyFormattedBuildVersion:v16] & 1) != 0)
      {
        if (-[SUCoreDDMDeclaration isInstallOverdue](self, "isInstallOverdue"))
        {
          +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
          objc_super v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 oslog];
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
            -[SUCoreDDMDeclaration _stringFromDate:](self, "_stringFromDate:", v26);
            v27 = (SUCoreDDMDeclaration *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v34 = "-[SUCoreDDMDeclaration isValidDeclarationWithReason:]";
            __int16 v35 = 2112;
            v36 = v27;
            _os_log_impl( &dword_187A54000,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: Past-due declaration: enforced install date is in the past (%@)",  buf,  0x16u);
          }
        }
        v28 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
        [v28 oslog];
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[SUCoreDDMDeclaration isValidDeclarationWithReason:]";
          __int16 v35 = 2112;
          v36 = self;
          _os_log_impl(&dword_187A54000, v18, OS_LOG_TYPE_DEFAULT, "%s: %@ is (likely) good to go!", buf, 0x16u);
        }

        BOOL v12 = 1;
        goto LABEL_42;
      }

      [NSString stringWithFormat:@"Invalid declaration: target build version (%@) has an invalid format", v16];
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v31 = +[SUCoreDDMUtilities sharedLogger](&OBJC_CLASS___SUCoreDDMUtilities, "sharedLogger");
      [v31 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_39:

        if (a3)
        {
          v18 = v18;
          BOOL v12 = 0;
          *a3 = v18;
        }

        else
        {
          BOOL v12 = 0;
        }

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (SUCoreDDMDeclaration *)a3;
  if (v4 == self)
  {
    char v21 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x189612760];
      v7 = -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
      -[SUCoreDDMDeclaration enforcedInstallDate](v5, "enforcedInstallDate");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 dateIsEqual:v7 to:v8])
      {
        uint64_t v9 = (void *)MEMORY[0x189612760];
        v10 = -[SUCoreDDMDeclaration versionString](self, "versionString");
        -[SUCoreDDMDeclaration versionString](v5, "versionString");
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 stringIsEqual:v10 to:v11])
        {
          BOOL v12 = (void *)MEMORY[0x189612760];
          -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[SUCoreDDMDeclaration buildVersionString](v5, "buildVersionString");
          if (objc_msgSend(v12, "stringIsEqual:to:", v13))
          {
            v25 = v13;
            id v14 = (void *)MEMORY[0x189612760];
            uint64_t v15 = -[SUCoreDDMDeclaration detailsURL](self, "detailsURL");
            uint64_t v16 = -[SUCoreDDMDeclaration detailsURL](v5, "detailsURL");
            objc_super v24 = (void *)v15;
            uint64_t v17 = v15;
            v18 = (void *)v16;
            if ([v14 stringIsEqual:v17 to:v16])
            {
              v23 = (void *)MEMORY[0x189612760];
              -[SUCoreDDMDeclaration companyName](self, "companyName");
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[SUCoreDDMDeclaration companyName](v5, "companyName");
              char v21 = [v23 stringIsEqual:v19 to:v20];
            }

            else
            {
              char v21 = 0;
            }

            uint64_t v13 = v25;
          }

          else
          {
            char v21 = 0;
          }
        }

        else
        {
          char v21 = 0;
        }
      }

      else
      {
        char v21 = 0;
      }
    }

    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (NSString)declarationKey
{
  return self->_declarationKey;
}

- (void)setDeclarationKey:(id)a3
{
}

- (NSDate)enforcedInstallDate
{
  return self->_enforcedInstallDate;
}

- (void)setEnforcedInstallDate:(id)a3
{
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
}

- (NSString)buildVersionString
{
  return self->_buildVersionString;
}

- (void)setBuildVersionString:(id)a3
{
}

- (NSString)detailsURL
{
  return self->_detailsURL;
}

- (void)setDetailsURL:(id)a3
{
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (BOOL)enableNotifications
{
  return self->_enableNotifications;
}

- (void)setEnableNotifications:(BOOL)a3
{
  self->_enableNotifications = a3;
}

- (SUCoreDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)isValidDeclarationWithReason:.cold.1()
{
}

@end