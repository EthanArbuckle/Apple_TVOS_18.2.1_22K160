@interface CSDThumperAccount
+ (id)phoneNumberMCCToISOCountryCodeTransformBlock;
+ (void)setPhoneNumberMCCToISOCountryCodeTransformBlock:(id)a3;
- (BOOL)containsRegisteredDeviceID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (CSDThumperAccount)init;
- (CSDThumperAccount)initWithAccountID:(id)a3 primaryDeviceID:(id)a4 phoneNumberURI:(id)a5 availableDeviceSlots:(int64_t)a6 allowedSecondaryDeviceIDs:(id)a7;
- (CSDThumperAccount)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSSet)allowedSecondaryDeviceIDs;
- (NSString)accountID;
- (NSString)phoneNumberURI;
- (NSString)primaryDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)availableDeviceSlots;
- (unint64_t)hash;
- (void)setAccountID:(id)a3;
- (void)setAllowedSecondaryDeviceIDs:(id)a3;
- (void)setAvailableDeviceSlots:(int64_t)a3;
- (void)setPhoneNumberURI:(id)a3;
- (void)setPrimaryDeviceID:(id)a3;
@end

@implementation CSDThumperAccount

- (CSDThumperAccount)init
{
  return 0LL;
}

- (CSDThumperAccount)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSAccountId]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSPrimaryDeviceId]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSAccountFreeSlots]);
  id v30 = [v5 integerValue];

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSMdn]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSMcc]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSIsoMcc]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  v33 = self;
  v34 = v8;
  v31 = (void *)v7;
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v12 = v8;
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v11);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
    {
      id v15 = objc_msgSend((id)objc_opt_class(self, v14), "phoneNumberMCCToISOCountryCodeTransformBlock");
      v16 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = v16[2](v16, v7);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v17);
    }

    else
    {
      id v12 = 0LL;
    }
  }

  v32 = (void *)v6;
  v18 = (void *)IDSCopyIDForPhoneNumberWithOptions(v6, v12, 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSDeviceList]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v19 count]));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v21 = v19;
  id v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v38;
    uint64_t v25 = kPSDeviceId;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v37 + 1) + 8 * (void)i) objectForKeyedSubscript:v25]);
        if (v27) {
          [v20 addObject:v27];
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v23);
  }

  if (v36 && v35 && v18)
  {
    v28 = -[CSDThumperAccount initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:]( v33,  "initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:",  v36,  v35,  v18,  v30,  v20);
  }

  else
  {

    v28 = 0LL;
  }

  return v28;
}

