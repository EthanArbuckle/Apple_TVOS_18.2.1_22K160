@interface PBSystemGestureRecognizerDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescriptor:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (PBGestureRecognizerDescriptor)gestureRecognizerDescriptor;
- (PBSystemGestureRecognizerDescriptor)initWithDescriptor:(id)a3 activationMask:(unint64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)activationMask;
- (unint64_t)hash;
@end

@implementation PBSystemGestureRecognizerDescriptor

- (PBSystemGestureRecognizerDescriptor)initWithDescriptor:(id)a3 activationMask:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBSystemGestureRecognizerDescriptor;
  v8 = -[PBSystemGestureRecognizerDescriptor init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_gestureRecognizerDescriptor, a3);
    v9->_activationMask = a4;
  }

  return v9;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  v4 = a3;
  if (-[PBSystemGestureRecognizerDescriptor isEqual:](self, "isEqual:", v4)) {
    BOOL v5 = self->_activationMask == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[PBGestureRecognizerDescriptor hash](self->_gestureRecognizerDescriptor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBSystemGestureRecognizerDescriptor));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  gestureRecognizerDescriptor = self->_gestureRecognizerDescriptor;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A7EAC;
  v11[3] = &unk_1003D2130;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v6 appendObject:gestureRecognizerDescriptor counterpart:v11];
  LOBYTE(gestureRecognizerDescriptor) = [v6 isEqual];

  return (char)gestureRecognizerDescriptor;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecognizerDescriptor succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecognizerDescriptor descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureRecognizerDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  -[PBGestureRecognizerDescriptor appendDescriptionToBuilder:]( self->_gestureRecognizerDescriptor,  "appendDescriptionToBuilder:",  v3);
  id v4 = sub_10006BCC0(self->_activationMask);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:0 skipIfEmpty:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecognizerDescriptor descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];

  id v6 = [v5 appendObject:self->_gestureRecognizerDescriptor withName:0];
  id v7 = sub_10006BCC0(self->_activationMask);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 appendString:v8 withName:0 skipIfEmpty:0];

  return v5;
}

- (PBGestureRecognizerDescriptor)gestureRecognizerDescriptor
{
  return self->_gestureRecognizerDescriptor;
}

- (unint64_t)activationMask
{
  return self->_activationMask;
}

- (void).cxx_destruct
{
}

@end