@interface IDSPhoneUser
+ (BOOL)supportsSecureCoding;
- (BOOL)differsFromPhoneNumber:(id)a3;
- (BOOL)isDefaultUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPhoneUser:(id)a3;
- (BOOL)isIdenticalToUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSPhoneUser)initWithCoder:(id)a3;
- (IDSPhoneUser)initWithLabelID:(id)a3;
- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4;
- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4 isDefaultUser:(BOOL)a5 countryCode:(id)a6 networkCode:(id)a7;
- (IDSPhoneUser)phoneUserWithUpdatedDefaultUser:(BOOL)a3 countryCode:(id)a4 networkCode:(id)a5;
- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3;
- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3 phoneBookNumber:(id)a4;
- (NSString)countryCode;
- (NSString)description;
- (NSString)labelID;
- (NSString)networkCode;
- (NSString)phoneBookNumber;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)unprefixedIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIsDefaultUser:(BOOL)a3;
- (void)setNetworkCode:(id)a3;
- (void)setPhoneBookNumber:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation IDSPhoneUser

- (IDSPhoneUser)initWithLabelID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSPhoneUser;
  v6 = -[IDSPhoneUser init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_labelID, a3);
  }

  return v7;
}

- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSPhoneUser;
  objc_super v9 = -[IDSPhoneUser init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_labelID, a3);
    objc_storeStrong((id *)&v10->_phoneBookNumber, a4);
  }

  return v10;
}

- (IDSPhoneUser)initWithLabelID:(id)a3 phoneBookNumber:(id)a4 isDefaultUser:(BOOL)a5 countryCode:(id)a6 networkCode:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSPhoneUser;
  v17 = -[IDSPhoneUser init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_labelID, a3);
    objc_storeStrong((id *)&v18->_phoneBookNumber, a4);
    v18->_isDefaultUser = a5;
    objc_storeStrong((id *)&v18->_countryCode, a6);
    objc_storeStrong((id *)&v18->_networkCode, a7);
  }

  return v18;
}

- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3 phoneBookNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[IDSPhoneUser copy](self, "copy");
  [v8 setPhoneNumber:v7];

  [v8 setPhoneBookNumber:v6];
  return (IDSPhoneUser *)v8;
}

- (IDSPhoneUser)phoneUserWithUpdatedPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = -[IDSPhoneUser copy](self, "copy");
  [v5 setPhoneNumber:v4];

  return (IDSPhoneUser *)v5;
}

- (IDSPhoneUser)phoneUserWithUpdatedDefaultUser:(BOOL)a3 countryCode:(id)a4 networkCode:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = -[IDSPhoneUser copy](self, "copy");
  [v10 setIsDefaultUser:v6];
  [v10 setCountryCode:v9];

  [v10 setNetworkCode:v8];
  return (IDSPhoneUser *)v10;
}

- (int64_t)realm
{
  return 0LL;
}

- (id)realmPrefixedIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser unprefixedIdentifier](self, "unprefixedIdentifier"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser unprefixedIdentifier](self, "unprefixedIdentifier"));
    uint64_t v5 = IMFormatPhoneNumber(v4, 1LL);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser unprefixedIdentifier](self, "unprefixedIdentifier"));
    }
    id v9 = v8;

    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"P:",  v9));
  }

  return v3;
}

- (id)unprefixedIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](self, "phoneBookNumber"));
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)shouldReplace:(id)a3
{
  id v4 = a3;
  if ([v4 realm]
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSPhoneUser, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0))
  {
    BOOL v8 = 0;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumber]);
    if (v7)
    {
      BOOL v8 = 0;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
      BOOL v8 = v10 != 0LL;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser uniqueIdentifier](self, "uniqueIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSPhoneUser isEqualToPhoneUser:](self, "isEqualToPhoneUser:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToPhoneUser:(id)a3
{
  id v4 = (IDSPhoneUser *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser uniqueIdentifier](v4, "uniqueIdentifier"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser uniqueIdentifier](self, "uniqueIdentifier"));
    if (![v6 isEqualToString:v7])
    {
      unsigned __int8 v13 = 0;
LABEL_16:

      goto LABEL_17;
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](v5, "phoneNumber"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
    if (v8 == v9)
    {
      objc_super v12 = -[IDSPhoneUser phoneBookNumber](v5, "phoneBookNumber", v20, v22);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](v5, "phoneNumber"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
      if (![v10 isEqualToString:v11])
      {
        unsigned __int8 v13 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }

      objc_super v12 = -[IDSPhoneUser phoneBookNumber](v5, "phoneBookNumber", v11, v10);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](self, "phoneBookNumber"));
    if (v14 == (void *)v15)
    {

      unsigned __int8 v13 = 1;
    }

    else
    {
      id v16 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](v5, "phoneBookNumber"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](self, "phoneBookNumber"));
      unsigned __int8 v13 = [v17 isEqualToString:v18];
    }

    v11 = v21;
    id v10 = v23;
    if (v8 == v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unsigned __int8 v13 = 1;
LABEL_17:

  return v13;
}

