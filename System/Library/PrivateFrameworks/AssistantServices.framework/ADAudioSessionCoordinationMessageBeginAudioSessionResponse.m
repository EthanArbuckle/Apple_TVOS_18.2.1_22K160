@interface ADAudioSessionCoordinationMessageBeginAudioSessionResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)init;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
@end

@implementation ADAudioSessionCoordinationMessageBeginAudioSessionResponse

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  v5 = -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse init](&v9, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    -[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation isDirty](v7, "isDirty");
  }

  return v6;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)init
{
  return -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (NSString)description
{
  return (NSString *)-[ADAudioSessionCoordinationMessageBeginAudioSessionResponse _descriptionWithIndent:]( self,  "_descriptionWithIndent:",  0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  v3 = -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse description](&v5, "description", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  return -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  return -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse isEqual:](&v4, "isEqual:", a3);
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    self = -[ADAudioSessionCoordinationMessageBeginAudioSessionResponse init](self, "init");
    objc_super v3 = self;
  }

  else
  {
    objc_super v3 = 0LL;
  }

  return v3;
}

- (id)buildDictionaryRepresentation
{
  return &__NSDictionary0__struct;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation isDirty](v5, "isDirty")) {
      v6 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse);
    }
    else {
      v6 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)-[ADAudioSessionCoordinationMessageBeginAudioSessionResponse copy]( self,  "copy");
    }
    v7 = v6;
  }

  else
  {
    v7 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)-[ADAudioSessionCoordinationMessageBeginAudioSessionResponse copy]( self,  "copy");
  }

  return v7;
}

@end