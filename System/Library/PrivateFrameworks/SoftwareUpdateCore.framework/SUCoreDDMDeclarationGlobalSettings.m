@interface SUCoreDDMDeclarationGlobalSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidDeclarationWithReason:(id *)a3;
- (NSArray)offerPrograms;
- (NSArray)serializedKeys;
- (NSDictionary)requireProgram;
- (NSNumber)adminInstallRequired;
- (NSNumber)automaticallyCheck;
- (NSNumber)automaticallyDownload;
- (NSNumber)automaticallyInstallOSUpdates;
- (NSNumber)automaticallyInstallSystemAndSecurityUpdates;
- (NSNumber)combinedUpdatesDeferralPeriod;
- (NSNumber)enableGlobalNotifications;
- (NSNumber)enableRapidSecurityResponse;
- (NSNumber)enableRapidSecurityResponseRollback;
- (NSNumber)majorOSDeferralPeriod;
- (NSNumber)minorOSDeferralPeriod;
- (NSNumber)programEnrollment;
- (NSNumber)recommendationCadence;
- (NSNumber)systemUpdatesDeferralPeriod;
- (SUCoreDDMDeclarationGlobalSettings)initWithCoder:(id)a3;
- (SUCoreDDMDeclarationGlobalSettings)initWithDeclarationKeys:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setAdminInstallRequired:(id)a3;
- (void)setAutomaticallyCheck:(id)a3;
- (void)setAutomaticallyDownload:(id)a3;
- (void)setAutomaticallyInstallOSUpdates:(id)a3;
- (void)setAutomaticallyInstallSystemAndSecurityUpdates:(id)a3;
- (void)setCombinedUpdatesDeferralPeriod:(id)a3;
- (void)setEnableGlobalNotifications:(id)a3;
- (void)setEnableRapidSecurityResponse:(id)a3;
- (void)setEnableRapidSecurityResponseRollback:(id)a3;
- (void)setMajorOSDeferralPeriod:(id)a3;
- (void)setMinorOSDeferralPeriod:(id)a3;
- (void)setOfferPrograms:(id)a3;
- (void)setProgramEnrollment:(id)a3;
- (void)setRecommendationCadence:(id)a3;
- (void)setRequireProgram:(id)a3;
- (void)setSerializedKeys:(id)a3;
- (void)setSystemUpdatesDeferralPeriod:(id)a3;
@end

@implementation SUCoreDDMDeclarationGlobalSettings

