@interface _NSPersonNameComponentsStyleFormatterNicknameVariant
- (id)abbreviatedKeys;
- (id)keysOfInterest;
- (id)orderedTemplate;
@end

@implementation _NSPersonNameComponentsStyleFormatterNicknameVariant

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", @"nickname", 0);
    self->super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (id)orderedTemplate
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = @"nickname";
  return (id)[MEMORY[0x189603F18] arrayWithObjects:v3 count:1];
}

- (id)abbreviatedKeys
{
  return 0LL;
}

@end