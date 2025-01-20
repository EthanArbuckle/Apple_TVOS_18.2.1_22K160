@interface MIAppIdentity
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateAppIdentity:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResolved;
- (BOOL)resolvePersonaWithError:(id *)a3;
- (MIAppIdentity)initWithBundleID:(id)a3;
- (MIAppIdentity)initWithBundleID:(id)a3 persona:(id)a4;
- (MIAppIdentity)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)personaUniqueString;
- (id)_eligiblePersonaForBundle:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setIsResolved:(BOOL)a3;
- (void)setPersonaUniqueString:(id)a3;
@end

@implementation MIAppIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppIdentity)initWithBundleID:(id)a3 persona:(id)a4
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MIAppIdentity;
  v9 = -[MIAppIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        -[MIAppIdentity initWithBundleID:persona:].cold.1((uint64_t)v7);
      }
      v8 = @"PersonalPersonaPlaceholderString";
    }

    objc_storeStrong((id *)&v10->_personaUniqueString, v8);
    v10->_isResolved = 0;
  }

  return v10;
}

- (MIAppIdentity)initWithBundleID:(id)a3
{
  return -[MIAppIdentity initWithBundleID:persona:]( self,  "initWithBundleID:persona:",  a3,  @"PersonalPersonaPlaceholderString");
}

- (MIAppIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIAppIdentity;
  v5 = -[MIAppIdentity init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v8;

    v5->_isResolved = [v4 decodeBoolForKey:@"isResolved"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[MIAppIdentity bundleID](self, "bundleID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"bundleID"];
  v5 = -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  [v6 encodeObject:v5 forKey:@"personaUniqueString"];

  objc_msgSend(v6, "encodeBool:forKey:", -[MIAppIdentity isResolved](self, "isResolved"), @"isResolved");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = -[MIAppIdentity bundleID](self, "bundleID");
  [v4 setBundleID:v5];

  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setPersonaUniqueString:v6];

  objc_msgSend(v4, "setIsResolved:", -[MIAppIdentity isResolved](self, "isResolved"));
  return v4;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MIAppIdentity *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIAppIdentity bundleID](self, "bundleID");
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppIdentity bundleID](v5, "bundleID");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
        v10 = -[MIAppIdentity personaUniqueString](v5, "personaUniqueString");
        BOOL v11 = MICompareObjects(v9, v10);
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = (void *)NSString;
  -[MIAppIdentity bundleID](self, "bundleID");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  [v3 stringWithFormat:@"[%@/%@]", v4, v5];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)validateAppIdentity:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v7 = v5;
  if (v5)
  {
    [v5 bundleID];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v7 personaUniqueString];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        id v10 = 0LL;
        BOOL v11 = 1;
        goto LABEL_11;
      }

      objc_super v12 = @"app identity has nil personaUniqueString";
      uint64_t v13 = 147LL;
    }

    else
    {
      objc_super v12 = @"app identity has nil bundle identifier";
      uint64_t v13 = 142LL;
    }
  }

  else
  {
    objc_super v12 = @"app identity is nil";
    uint64_t v13 = 137LL;
  }

  _CreateError( (uint64_t)"+[MIAppIdentity validateAppIdentity:withError:]",  v13,  @"MIInstallerErrorDomain",  25LL,  0LL,  0LL,  v12,  v6,  v15);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v10 = v10;
    BOOL v11 = 0;
    *a4 = v10;
  }

  else
  {
    BOOL v11 = 0;
  }

- (id)_eligiblePersonaForBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  +[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 systemAppPlaceholderBundleIDs];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    [v7 primaryPersonaUniqueString];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v12 = 0LL;
    goto LABEL_18;
  }

  id v28 = 0LL;
  +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v6,  2LL,  &v28);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v28;
  objc_super v12 = v14;
  if (!v13)
  {
    [v14 domain];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v19 isEqualToString:@"MIContainerManagerErrorDomain"])
    {
      uint64_t v20 = [v12 code];

      if (v20 == 21) {
        goto LABEL_25;
      }
    }

    else
    {
    }

    BOOL v11 = 0LL;
LABEL_18:
    uint64_t v13 = 0LL;
    if (!a4) {
      goto LABEL_28;
    }
LABEL_26:
    if (!v11)
    {
      id v16 = v12;
      *a4 = v16;
      goto LABEL_29;
    }