- (SUCoreDDMDeclarationGlobalSettings)initWithDeclarationKeys:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___SUCoreDDMDeclarationGlobalSettings;
  v5 = -[SUCoreDDMDeclarationGlobalSettings init](&v41, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"enableGlobalNotifications"];
    enableGlobalNotifications = v5->_enableGlobalNotifications;
    v5->_enableGlobalNotifications = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"majorOSDeferralPeriod"];
    majorOSDeferralPeriod = v5->_majorOSDeferralPeriod;
    v5->_majorOSDeferralPeriod = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"minorOSDeferralPeriod"];
    minorOSDeferralPeriod = v5->_minorOSDeferralPeriod;
    v5->_minorOSDeferralPeriod = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"systemUpdatesDeferralPeriod"];
    systemUpdatesDeferralPeriod = v5->_systemUpdatesDeferralPeriod;
    v5->_systemUpdatesDeferralPeriod = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"combinedUpdatesDeferralPeriod"];
    combinedUpdatesDeferralPeriod = v5->_combinedUpdatesDeferralPeriod;
    v5->_combinedUpdatesDeferralPeriod = (NSNumber *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"recommendationCadence"];
    recommendationCadence = v5->_recommendationCadence;
    v5->_recommendationCadence = (NSNumber *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"automaticallyInstallOSUpdates"];
    automaticallyInstallOSUpdates = v5->_automaticallyInstallOSUpdates;
    v5->_automaticallyInstallOSUpdates = (NSNumber *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"automaticallyInstallSystemAndSecurityUpdates"];
    automaticallyInstallSystemAndSecurityUpdates = v5->_automaticallyInstallSystemAndSecurityUpdates;
    v5->_automaticallyInstallSystemAndSecurityUpdates = (NSNumber *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"automaticallyCheck"];
    automaticallyCheck = v5->_automaticallyCheck;
    v5->_automaticallyCheck = (NSNumber *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"automaticallyDownload"];
    automaticallyDownload = v5->_automaticallyDownload;
    v5->_automaticallyDownload = (NSNumber *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"adminInstallRequired"];
    adminInstallRequired = v5->_adminInstallRequired;
    v5->_adminInstallRequired = (NSNumber *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"enableRapidSecurityResponse"];
    enableRapidSecurityResponse = v5->_enableRapidSecurityResponse;
    v5->_enableRapidSecurityResponse = (NSNumber *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"enableRapidSecurityResponseRollback"];
    enableRapidSecurityResponseRollback = v5->_enableRapidSecurityResponseRollback;
    v5->_enableRapidSecurityResponseRollback = (NSNumber *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"serializedKeys"];
    serializedKeys = v5->_serializedKeys;
    v5->_serializedKeys = (NSArray *)v32;

    uint64_t v34 = [v4 objectForKeyedSubscript:@"programEnrollment"];
    programEnrollment = v5->_programEnrollment;
    v5->_programEnrollment = (NSNumber *)v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"offerPrograms"];
    offerPrograms = v5->_offerPrograms;
    v5->_offerPrograms = (NSArray *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"requireProgram"];
    requireProgram = v5->_requireProgram;
    v5->_requireProgram = (NSDictionary *)v38;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCoreDDMDeclarationGlobalSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"SUCoreDDMDeclarationGlobalSettings"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreDDMDeclarationGlobalSettings)initWithCoder:(id)a3
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

  [v5 decodeObjectOfClasses:v7 forKey:@"SUCoreDDMDeclarationGlobalSettings"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SUCoreDDMDeclarationGlobalSettings initWithDeclarationKeys:](self, "initWithDeclarationKeys:", v8);
  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclarationGlobalSettings enableGlobalNotifications](self, "enableGlobalNotifications");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v4 forKey:@"enableGlobalNotifications"];

  -[SUCoreDDMDeclarationGlobalSettings majorOSDeferralPeriod](self, "majorOSDeferralPeriod");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v5 forKey:@"majorOSDeferralPeriod"];

  -[SUCoreDDMDeclarationGlobalSettings minorOSDeferralPeriod](self, "minorOSDeferralPeriod");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v6 forKey:@"minorOSDeferralPeriod"];
  v7 = -[SUCoreDDMDeclarationGlobalSettings systemUpdatesDeferralPeriod](self, "systemUpdatesDeferralPeriod");
  [v3 setSafeObject:v7 forKey:@"systemUpdatesDeferralPeriod"];

  -[SUCoreDDMDeclarationGlobalSettings combinedUpdatesDeferralPeriod](self, "combinedUpdatesDeferralPeriod");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v8 forKey:@"combinedUpdatesDeferralPeriod"];
  v9 = -[SUCoreDDMDeclarationGlobalSettings recommendationCadence](self, "recommendationCadence");
  [v3 setSafeObject:v9 forKey:@"recommendationCadence"];

  -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallOSUpdates](self, "automaticallyInstallOSUpdates");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v10 forKey:@"automaticallyInstallOSUpdates"];
  v11 = -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallSystemAndSecurityUpdates]( self,  "automaticallyInstallSystemAndSecurityUpdates");
  [v3 setSafeObject:v11 forKey:@"automaticallyInstallSystemAndSecurityUpdates"];

  -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v12 forKey:@"automaticallyCheck"];
  v13 = -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
  [v3 setSafeObject:v13 forKey:@"automaticallyDownload"];

  -[SUCoreDDMDeclarationGlobalSettings adminInstallRequired](self, "adminInstallRequired");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v14 forKey:@"adminInstallRequired"];
  v15 = -[SUCoreDDMDeclarationGlobalSettings enableRapidSecurityResponse](self, "enableRapidSecurityResponse");
  [v3 setSafeObject:v15 forKey:@"enableRapidSecurityResponse"];

  -[SUCoreDDMDeclarationGlobalSettings enableRapidSecurityResponseRollback](self, "enableRapidSecurityResponseRollback");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v16 forKey:@"enableRapidSecurityResponseRollback"];
  v17 = -[SUCoreDDMDeclarationGlobalSettings serializedKeys](self, "serializedKeys");
  [v3 setSafeObject:v17 forKey:@"serializedKeys"];

  -[SUCoreDDMDeclarationGlobalSettings programEnrollment](self, "programEnrollment");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v18 forKey:@"programEnrollment"];
  v19 = -[SUCoreDDMDeclarationGlobalSettings offerPrograms](self, "offerPrograms");
  [v3 setSafeObject:v19 forKey:@"offerPrograms"];

  -[SUCoreDDMDeclarationGlobalSettings requireProgram](self, "requireProgram");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v20 forKey:@"requireProgram"];

  v21 = (void *)[v3 copy];
  return v21;
}

