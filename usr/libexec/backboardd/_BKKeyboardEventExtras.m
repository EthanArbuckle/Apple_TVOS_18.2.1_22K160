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
    uint64_t v6 = [self class];
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
  BKKeyboardEventExtras *v3 = [[BKKeyboardEventExtras alloc] init];
  [v3 setAuthenticationSpecification:self->_authenticationSpecification];
  v3->_eventSource = self->_eventSource;
  v3->_modifiersOnly = self->_modifiersOnly;
  v3->_GSModifierState = self->_GSModifierState;
  return v3;
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v9 = a3;
  id v4 =  [v9 appendObject:self->_authenticationSpecification withName:@"authSpec" skipIfNil:1];
  uint64_t v5 = NSStringFromBKSHIDEventSource(self->_eventSource);
  uint64_t v6 = [v5 autorelease];
  [v9 appendString:v6 withName:@"eventSource"];

  id v7 = [v9 appendBool:self->_modifiersOnly withName:@"modifiersOnly"];
  id v8 =  [v9 appendUnsignedInteger:self->_GSModifierState withName:@"GSModifierState" format:1];
}

- (void).cxx_destruct
{
}

@end