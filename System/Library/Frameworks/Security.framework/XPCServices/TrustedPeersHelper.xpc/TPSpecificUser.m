@interface TPSpecificUser
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimaryAccount;
- (NSString)altDSID;
- (NSString)appleAccountID;
- (NSString)cloudkitContainerName;
- (NSString)octagonContextID;
- (NSString)personaUniqueString;
- (TPSpecificUser)initWithCloudkitContainerName:(id)a3 octagonContextID:(id)a4 appleAccountID:(id)a5 altDSID:(id)a6 isPrimaryPersona:(BOOL)a7 personaUniqueString:(id)a8;
- (TPSpecificUser)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)makeCKContainer;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSpecificUser

- (TPSpecificUser)initWithCloudkitContainerName:(id)a3 octagonContextID:(id)a4 appleAccountID:(id)a5 altDSID:(id)a6 isPrimaryPersona:(BOOL)a7 personaUniqueString:(id)a8
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TPSpecificUser;
  v19 = -[TPSpecificUser init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_cloudkitContainerName, a3);
    else {
      v21 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v15,  v17));
    }
    octagonContextID = v20->_octagonContextID;
    v20->_octagonContextID = v21;

    objc_storeStrong((id *)&v20->_appleAccountID, a5);
    objc_storeStrong((id *)&v20->_altDSID, a6);
    v20->_isPrimaryAccount = a7;
    objc_storeStrong((id *)&v20->_personaUniqueString, a8);
  }

  return v20;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  if (-[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount")) {
    v7 = @"primary";
  }
  else {
    v7 = @"secondary";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TPSpecificUser: altDSID:%@ o:%@ ck:%@ p:%@/%@ aaID:%@>",  v3,  v4,  v5,  v6,  v7,  v8));

  return v9;
}

- (TPSpecificUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TPSpecificUser;
  v5 = -[TPSpecificUser init](&v22, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"cloudkit"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    cloudkitContainerName = v5->_cloudkitContainerName;
    v5->_cloudkitContainerName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"octagon"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    octagonContextID = v5->_octagonContextID;
    v5->_octagonContextID = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"aaID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    appleAccountID = v5->_appleAccountID;
    v5->_appleAccountID = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"altDSID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v16;

    v5->_isPrimaryAccount = [v4 decodeBoolForKey:@"isPrimary"];
    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"persona"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v19;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  [v4 encodeObject:v5 forKey:@"cloudkit"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  [v4 encodeObject:v6 forKey:@"octagon"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  [v4 encodeObject:v7 forKey:@"aaID"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  [v4 encodeObject:v8 forKey:@"altDSID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount"),  @"isPrimary");
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  [v4 encodeObject:v9 forKey:@"persona"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TPSpecificUser);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudkitContainerName]);
    if (![v7 isEqualToString:v8])
    {
      unsigned __int8 v15 = 0;
LABEL_23:

      goto LABEL_24;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 octagonContextID]);
    if (![v9 isEqualToString:v10])
    {
      unsigned __int8 v15 = 0;
LABEL_22:

      goto LABEL_23;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 appleAccountID]);
    if (![v11 isEqualToString:v12])
    {
      unsigned __int8 v15 = 0;
LABEL_21:

      goto LABEL_22;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    if (!objc_msgSend(v13, "isEqualToString:"))
    {
      unsigned __int8 v15 = 0;
      goto LABEL_20;
    }

    v23 = v13;
    unsigned int v14 = -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount");
    if (v14 != [v6 isPrimaryAccount])
    {
      unsigned __int8 v15 = 0;
      uint64_t v13 = v23;
LABEL_20:

      goto LABEL_21;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
    if (v16 || (uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 personaUniqueString])) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
      objc_super v22 = (void *)v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
      unsigned __int8 v15 = [v21 isEqualToString:v17];

      id v18 = v22;
      uint64_t v13 = v23;
      if (v22)
      {
LABEL_19:

        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v20 = 0LL;
      unsigned __int8 v15 = 1;
      uint64_t v13 = v23;
    }

    id v18 = (void *)v20;
    goto LABEL_19;
  }

  unsigned __int8 v15 = 0;
LABEL_24:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TPSpecificUser allocWithZone:](&OBJC_CLASS___TPSpecificUser, "allocWithZone:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  BOOL v9 = -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  v11 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:]( v4,  "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:",  v5,  v6,  v7,  v8,  v9,  v10);

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  unint64_t v8 = (unint64_t)[v7 hash];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  unint64_t v12 = v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (id)makeCKContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerIDForContainerIdentifier:]( &OBJC_CLASS___CKContainer,  "containerIDForContainerIdentifier:",  v3));

  id v5 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  [v5 setBypassPCSEncryption:1];
  if (!-[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount"))
  {
    id v6 = objc_alloc(&OBJC_CLASS___CKAccountOverrideInfo);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
    id v8 = [v6 initWithAltDSID:v7];
    [v5 setAccountOverrideInfo:v8];
  }

  BOOL v9 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v4,  v5);

  return v9;
}

- (NSString)cloudkitContainerName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)appleAccountID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)octagonContextID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (BOOL)isPrimaryAccount
{
  return self->_isPrimaryAccount;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end