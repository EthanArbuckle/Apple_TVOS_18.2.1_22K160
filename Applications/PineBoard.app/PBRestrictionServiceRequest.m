@interface PBRestrictionServiceRequest
- (BOOL)allowInteraction;
- (BOOL)isEqual:(id)a3;
- (NSNumber)rating;
- (NSString)PIN;
- (NSUUID)token;
- (PBRestrictionServiceRequest)init;
- (PBRestrictionServiceRequest)initWithToken:(id)a3;
- (PBRestrictionServiceRequest)initWithToken:(id)a3 requestType:(unint64_t)a4;
- (id)description;
- (id)resultHandler;
- (id)serviceRequestCompletionBlock;
- (unint64_t)hash;
- (unint64_t)requestType;
- (unint64_t)restrictedSettingType;
- (unint64_t)restrictionContentType;
- (void)setAllowInteraction:(BOOL)a3;
- (void)setPIN:(id)a3;
- (void)setRating:(id)a3;
- (void)setRestrictedSettingType:(unint64_t)a3;
- (void)setRestrictionContentType:(unint64_t)a3;
- (void)setResultHandler:(id)a3;
- (void)setServiceRequestCompletionBlock:(id)a3;
@end

@implementation PBRestrictionServiceRequest

- (PBRestrictionServiceRequest)init
{
  return 0LL;
}

- (PBRestrictionServiceRequest)initWithToken:(id)a3
{
  return -[PBRestrictionServiceRequest initWithToken:requestType:](self, "initWithToken:requestType:", a3, 0LL);
}

- (PBRestrictionServiceRequest)initWithToken:(id)a3 requestType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBRestrictionServiceRequest;
  v8 = -[PBRestrictionServiceRequest init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_token, a3);
    v9->_requestType = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBRestrictionServiceRequest);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequest token](self, "token"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
    if ([v7 isEqual:v8])
    {
      id v9 = -[PBRestrictionServiceRequest requestType](self, "requestType");
      BOOL v10 = v9 == [v6 requestType];
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_token, "hash");
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBRestrictionServiceRequest;
  id v3 = -[PBRestrictionServiceRequest description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Hash %lu",  v4,  -[PBRestrictionServiceRequest hash](self, "hash")));

  return v5;
}

- (NSUUID)token
{
  return self->_token;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unint64_t)restrictionContentType
{
  return self->_restrictionContentType;
}

- (void)setRestrictionContentType:(unint64_t)a3
{
  self->_restrictionContentType = a3;
}

- (unint64_t)restrictedSettingType
{
  return self->_restrictedSettingType;
}

- (void)setRestrictedSettingType:(unint64_t)a3
{
  self->_restrictedSettingType = a3;
}

- (NSNumber)rating
{
  return self->_rating;
}

- (void)setRating:(id)a3
{
}

- (BOOL)allowInteraction
{
  return self->_allowInteraction;
}

- (void)setAllowInteraction:(BOOL)a3
{
  self->_allowInteraction = a3;
}

- (id)serviceRequestCompletionBlock
{
  return self->_serviceRequestCompletionBlock;
}

- (void)setServiceRequestCompletionBlock:(id)a3
{
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
}

- (NSString)PIN
{
  return self->_PIN;
}

- (void)setPIN:(id)a3
{
}

- (void).cxx_destruct
{
}

@end