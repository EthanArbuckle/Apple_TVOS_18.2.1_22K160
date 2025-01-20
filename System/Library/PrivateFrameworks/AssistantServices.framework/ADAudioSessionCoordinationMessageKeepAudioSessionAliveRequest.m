@interface ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)init;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithExpirationDuration:(double)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)expirationDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *))a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest;
  v5 = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest init](&v10, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation isDirty](v7, "isDirty"))
    {
      -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation getExpirationDuration]( v7,  "getExpirationDuration");
      v6->_expirationDuration = v8;
    }
  }

  return v6;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)init
{
  return -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest initWithBuilder:]( self,  "initWithBuilder:",  0LL);
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithExpirationDuration:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002022F0;
  v4[3] = &unk_1004F6528;
  *(double *)&v4[4] = a3;
  return -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest initWithBuilder:](self, "initWithBuilder:", v4);
}

- (NSString)description
{
  return (NSString *)-[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest _descriptionWithIndent:]( self,  "_descriptionWithIndent:",  0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest;
  v5 = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {expirationDuration = %f}",  v6,  *(void *)&self->_expirationDuration);

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      double expirationDuration = self->_expirationDuration;
      -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest expirationDuration](v4, "expirationDuration");
      BOOL v8 = expirationDuration == v7;
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest::expirationDuration"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  [v6 doubleValue];
  double v8 = v7;

  return -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest initWithExpirationDuration:]( self,  "initWithExpirationDuration:",  v8);
}

- (void)encodeWithCoder:(id)a3
{
  double expirationDuration = self->_expirationDuration;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", expirationDuration));
  [v4 encodeObject:v5 forKey:@"ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest::expirationDuration"];
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"expirationDuration"]);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      id v6 = v4;
    }
    else {
      id v6 = 0LL;
    }

    [v6 doubleValue];
    double v9 = v8;

    self =  -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest initWithExpirationDuration:]( self,  "initWithExpirationDuration:",  v9);
    double v7 = self;
  }

  else
  {
    double v7 = 0LL;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_expirationDuration));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"expirationDuration");

  id v5 = -[NSMutableDictionary copy](v3, "copy");
  return v5;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest);
      -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation getExpirationDuration]( v5,  "getExpirationDuration");
      v6->_double expirationDuration = v7;
    }

    else
    {
      id v6 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)-[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest copy]( self,  "copy");
    }
  }

  else
  {
    id v6 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)-[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest copy]( self,  "copy");
  }

  return v6;
}

@end