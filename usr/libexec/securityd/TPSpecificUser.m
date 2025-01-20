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
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TPSpecificUser;
  v6 = -[TPSpecificUser init](&v27, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"cloudkit");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    cloudkitContainerName = v6->_cloudkitContainerName;
    v6->_cloudkitContainerName = (NSString *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), @"octagon");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    octagonContextID = v6->_octagonContextID;
    v6->_octagonContextID = (NSString *)v12;

    id v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), @"aaID");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    appleAccountID = v6->_appleAccountID;
    v6->_appleAccountID = (NSString *)v16;

    id v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), @"altDSID");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    altDSID = v6->_altDSID;
    v6->_altDSID = (NSString *)v20;

    v6->_isPrimaryAccount = [v4 decodeBoolForKey:@"isPrimary"];
    id v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), @"persona");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    personaUniqueString = v6->_personaUniqueString;
    v6->_personaUniqueString = (NSString *)v24;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  [v4 encodeObject:v5 forKey:@"cloudkit"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  [v4 encodeObject:v6 forKey:@"octagon"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  [v4 encodeObject:v7 forKey:@"aaID"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  [v4 encodeObject:v8 forKey:@"altDSID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount"),  @"isPrimary");
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  [v4 encodeObject:v9 forKey:@"persona"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TPSpecificUser, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudkitContainerName]);
    if (![v8 isEqualToString:v9])
    {
      unsigned __int8 v16 = 0;
LABEL_23:

      goto LABEL_24;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 octagonContextID]);
    if (![v10 isEqualToString:v11])
    {
      unsigned __int8 v16 = 0;
LABEL_22:

      goto LABEL_23;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 appleAccountID]);
    if (![v12 isEqualToString:v13])
    {
      unsigned __int8 v16 = 0;
LABEL_21:

      goto LABEL_22;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
    if (!objc_msgSend(v14, "isEqualToString:"))
    {
      unsigned __int8 v16 = 0;
      goto LABEL_20;
    }

    uint64_t v24 = v14;
    unsigned int v15 = -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount");
    if (v15 != [v7 isPrimaryAccount])
    {
      unsigned __int8 v16 = 0;
      uint64_t v14 = v24;
LABEL_20:

      goto LABEL_21;
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
    if (v17 || (uint64_t v21 = objc_claimAutoreleasedReturnValue([v7 personaUniqueString])) != 0)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
      id v23 = (void *)v17;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 personaUniqueString]);
      unsigned __int8 v16 = [v22 isEqualToString:v18];

      id v19 = v23;
      uint64_t v14 = v24;
      if (v23)
      {
LABEL_19:

        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v21 = 0LL;
      unsigned __int8 v16 = 1;
      uint64_t v14 = v24;
    }

    id v19 = (void *)v21;
    goto LABEL_19;
  }

  unsigned __int8 v16 = 0;
LABEL_24:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TPSpecificUser allocWithZone:](&OBJC_CLASS___TPSpecificUser, "allocWithZone:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  BOOL v9 = -[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
  id v11 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:]( v4,  "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:",  v5,  v6,  v7,  v8,  v9,  v10);

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser cloudkitContainerName](self, "cloudkitContainerName"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser octagonContextID](self, "octagonContextID"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser appleAccountID](self, "appleAccountID"));
  unint64_t v8 = (unint64_t)[v7 hash];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser personaUniqueString](self, "personaUniqueString"));
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
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSpecificUser altDSID](self, "altDSID"));
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