- (BOOL)isValidDeclarationWithReason:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallOSUpdates](self, "automaticallyInstallOSUpdates");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
        char v10 = [v9 BOOLValue];

        if (a3)
        {
          if ((v10 & 1) == 0)
          {
            BOOL result = 0;
            uint64_t v12 = @"Invalid global settings declaration: attempt to set automatically install OS updates to true while automatically download is false";
LABEL_17:
            *a3 = v12;
            return result;
          }
        }
      }
      v13 = -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
      if (v13)
      {
        -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        char v15 = [v14 BOOLValue];

        if (a3)
        {
          if ((v15 & 1) == 0)
          {
            BOOL result = 0;
            uint64_t v12 = @"Invalid global settings declaration: attempt to set automatically install OS updates to true while automatically check is false";
            goto LABEL_17;
          }
        }
      }
    }
  }

  -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
    int v18 = [v17 BOOLValue];

    if (v18)
    {
      v19 = -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
      if (v19)
      {
        -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        char v21 = [v20 BOOLValue];

        if (a3)
        {
          if ((v21 & 1) == 0)
          {
            BOOL result = 0;
            uint64_t v12 = @"Invalid global settings declaration: attempt to set automatically download OS updates to true while automatically check is false";
            goto LABEL_17;
          }
        }
      }
    }
  }

  if (a3)
  {
    -[SUCoreDDMDeclarationGlobalSettings description](self, "description");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      [v22 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_18A0F22B0];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return 1;
}

- (id)description
{
  v2 = (void *)NSString;
  v3 = -[SUCoreDDMDeclarationGlobalSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  [v2 stringWithFormat:@"SUCoreDDMDeclarationGlobalSettings: %@", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSNumber)enableGlobalNotifications
{
  return self->_enableGlobalNotifications;
}

- (void)setEnableGlobalNotifications:(id)a3
{
}

- (NSNumber)majorOSDeferralPeriod
{
  return self->_majorOSDeferralPeriod;
}

- (void)setMajorOSDeferralPeriod:(id)a3
{
}

- (NSNumber)minorOSDeferralPeriod
{
  return self->_minorOSDeferralPeriod;
}

- (void)setMinorOSDeferralPeriod:(id)a3
{
}

- (NSNumber)systemUpdatesDeferralPeriod
{
  return self->_systemUpdatesDeferralPeriod;
}

- (void)setSystemUpdatesDeferralPeriod:(id)a3
{
}

- (NSNumber)combinedUpdatesDeferralPeriod
{
  return self->_combinedUpdatesDeferralPeriod;
}

- (void)setCombinedUpdatesDeferralPeriod:(id)a3
{
}

- (NSNumber)recommendationCadence
{
  return self->_recommendationCadence;
}

- (void)setRecommendationCadence:(id)a3
{
}

- (NSNumber)automaticallyInstallOSUpdates
{
  return self->_automaticallyInstallOSUpdates;
}

- (void)setAutomaticallyInstallOSUpdates:(id)a3
{
}

- (NSNumber)automaticallyInstallSystemAndSecurityUpdates
{
  return self->_automaticallyInstallSystemAndSecurityUpdates;
}

- (void)setAutomaticallyInstallSystemAndSecurityUpdates:(id)a3
{
}

- (NSNumber)automaticallyCheck
{
  return self->_automaticallyCheck;
}

- (void)setAutomaticallyCheck:(id)a3
{
}

- (NSNumber)automaticallyDownload
{
  return self->_automaticallyDownload;
}

- (void)setAutomaticallyDownload:(id)a3
{
}

- (NSNumber)adminInstallRequired
{
  return self->_adminInstallRequired;
}

- (void)setAdminInstallRequired:(id)a3
{
}

- (NSNumber)enableRapidSecurityResponse
{
  return self->_enableRapidSecurityResponse;
}

- (void)setEnableRapidSecurityResponse:(id)a3
{
}

- (NSNumber)enableRapidSecurityResponseRollback
{
  return self->_enableRapidSecurityResponseRollback;
}

- (void)setEnableRapidSecurityResponseRollback:(id)a3
{
}

- (NSArray)serializedKeys
{
  return self->_serializedKeys;
}

- (void)setSerializedKeys:(id)a3
{
}

- (NSNumber)programEnrollment
{
  return self->_programEnrollment;
}

- (void)setProgramEnrollment:(id)a3
{
}

- (NSArray)offerPrograms
{
  return self->_offerPrograms;
}

- (void)setOfferPrograms:(id)a3
{
}

- (NSDictionary)requireProgram
{
  return self->_requireProgram;
}

- (void)setRequireProgram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end