- (CSDThumperAccount)initWithAccountID:(id)a3 primaryDeviceID:(id)a4 phoneNumberURI:(id)a5 availableDeviceSlots:(int64_t)a6 allowedSecondaryDeviceIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CSDThumperAccount;
  v16 = -[CSDThumperAccount init](&v26, "init");
  if (v16)
  {
    uint64_t v17 = (NSString *)[v12 copy];
    accountID = v16->_accountID;
    v16->_accountID = v17;

    v19 = (NSString *)[v13 copy];
    primaryDeviceID = v16->_primaryDeviceID;
    v16->_primaryDeviceID = v19;

    id v21 = (NSString *)[v14 copy];
    phoneNumberURI = v16->_phoneNumberURI;
    v16->_phoneNumberURI = v21;

    id v23 = (NSSet *)[v15 copy];
    allowedSecondaryDeviceIDs = v16->_allowedSecondaryDeviceIDs;
    v16->_allowedSecondaryDeviceIDs = v23;

    v16->_availableDeviceSlots = a6;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___CSDThumperAccount);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount accountID](self, "accountID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](self, "primaryDeviceID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount phoneNumberURI](self, "phoneNumberURI"));
  int64_t v8 = -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount allowedSecondaryDeviceIDs](self, "allowedSecondaryDeviceIDs"));
  uint64_t v10 = -[CSDThumperAccount initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:]( v4,  "initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:",  v5,  v6,  v7,  v8,  v9);

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___CSDMutableThumperAccount);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount accountID](self, "accountID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](self, "primaryDeviceID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount phoneNumberURI](self, "phoneNumberURI"));
  int64_t v8 = -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount allowedSecondaryDeviceIDs](self, "allowedSecondaryDeviceIDs"));
  uint64_t v10 = -[CSDThumperAccount initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:]( v4,  "initWithAccountID:primaryDeviceID:phoneNumberURI:availableDeviceSlots:allowedSecondaryDeviceIDs:",  v5,  v6,  v7,  v8,  v9);

  return v10;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@ %p ", objc_opt_class(self, v4), self);
  v5 = NSStringFromSelector("accountID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount accountID](self, "accountID"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v6, v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  int64_t v8 = NSStringFromSelector("primaryDeviceID");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](self, "primaryDeviceID"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v9, v10);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  uint64_t v11 = NSStringFromSelector("phoneNumberURI");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount phoneNumberURI](self, "phoneNumberURI"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v12, v13);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  id v14 = NSStringFromSelector("availableDeviceSlots");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@=%ld",  v15,  -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots"));

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v16 = NSStringFromSelector("allowedSecondaryDeviceIDs");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount allowedSecondaryDeviceIDs](self, "allowedSecondaryDeviceIDs"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v17, v18);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  id v19 = -[NSMutableString copy](v3, "copy");

  return v19;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount accountID](self, "accountID"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](self, "primaryDeviceID"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount phoneNumberURI](self, "phoneNumberURI"));
  unint64_t v8 = (unint64_t)[v7 hash];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount allowedSecondaryDeviceIDs](self, "allowedSecondaryDeviceIDs"));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  unint64_t v11 = v10 ^ -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CSDThumperAccount *)a3;
  if (self == v5)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___CSDThumperAccount, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      BOOL v7 = -[CSDThumperAccount isEqualToAccount:](self, "isEqualToAccount:", v5);
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount accountID](self, "accountID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
  if (TUStringsAreEqualOrNil(v5, v6))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](self, "primaryDeviceID"));
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryDeviceID]);
    if (TUStringsAreEqualOrNil(v7, v8))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount phoneNumberURI](self, "phoneNumberURI"));
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumberURI]);
      if (TUStringsAreEqualOrNil(v9, v10))
      {
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount allowedSecondaryDeviceIDs](self, "allowedSecondaryDeviceIDs"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 allowedSecondaryDeviceIDs]);
        if (TUObjectsAreEqualOrNil(v11, v12))
        {
          id v13 = -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots");
          BOOL v14 = v13 == [v4 availableDeviceSlots];
        }

        else
        {
          BOOL v14 = 0;
        }
      }

      else
      {
        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)containsRegisteredDeviceID:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount allowedSecondaryDeviceIDs](self, "allowedSecondaryDeviceIDs"));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ((TUStringsAreCaseInsensitiveEqual(v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSDictionary)dictionaryRepresentation
{
  v10[0] = kPSAccountId;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount accountID](self, "accountID"));
  v11[0] = v3;
  v10[1] = kPSPrimaryDeviceId;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](self, "primaryDeviceID"));
  v11[1] = v4;
  v10[2] = kPSAccountFreeSlots;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots")));
  v11[2] = v5;
  v10[3] = kPSMdn;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount phoneNumberURI](self, "phoneNumberURI"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _stripFZIDPrefix]);
  v11[3] = v7;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));

  return (NSDictionary *)v8;
}

+ (id)phoneNumberMCCToISOCountryCodeTransformBlock
{
  return objc_retainBlock(off_100444830);
}

+ (void)setPhoneNumberMCCToISOCountryCodeTransformBlock:(id)a3
{
  v3 = (Block_layout *)objc_retainBlock(a3);
  id v4 = off_100444830;
  off_100444830 = v3;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)primaryDeviceID
{
  return self->_primaryDeviceID;
}

- (void)setPrimaryDeviceID:(id)a3
{
}

- (NSString)phoneNumberURI
{
  return self->_phoneNumberURI;
}

- (void)setPhoneNumberURI:(id)a3
{
}

- (int64_t)availableDeviceSlots
{
  return self->_availableDeviceSlots;
}

- (void)setAvailableDeviceSlots:(int64_t)a3
{
  self->_availableDeviceSlots = a3;
}

- (NSSet)allowedSecondaryDeviceIDs
{
  return self->_allowedSecondaryDeviceIDs;
}

- (void)setAllowedSecondaryDeviceIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end