- (BOOL)isIdenticalToUser:(id)a3
{
  id v4 = a3;
  if (-[IDSPhoneUser isEqualToUser:](self, "isEqualToUser:", v4))
  {
    id v5 = v4;
    unsigned int v6 = [v5 isDefaultUser];
    if (v6 == -[IDSPhoneUser isDefaultUser](self, "isDefaultUser"))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCode]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser countryCode](self, "countryCode"));
      if ([v8 isEqualToString:v9])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 networkCode]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser networkCode](self, "networkCode"));
        unsigned __int8 v7 = [v10 isEqualToString:v11];
      }

      else
      {
        unsigned __int8 v7 = 0;
      }
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)differsFromPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ([v4 hasPrefix:@"+"])
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"+"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByRemovingCharactersFromSet:v6]);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
    unsigned int v9 = +[IDSCTAdapter isPhoneNumber:equivalentToExistingPhoneNumber:]( &OBJC_CLASS___IDSCTAdapter,  "isPhoneNumber:equivalentToExistingPhoneNumber:",  v8,  v5) ^ 1;
  }

  else
  {
    LOBYTE(v9) = 1;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](self, "phoneBookNumber"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](self, "phoneBookNumber"));
    unsigned int v12 = +[IDSCTAdapter isPhoneNumber:equivalentToExistingPhoneNumber:]( &OBJC_CLASS___IDSCTAdapter,  "isPhoneNumber:equivalentToExistingPhoneNumber:",  v11,  v5) ^ 1;
  }

  else
  {
    LOBYTE(v12) = 1;
  }

  return v9 & v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPhoneUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"labelID");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    id v9 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v7),  @"phoneNumber");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v12 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v11),  @"phoneBookNumber");
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = [v4 decodeBoolForKey:@"defaultUser"];
    id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v15),  @"countryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"networkCode");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = -[IDSPhoneUser initWithLabelID:](self, "initWithLabelID:", v8);
    -[IDSPhoneUser setPhoneNumber:](v21, "setPhoneNumber:", v10);
    -[IDSPhoneUser setPhoneBookNumber:](v21, "setPhoneBookNumber:", v13);
    -[IDSPhoneUser setIsDefaultUser:](v21, "setIsDefaultUser:", v14);
    -[IDSPhoneUser setCountryCode:](v21, "setCountryCode:", v17);
    -[IDSPhoneUser setNetworkCode:](v21, "setNetworkCode:", v20);

    self = v21;
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  labelID = self->_labelID;
  id v5 = a3;
  [v5 encodeObject:labelID forKey:@"labelID"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_phoneBookNumber forKey:@"phoneBookNumber"];
  [v5 encodeBool:self->_isDefaultUser forKey:@"defaultUser"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_networkCode forKey:@"networkCode"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend( objc_alloc((Class)objc_opt_class(self, a2)),  "initWithLabelID:phoneBookNumber:",  self->_labelID,  self->_phoneBookNumber);
  [v4 setPhoneNumber:self->_phoneNumber];
  [v4 setIsDefaultUser:self->_isDefaultUser];
  [v4 setCountryCode:self->_countryCode];
  [v4 setNetworkCode:self->_networkCode];
  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser uniqueIdentifier](self, "uniqueIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneNumber](self, "phoneNumber"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser phoneBookNumber](self, "phoneBookNumber"));
  unsigned int v7 = -[IDSPhoneUser isDefaultUser](self, "isDefaultUser");
  BOOL v8 = @"NO";
  if (v7) {
    BOOL v8 = @"YES";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> uid: %@ pn: %@, pbn: %@, def: %@",  v3,  self,  v4,  v5,  v6,  v8));

  return (NSString *)v9;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneBookNumber
{
  return self->_phoneBookNumber;
}

- (void)setPhoneBookNumber:(id)a3
{
}

- (NSString)labelID
{
  return self->_labelID;
}

- (BOOL)isDefaultUser
{
  return self->_isDefaultUser;
}

- (void)setIsDefaultUser:(BOOL)a3
{
  self->_isDefaultUser = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)networkCode
{
  return self->_networkCode;
}

- (void)setNetworkCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end