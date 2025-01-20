@interface IDSTemporaryPhoneUser
+ (BOOL)supportsSecureCoding;
- (BOOL)finishedRegistration;
- (BOOL)hasBeenProvisioned;
- (BOOL)hasNotifiedSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTemporaryPhoneUser:(id)a3;
- (BOOL)isIdenticalToUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSPhoneUser)phoneUser;
- (IDSTemporaryPhoneUser)initWithCoder:(id)a3;
- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3;
- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3 expirationDate:(id)a4 finishedRegistration:(BOOL)a5;
- (IDSTemporaryPhoneUser)temporaryPhoneUserWithFinishedRegistration;
- (IDSTemporaryPhoneUser)temporaryPhoneUserWithNotifiedSuccess;
- (IDSTemporaryPhoneUser)temporaryPhoneUserWithUpdatedExpirationDate:(id)a3;
- (NSDate)expirationDate;
- (NSString)countryCode;
- (NSString)description;
- (NSString)labelID;
- (NSString)networkCode;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)storageIdentifier;
- (id)uniqueIdentifier;
- (id)unprefixedIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFinishedRegistration:(BOOL)a3;
- (void)setHasBeenProvisioned:(BOOL)a3;
- (void)setHasNotifiedSuccess:(BOOL)a3;
- (void)setPhoneUser:(id)a3;
@end

@implementation IDSTemporaryPhoneUser

- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
  v6 = -[IDSTemporaryPhoneUser initWithPhoneUser:expirationDate:finishedRegistration:]( self,  "initWithPhoneUser:expirationDate:finishedRegistration:",  v4,  v5,  0LL);

  return v6;
}

- (IDSTemporaryPhoneUser)initWithPhoneUser:(id)a3 expirationDate:(id)a4 finishedRegistration:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSTemporaryPhoneUser;
  v11 = -[IDSTemporaryPhoneUser init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_phoneUser, a3);
    objc_storeStrong((id *)&v12->_expirationDate, a4);
    v12->_finishedRegistration = a5;
  }

  return v12;
}

- (IDSTemporaryPhoneUser)temporaryPhoneUserWithUpdatedExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = -[IDSTemporaryPhoneUser copy](self, "copy");
  [v5 setExpirationDate:v4];

  [v5 setHasBeenProvisioned:1];
  return (IDSTemporaryPhoneUser *)v5;
}

- (IDSTemporaryPhoneUser)temporaryPhoneUserWithFinishedRegistration
{
  id v2 = -[IDSTemporaryPhoneUser copy](self, "copy");
  [v2 setFinishedRegistration:1];
  return (IDSTemporaryPhoneUser *)v2;
}

- (IDSTemporaryPhoneUser)temporaryPhoneUserWithNotifiedSuccess
{
  id v2 = -[IDSTemporaryPhoneUser copy](self, "copy");
  [v2 setHasNotifiedSuccess:1];
  return (IDSTemporaryPhoneUser *)v2;
}

- (id)uniqueIdentifier
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneNumber](self, "phoneNumber"));
  id v4 = (void *)v3;
  id v5 = &stru_100912B50;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([@"tp" stringByAppendingString:v8]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v6]);

  return v10;
}

- (int64_t)realm
{
  return 2LL;
}

- (id)realmPrefixedIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 realmPrefixedIdentifier]);

  return v3;
}

- (id)unprefixedIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 unprefixedIdentifier]);

  return v3;
}

- (id)storageIdentifier
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 storageIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([@"tp" stringByAppendingString:v3]);

  return v4;
}

- (NSString)phoneNumber
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 phoneNumber]);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 phoneBookNumber]);
  }

  return (NSString *)v6;
}

- (NSString)countryCode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 countryCode]);

  return (NSString *)v3;
}

- (NSString)networkCode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 networkCode]);

  return (NSString *)v3;
}

- (NSString)labelID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 labelID]);

  return (NSString *)v3;
}

