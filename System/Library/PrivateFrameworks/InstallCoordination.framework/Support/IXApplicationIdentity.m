@interface IXApplicationIdentity
+ (BOOL)supportsSecureCoding;
+ (id)identitiesForBundleIdentifiers:(id)a3;
- (BOOL)isPersonalPersonaPlaceholder;
- (BOOL)resolvePersonaRespectingSandboxingWithError:(id *)a3;
- (BOOL)resolvePersonaWithError:(id *)a3;
- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3;
- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3 personaUniqueString:(id)a4;
- (IXApplicationIdentity)initWithCoder:(id)a3;
- (IXApplicationIdentity)initWithPlistKeySerialization:(id)a3;
- (MIAppIdentity)miAppIdentity;
- (NSString)uniqueIdentifier;
- (id)canonicalSerializationForPlistKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(id)a3;
- (id)possibleSerializationsForPlistKey;
- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3;
- (void)setIsPersonalPersonaPlaceholder:(BOOL)a3;
@end

@implementation IXApplicationIdentity

+ (id)identitiesForBundleIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
        v11 = objc_alloc(&OBJC_CLASS___IXApplicationIdentity);
        v12 = -[IXApplicationIdentity initWithBundleIdentifier:](v11, "initWithBundleIdentifier:", v10, (void)v15);
        -[NSMutableArray addObject:](v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = -[NSMutableArray copy](v4, "copy");
  return v13;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3 personaUniqueString:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IXApplicationIdentity;
  id v5 = a4;
  id v6 = -[IXApplicationIdentity initWithBundleID:persona:](&v9, "initWithBundleID:persona:", a3, v5);
  id v7 = objc_msgSend(v5, "isEqualToString:", @"PersonalPersonaPlaceholderString", v9.receiver, v9.super_class);

  -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](v6, "setIsPersonalPersonaPlaceholder:", v7);
  return v6;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3
{
  return -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:]( self,  "initWithBundleIdentifier:personaUniqueString:",  a3,  @"PersonalPersonaPlaceholderString");
}

- (id)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userPersonaUniqueString]);

  if (v6)
  {
    self =  -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:]( self,  "initWithBundleIdentifier:personaUniqueString:",  v4,  v6);
    id v7 = self;
  }

  else
  {
    uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100079D18(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    id v7 = 0LL;
  }

  return v7;
}

- (IXApplicationIdentity)initWithPlistKeySerialization:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"/"]);
  if ([v5 count])
  {
    if ([v5 count] == (id)1)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    }

    else
    {
      if ([v5 count] != (id)2)
      {
        uint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_100079D88((uint64_t)v4, v5, v6);
        }
        uint64_t v10 = 0LL;
        id v7 = @"PersonalPersonaPlaceholderString";
        goto LABEL_18;
      }

      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
      unsigned __int8 v12 = [v11 isEqualToString:@"P"];

      if ((v12 & 1) == 0)
      {
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
        goto LABEL_5;
      }
    }

    id v7 = @"PersonalPersonaPlaceholderString";
LABEL_5:
    self = -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:]( self,  "initWithBundleIdentifier:personaUniqueString:",  v6,  v7);
    id v17 = 0LL;
    unsigned __int8 v8 = -[IXApplicationIdentity resolvePersonaWithError:](self, "resolvePersonaWithError:", &v17);
    id v9 = v17;
    if ((v8 & 1) != 0)
    {
      -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:]( self,  "setIsPersonalPersonaPlaceholder:",  -[__CFString isEqualToString:](v7, "isEqualToString:", @"PersonalPersonaPlaceholderString"));
      uint64_t v10 = self;
    }

    else
    {
      uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v19 = "-[IXApplicationIdentity initWithPlistKeySerialization:]";
        __int16 v20 = 2112;
        v21 = v7;
        __int16 v22 = 2112;
        v23 = v6;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "%s: Failed to resolve persona %@ for %@ : %@",  buf,  0x2Au);
      }

      uint64_t v10 = 0LL;
    }

LABEL_18:
    goto LABEL_19;
  }

  uint64_t v10 = 0LL;
LABEL_19:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IXApplicationIdentity;
  id v3 = -[IXApplicationIdentity copyWithZone:](&v6, "copyWithZone:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaUniqueString]);
  objc_msgSend( v3,  "setIsPersonalPersonaPlaceholder:",  objc_msgSend(v4, "isEqualToString:", @"PersonalPersonaPlaceholderString"));

  return v3;
}

- (NSString)uniqueIdentifier
{
  if (-[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder")) {
    id v3 = @"P";
  }
  else {
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity personaUniqueString](self, "personaUniqueString"));
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](self, "bundleID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v4, v3));

  return (NSString *)v5;
}

- (id)canonicalSerializationForPlistKey
{
  unsigned int v3 = -[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](self, "bundleID"));
  id v5 = (void *)v4;
  if (v3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v4));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity personaUniqueString](self, "personaUniqueString"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v5,  @"/",  v7));
  }

  return v6;
}

