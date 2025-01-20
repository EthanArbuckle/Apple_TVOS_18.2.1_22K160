@interface ADAudioSessionCoordinationMessageEndAudioSessionRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)init;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithEffectiveDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)effectiveDate;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessageEndAudioSessionRequest

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest;
  v5 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation getEffectiveDate]( v7,  "getEffectiveDate"));
      v9 = (NSDate *)[v8 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v9;
    }
  }

  return v6;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)init
{
  return -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithEffectiveDate:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B3FE8;
  v7[3] = &unk_1004EFFA8;
  id v8 = a3;
  id v4 = v8;
  v5 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithBuilder:](self, "initWithBuilder:", v7);

  return v5;
}

- (NSString)description
{
  return (NSString *)-[ADAudioSessionCoordinationMessageEndAudioSessionRequest _descriptionWithIndent:]( self,  "_descriptionWithIndent:",  0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest;
  v5 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@ {effectiveDate = %@}", v6, self->_effectiveDate);

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSDate hash](self->_effectiveDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinationMessageEndAudioSessionRequest effectiveDate](v4, "effectiveDate"));
      effectiveDate = self->_effectiveDate;
      BOOL v8 = effectiveDate == v6 || -[NSDate isEqual:](effectiveDate, "isEqual:", v6);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"ADAudioSessionCoordinationMessageEndAudioSessionRequest::effectiveDate"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithEffectiveDate:]( self,  "initWithEffectiveDate:",  v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"effectiveDate"]);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      id v6 = v4;
    }
    else {
      id v6 = 0LL;
    }

    self =  -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithEffectiveDate:]( self,  "initWithEffectiveDate:",  v6);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  effectiveDate = self->_effectiveDate;
  if (effectiveDate) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", effectiveDate, @"effectiveDate");
  }
  id v6 = -[NSMutableDictionary copy](v4, "copy");

  return v6;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest);
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation getEffectiveDate]( v5,  "getEffectiveDate"));
      BOOL v8 = (NSDate *)[v7 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v8;
    }

    else
    {
      id v6 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)-[ADAudioSessionCoordinationMessageEndAudioSessionRequest copy]( self,  "copy");
    }
  }

  else
  {
    id v6 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)-[ADAudioSessionCoordinationMessageEndAudioSessionRequest copy]( self,  "copy");
  }

  return v6;
}

@end