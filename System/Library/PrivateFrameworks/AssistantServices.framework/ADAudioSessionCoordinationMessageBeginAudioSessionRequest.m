@interface ADAudioSessionCoordinationMessageBeginAudioSessionRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)init;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithEffectiveDate:(id)a3 expirationDuration:(double)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)effectiveDate;
- (NSString)description;
- (double)expirationDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessageBeginAudioSessionRequest

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *))a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest;
  v5 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest init](&v13, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation getEffectiveDate]( v7,  "getEffectiveDate"));
      v9 = (NSDate *)[v8 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v9;

      -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation getExpirationDuration]( v7,  "getExpirationDuration");
      v6->_expirationDuration = v11;
    }
  }

  return v6;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)init
{
  return -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithEffectiveDate:(id)a3 expirationDuration:(double)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100224430;
  v9[3] = &unk_1004F6E08;
  id v10 = a3;
  double v11 = a4;
  id v6 = v10;
  v7 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithBuilder:](self, "initWithBuilder:", v9);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[ADAudioSessionCoordinationMessageBeginAudioSessionRequest _descriptionWithIndent:]( self,  "_descriptionWithIndent:",  0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest;
  v5 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest description](&v9, "description");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {effectiveDate = %@, expirationDuration = %f}",  v6,  self->_effectiveDate,  *(void *)&self->_expirationDuration);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSDate hash](self->_effectiveDate, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      double expirationDuration = self->_expirationDuration;
      -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest expirationDuration](v6, "expirationDuration");
      if (expirationDuration == v8)
      {
        id v10 = (NSDate *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest effectiveDate]( v6,  "effectiveDate"));
        effectiveDate = self->_effectiveDate;
        BOOL v9 = effectiveDate == v10 || -[NSDate isEqual:](effectiveDate, "isEqual:", v10);
      }

      else
      {
        BOOL v9 = 0;
      }
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::effectiveDate"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::expirationDuration"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  [v8 doubleValue];
  double v10 = v9;

  double v11 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithEffectiveDate:expirationDuration:]( self,  "initWithEffectiveDate:expirationDuration:",  v6,  v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  effectiveDate = self->_effectiveDate;
  id v5 = a3;
  [v5 encodeObject:effectiveDate forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::effectiveDate"];
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  [v5 encodeObject:v6 forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::expirationDuration"];
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"effectiveDate"]);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      id v7 = v5;
    }
    else {
      id v7 = 0LL;
    }

    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"expirationDuration"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      id v11 = v9;
    }
    else {
      id v11 = 0LL;
    }

    [v11 doubleValue];
    double v13 = v12;

    self =  -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithEffectiveDate:expirationDuration:]( self,  "initWithEffectiveDate:expirationDuration:",  v7,  v13);
    double v8 = self;
  }

  else
  {
    double v8 = 0LL;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  effectiveDate = self->_effectiveDate;
  if (effectiveDate) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", effectiveDate, @"effectiveDate");
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"expirationDuration");

  id v7 = -[NSMutableDictionary copy](v4, "copy");
  return v7;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation isDirty](v5, "isDirty"))
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation getEffectiveDate]( v5,  "getEffectiveDate"));
      double v8 = (NSDate *)[v7 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v8;

      -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation getExpirationDuration]( v5,  "getExpirationDuration");
      v6->_double expirationDuration = v10;
    }

    else
    {
      uint64_t v6 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)-[ADAudioSessionCoordinationMessageBeginAudioSessionRequest copy]( self,  "copy");
    }
  }

  else
  {
    uint64_t v6 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)-[ADAudioSessionCoordinationMessageBeginAudioSessionRequest copy]( self,  "copy");
  }

  return v6;
}

@end