@interface _BKKeyboardEventExtras
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copy;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _BKKeyboardEventExtras

- (BOOL)isEqual:(id)a3
{
  v5 = (_BKKeyboardEventExtras *)a3;
  if (v5 == self)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    BOOL v7 = (objc_opt_isKindOfClass(v5, v6) & 1) != 0
      && BSEqualObjects(self->_authenticationSpecification, v5->_authenticationSpecification)
      && self->_eventSource == v5->_eventSource
      && self->_modifiersOnly == v5->_modifiersOnly
      && self->_GSModifierState == v5->_GSModifierState;
  }

  return v7;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS____BKKeyboardEventExtras);
  objc_storeStrong((id *)&v3->_authenticationSpecification, self->_authenticationSpecification);
  v3->_eventSource = self->_eventSource;
  v3->_modifiersOnly = self->_modifiersOnly;
  v3->_GSModifierState = self->_GSModifierState;
  return v3;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v9 = a3;
  id v4 =  [v9 appendObject:self->_authenticationSpecification withName:@"authSpec" skipIfNil:1];
  uint64_t v5 = NSStringFromBKSHIDEventSource(self->_eventSource);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v9 appendString:v6 withName:@"eventSource"];

  id v7 = [v9 appendBool:self->_modifiersOnly withName:@"modifiersOnly"];
  id v8 =  [v9 appendUnsignedInteger:self->_GSModifierState withName:@"GSModifierState" format:1];
}

- (void).cxx_destruct
{
}

@end