- (BOOL)resolvePersonaWithError:(id *)a3
{
  BOOL v5 = -[MIAppIdentity isResolved](self, "isResolved");
  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppIdentity bundleID](self, "bundleID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v8 = 0LL;
    id v9 = 0LL;
    BOOL v10 = 1;
    goto LABEL_30;
  }

  +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 isSharediPad];

  if (v12)
  {
    [NSString stringWithUTF8String:*MEMORY[0x1895F8380]];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0LL;
    goto LABEL_5;
  }

  if (v6)
  {
    if ([v6 isEqualToString:@"Invalid"])
    {
      _CreateAndLogError( (uint64_t)"-[MIAppIdentity resolvePersonaWithError:]",  238LL,  @"MIInstallerErrorDomain",  191LL,  0LL,  0LL,  @"Client provided invalid persona for %@",  v13,  (uint64_t)v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!a3) {
        goto LABEL_29;
      }
LABEL_26:
      id v8 = v8;
      BOOL v10 = 0;
      id v9 = 0LL;
      *a3 = v8;
      goto LABEL_30;
    }

    if ([v6 isEqualToString:@"PersonalPersonaPlaceholderString"])
    {
      id v32 = 0LL;
      -[MIAppIdentity _eligiblePersonaForBundle:error:](self, "_eligiblePersonaForBundle:error:", v7, &v32);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v32;
      if (!v9)
      {
        _CreateAndLogError( (uint64_t)"-[MIAppIdentity resolvePersonaWithError:]",  243LL,  @"MIInstallerErrorDomain",  191LL,  v8,  0LL,  @"Failed to resolve persona %@",  v15,  (uint64_t)self);
        goto LABEL_25;
      }

      goto LABEL_5;
    }

    +[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = 0LL;
    char v17 = [v16 isKnownPersonaUniqueString:v6 error:&v31];
    id v19 = v31;
    if ((v17 & 1) != 0)
    {
      [v16 systemPersonaUniqueString];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = [v6 isEqualToString:v20];

      if (!v21)
      {
        id v8 = v19;
LABEL_32:
        id v9 = v6;

        id v6 = v9;
        goto LABEL_5;
      }

      id v30 = v19;
      [v16 multiPersonaSADAppBundleIDsWithError:&v30];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v30;

      if (v22)
      {
        if ([v22 containsObject:v7])
        {
          uint64_t v23 = [v16 primaryPersonaUniqueString];

          id v6 = (void *)v23;
        }

        goto LABEL_32;
      }
    }

    else
    {
      _CreateAndLogError( (uint64_t)"-[MIAppIdentity resolvePersonaWithError:]",  250LL,  @"MIInstallerErrorDomain",  191LL,  v19,  0LL,  @"Client provided invalid persona for %@",  v18,  (uint64_t)v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (a3) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }

  id v29 = 0LL;
  -[MIAppIdentity _eligiblePersonaForBundle:error:](self, "_eligiblePersonaForBundle:error:", v7, &v29);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v29;
  if (!v9)
  {
    _CreateAndLogError( (uint64_t)"-[MIAppIdentity resolvePersonaWithError:]",  271LL,  @"MIInstallerErrorDomain",  191LL,  v8,  0LL,  @"Failed to resolve persona %@",  v14,  (uint64_t)self);
    uint64_t v24 = LABEL_25:;

    id v8 = (id)v24;
    if (a3) {
      goto LABEL_26;
    }
LABEL_29:
    BOOL v10 = 0;
    id v9 = 0LL;
    goto LABEL_30;
  }

  id v6 = 0LL;
LABEL_5:
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v27 = v6;
    id v28 = v9;
    id v26 = v7;
    MOLogWrite();
  }

  -[MIAppIdentity setPersonaUniqueString:](self, "setPersonaUniqueString:", v9, v26, v27, v28);
  BOOL v10 = 1;
  -[MIAppIdentity setIsResolved:](self, "setIsResolved:", 1LL);
LABEL_30:

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (BOOL)isResolved
{
  return self->_isResolved;
}

- (void)setIsResolved:(BOOL)a3
{
  self->_isResolved = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithBundleID:(uint64_t)a1 persona:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = 136315394;
  v2 = "-[MIAppIdentity initWithBundleID:persona:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl( &dword_183D22000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%s: Unexpectedly got nil persona for %@",  (uint8_t *)&v1,  0x16u);
}

@end