- (id)possibleSerializationsForPlistKey
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity canonicalSerializationForPlistKey](self, "canonicalSerializationForPlistKey"));
  v8[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](self, "bundleID"));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return v6;
}

- (id)description
{
  if (-[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder")) {
    unsigned int v3 = @"P";
  }
  else {
    unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity personaUniqueString](self, "personaUniqueString"));
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](self, "bundleID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%@/%@]", v4, v3));

  return v5;
}

- (IXApplicationIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IXApplicationIdentity;
  id v5 = -[IXApplicationIdentity initWithCoder:](&v24, "initWithCoder:", v4);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](v5, "bundleID"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity personaUniqueString](v5, "personaUniqueString"));
  unsigned __int8 v8 = (__CFString *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
LABEL_13:
    id v5 = v5;
    uint64_t v14 = v5;
    goto LABEL_14;
  }

  if (v6
    || (id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"],
        (objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10)) != 0LL))
  {
    if (!v8)
    {
      id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"personaUniqueString"];
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      if (v12) {
        unsigned __int8 v8 = (__CFString *)v12;
      }
      else {
        unsigned __int8 v8 = @"PersonalPersonaPlaceholderString";
      }
    }

    uint64_t v13 = -[IXApplicationIdentity initWithBundleID:persona:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleID:persona:",  v6,  v8);

    id v5 = v13;
    goto LABEL_13;
  }

  uint64_t v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_100079E30(v6, v17, v18, v19, v20, v21, v22, v23);
  }
  uint64_t v14 = 0LL;
LABEL_14:

  return v14;
}

- (BOOL)resolvePersonaWithError:(id *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IXApplicationIdentity;
  id v16 = 0LL;
  BOOL v5 = -[IXApplicationIdentity resolvePersonaWithError:](&v15, "resolvePersonaWithError:", &v16);
  id v6 = v16;
  if (!v5)
  {
    uint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100079EA0(self, (uint64_t)v6, v8);
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](self, "bundleID"));
    id v11 = sub_10003556C( (uint64_t)"-[IXApplicationIdentity resolvePersonaWithError:]",  234LL,  @"IXErrorDomain",  0x38uLL,  v6,  0LL,  @"Client provided invalid persona for %@",  v10,  (uint64_t)v9);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (a3)
    {
      id v6 = v12;
      *a3 = v6;
    }

    else
    {
      id v6 = v12;
    }
  }

  if (-[IXApplicationIdentity isResolved](self, "isResolved"))
  {
    -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](self, "setIsPersonalPersonaPlaceholder:", 0LL);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity personaUniqueString](self, "personaUniqueString"));
    -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:]( self,  "setIsPersonalPersonaPlaceholder:",  [v13 isEqualToString:@"PersonalPersonaPlaceholderString"]);
  }

  return v5;
}

- (MIAppIdentity)miAppIdentity
{
  unsigned int v3 = objc_alloc(&OBJC_CLASS___MIAppIdentity);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity bundleID](self, "bundleID"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXApplicationIdentity personaUniqueString](self, "personaUniqueString"));
  id v6 = -[MIAppIdentity initWithBundleID:persona:](v3, "initWithBundleID:persona:", v4, v5);

  -[MIAppIdentity setIsResolved:](v6, "setIsResolved:", -[IXApplicationIdentity isResolved](self, "isResolved"));
  return v6;
}

- (BOOL)resolvePersonaRespectingSandboxingWithError:(id *)a3
{
  if (!-[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder"))
  {
    id v5 = 0LL;
    BOOL v6 = 1;
    goto LABEL_11;
  }

  if (qword_1000E8E50 != -1) {
    dispatch_once(&qword_1000E8E50, &stru_1000CCF18);
  }
  if (byte_1000E8E40)
  {
    id v5 = 0LL;
    goto LABEL_8;
  }

  id v7 = (id) qword_1000E8E48;
  int v8 = byte_1000E8E40;
  id v5 = v7;
  if (v8)
  {
LABEL_8:
    id v11 = v5;
    BOOL v6 = -[IXApplicationIdentity resolvePersonaWithError:](self, "resolvePersonaWithError:", &v11);
    id v9 = v11;

    id v5 = v9;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  BOOL v6 = 0;
  if (!a3) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v6)
  {
    id v5 = v5;
    BOOL v6 = 0;
    *a3 = v5;
  }

- (BOOL)isPersonalPersonaPlaceholder
{
  return self->_isPersonalPersonaPlaceholder;
}

- (void)setIsPersonalPersonaPlaceholder:(BOOL)a3
{
  self->_isPersonalPersonaPlaceholder = a3;
}

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10007E594(v5);
  }

  id v7 = sub_10003556C( (uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]",  39LL,  MIInstallerErrorDomain,  0xA1uLL,  0LL,  0LL,  @"%s is not enabled",  v6,  (uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]");
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (a3) {
    *a3 = v8;
  }

  return 0LL;
}

@end