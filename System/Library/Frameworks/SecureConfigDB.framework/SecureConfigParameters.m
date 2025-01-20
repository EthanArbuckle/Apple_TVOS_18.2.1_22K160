@interface SecureConfigParameters
+ (id)loadContentsAndReturnError:(id *)a3;
- (SecureConfigParameters)initWithUnderlyingObject:(id)a3;
- (_SecureConfigParameters)obj;
- (__CFBoolean)research_disableAppleInfrastructureEnforcement;
@end

@implementation SecureConfigParameters

- (SecureConfigParameters)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecureConfigParameters;
  v6 = -[SecureConfigParameters init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_obj, a3);
  }

  return v7;
}

+ (id)loadContentsAndReturnError:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    v4 = -[SecureConfigParameters initWithUnderlyingObject:]( objc_alloc(&OBJC_CLASS___SecureConfigParameters),  "initWithUnderlyingObject:",  v3);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (__CFBoolean)research_disableAppleInfrastructureEnforcement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFBoolean *)objc_msgSend(v2, "research_disableAppleInfrastructureEnforcement");

  return v3;
}

- (_SecureConfigParameters)obj
{
  return self->_obj;
}

- (void).cxx_destruct
{
}

@end