- (BOOL)shouldReplace:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser uniqueIdentifier](self, "uniqueIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSTemporaryPhoneUser isEqualToTemporaryPhoneUser:](self, "isEqualToTemporaryPhoneUser:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToTemporaryPhoneUser:(id)a3
{
  id v4 = (IDSTemporaryPhoneUser *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser uniqueIdentifier](v4, "uniqueIdentifier"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser uniqueIdentifier](self, "uniqueIdentifier"));
    if ([v6 isEqualToString:v7])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneNumber](v5, "phoneNumber"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneNumber](self, "phoneNumber"));
      unsigned __int8 v10 = [v8 isEqualToString:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isIdenticalToUser:(id)a3
{
  id v4 = a3;
  if (-[IDSTemporaryPhoneUser isEqualToUser:](self, "isEqualToUser:", v4))
  {
    id v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 expirationDate]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser expirationDate](self, "expirationDate"));
    if ([v6 isEqualToDate:v7]
      && (unsigned int v8 = [v5 finishedRegistration],
          v8 == -[IDSTemporaryPhoneUser finishedRegistration](self, "finishedRegistration"))
      && (unsigned int v9 = [v5 hasBeenProvisioned],
          v9 == -[IDSTemporaryPhoneUser hasBeenProvisioned](self, "hasBeenProvisioned")))
    {
      unsigned int v12 = [v5 hasNotifiedSuccess];
      unsigned int v10 = v12 ^ -[IDSTemporaryPhoneUser hasNotifiedSuccess](self, "hasNotifiedSuccess") ^ 1;
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSTemporaryPhoneUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(IDSPhoneUser, v5),  @"phoneUser");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v8), @"expiration");
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v11), @"finished");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 BOOLValue];

  id v15 = [v4 decodeBoolForKey:@"Provisioned"];
  id v16 = [v4 decodeBoolForKey:@"notifiedSuccess"];

  v17 =  -[IDSTemporaryPhoneUser initWithPhoneUser:expirationDate:finishedRegistration:]( self,  "initWithPhoneUser:expirationDate:finishedRegistration:",  v7,  v10,  v14);
  -[IDSTemporaryPhoneUser setHasBeenProvisioned:](v17, "setHasBeenProvisioned:", v15);
  -[IDSTemporaryPhoneUser setHasNotifiedSuccess:](v17, "setHasNotifiedSuccess:", v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  [v7 encodeObject:v4 forKey:@"phoneUser"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser expirationDate](self, "expirationDate"));
  [v7 encodeObject:v5 forKey:@"expiration"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSTemporaryPhoneUser finishedRegistration](self, "finishedRegistration")));
  [v7 encodeObject:v6 forKey:@"finished"];

  objc_msgSend( v7,  "encodeBool:forKey:",  -[IDSTemporaryPhoneUser hasBeenProvisioned](self, "hasBeenProvisioned"),  @"Provisioned");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[IDSTemporaryPhoneUser hasNotifiedSuccess](self, "hasNotifiedSuccess"),  @"notifiedSuccess");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class(self, a2));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneUser](self, "phoneUser"));
  id v6 = [v5 copy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser expirationDate](self, "expirationDate"));
  id v8 = objc_msgSend( v4,  "initWithPhoneUser:expirationDate:finishedRegistration:",  v6,  v7,  -[IDSTemporaryPhoneUser finishedRegistration](self, "finishedRegistration"));

  objc_msgSend(v8, "setHasNotifiedSuccess:", -[IDSTemporaryPhoneUser hasNotifiedSuccess](self, "hasNotifiedSuccess"));
  objc_msgSend(v8, "setHasBeenProvisioned:", -[IDSTemporaryPhoneUser hasBeenProvisioned](self, "hasBeenProvisioned"));
  return v8;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser uniqueIdentifier](self, "uniqueIdentifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser phoneNumber](self, "phoneNumber"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUser expirationDate](self, "expirationDate"));
  unsigned int v7 = -[IDSTemporaryPhoneUser finishedRegistration](self, "finishedRegistration");
  id v8 = @"NO";
  if (v7) {
    id v8 = @"YES";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> uid: %@, pn: %@, expiration: %@, finished : %@",  v3,  self,  v4,  v5,  v6,  v8));

  return (NSString *)v9;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)hasBeenProvisioned
{
  return self->_hasBeenProvisioned;
}

- (void)setHasBeenProvisioned:(BOOL)a3
{
  self->_hasBeenProvisioned = a3;
}

- (BOOL)finishedRegistration
{
  return self->_finishedRegistration;
}

- (void)setFinishedRegistration:(BOOL)a3
{
  self->_finishedRegistration = a3;
}

- (BOOL)hasNotifiedSuccess
{
  return self->_hasNotifiedSuccess;
}

- (void)setHasNotifiedSuccess:(BOOL)a3
{
  self->_hasNotifiedSuccess = a3;
}

- (IDSPhoneUser)phoneUser
{
  return self->_phoneUser;
}

- (void)setPhoneUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end