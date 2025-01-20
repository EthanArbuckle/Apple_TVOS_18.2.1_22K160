@interface ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)init;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
@end

@implementation ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse;
  v5 = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse init](&v9, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation isDirty](v7, "isDirty");
  }

  return v6;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)init
{
  return -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse initWithBuilder:]( self,  "initWithBuilder:",  0LL);
}

- (NSString)description
{
  return (NSString *)-[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse _descriptionWithIndent:]( self,  "_descriptionWithIndent:",  0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse;
  v3 = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse description](&v5, "description", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse;
  return -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse;
  return -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse isEqual:](&v4, "isEqual:", a3);
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    self = -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse init](self, "init");
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponseMutation isDirty](v5, "isDirty")) {
      v6 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse);
    }
    else {
      v6 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)-[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse copy]( self,  "copy");
    }
    v7 = v6;
  }

  else
  {
    v7 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)-[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse copy]( self,  "copy");
  }

  return v7;
}

@end