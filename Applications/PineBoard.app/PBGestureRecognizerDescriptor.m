@interface PBGestureRecognizerDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)isTypeOf:(unint64_t)a3;
- (NSString)description;
- (PBGestureRecognizerDescriptor)init;
- (double)_minimumPressDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hashBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)systemGestureRecognizerDescriptorWithActivationMask:(unint64_t)a3;
- (unint64_t)_numberOfPressBeganRequired;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation PBGestureRecognizerDescriptor

- (PBGestureRecognizerDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBGestureRecognizerDescriptor;
  result = -[PBGestureRecognizerDescriptor init](&v3, "init");
  if (result) {
    result->_hash = -1LL;
  }
  return result;
}

- (BOOL)isTypeOf:(unint64_t)a3
{
  return (a3 & ~-[PBGestureRecognizerDescriptor type](self, "type")) == 0;
}

- (id)hashBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[PBGestureRecognizerDescriptor type](self, "type"));
  return v3;
}

- (unint64_t)type
{
  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBGestureRecognizerDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  -[PBGestureRecognizerDescriptor appendDescriptionToBuilder:](self, "appendDescriptionToBuilder:", v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBGestureRecognizerDescriptor descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBGestureRecognizerDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  return v5;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (result == -1LL)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBGestureRecognizerDescriptor hashBuilder](self, "hashBuilder"));
    self->_hash = (unint64_t)[v4 hash];

    return self->_hash;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBGestureRecognizerDescriptor *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else if (-[PBGestureRecognizerDescriptor isMemberOfClass:]( v4,  "isMemberOfClass:",  objc_opt_class(self)))
  {
    v5 = v4;
    unint64_t v6 = -[PBGestureRecognizerDescriptor type](self, "type");
    unint64_t v7 = -[PBGestureRecognizerDescriptor type](v5, "type");

    BOOL v8 = v6 == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBGestureRecognizerDescriptor descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)systemGestureRecognizerDescriptorWithActivationMask:(unint64_t)a3
{
  return  -[PBSystemGestureRecognizerDescriptor initWithDescriptor:activationMask:]( objc_alloc(&OBJC_CLASS___PBSystemGestureRecognizerDescriptor),  "initWithDescriptor:activationMask:",  self,  a3);
}

- (unint64_t)_numberOfPressBeganRequired
{
  return 0LL;
}

- (double)_minimumPressDuration
{
  return 0.0;
}

@end