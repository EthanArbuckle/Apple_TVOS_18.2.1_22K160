@interface RPNearFieldValidationPayload
- (BOOL)isKnownIdentity;
- (NSNumber)supportsApplicationLabel;
- (RPNearFieldValidationPayload)initWithDictionary:(id)a3;
- (RPNearFieldValidationPayload)initWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
@end

@implementation RPNearFieldValidationPayload

- (RPNearFieldValidationPayload)initWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPNearFieldValidationPayload;
  v6 = -[RPNearFieldMessagePayload initWithType:](&v12, "initWithType:", 2LL);
  v7 = v6;
  if (v6)
  {
    v6->_isKnownIdentity = a3;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    supportsApplicationLabel = v7->_supportsApplicationLabel;
    v7->_supportsApplicationLabel = (NSNumber *)v8;

    v10 = v7;
  }

  return v7;
}

- (RPNearFieldValidationPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPNearFieldValidationPayload;
  v5 = -[RPNearFieldMessagePayload initWithDictionary:](&v13, "initWithDictionary:", v4);
  if (v5)
  {
    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"RPKnownIdentityKey", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    if (v7)
    {
      uint64_t v8 = NSDictionaryGetNSNumber(v4, @"RPSupportsApplicationLabelKey", 0LL);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
      supportsApplicationLabel = v5->_supportsApplicationLabel;
      v5->_supportsApplicationLabel = (NSNumber *)v9;

      v5->_isKnownIdentity = [v7 BOOLValue];
      v11 = v5;
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  v10[0] = @"RPKnownIdentityKey";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isKnownIdentity));
  v10[1] = @"RPSupportsApplicationLabelKey";
  v11[0] = v3;
  v11[1] = self->_supportsApplicationLabel;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPNearFieldValidationPayload;
  id v5 = -[RPNearFieldMessagePayload dictionaryRepresentation](&v9, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  [v7 addEntriesFromDictionary:v4];
  return v7;
}

- (id)description
{
  return -[RPNearFieldValidationPayload descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v13 = 0LL;
  uint64_t v4 = NSStringFromBOOL(-[RPNearFieldValidationPayload isKnownIdentity](self, "isKnownIdentity", *(void *)&a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldValidationPayload supportsApplicationLabel](self, "supportsApplicationLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldValidationPayload supportsApplicationLabel](self, "supportsApplicationLabel"));
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = NSStringFromBOOL([v7 BOOLValue]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    v10 = v7;
  }

  NSAppendPrintF(&v13, ", isKnownIdentity %@, supportsApplicationLabel %@", v5, v10);
  id v11 = v13;
  if (v6) {

  }
  return v11;
}

- (BOOL)isKnownIdentity
{
  return self->_isKnownIdentity;
}

- (NSNumber)supportsApplicationLabel
{
  return self->_supportsApplicationLabel;
}

- (void).cxx_destruct
{
}

@end