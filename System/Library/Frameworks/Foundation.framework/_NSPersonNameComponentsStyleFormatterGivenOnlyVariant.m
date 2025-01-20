@interface _NSPersonNameComponentsStyleFormatterGivenOnlyVariant
- (BOOL)fullComponentsAreValid:(id)a3;
- (id)abbreviatedKeys;
- (id)keysOfInterest;
- (int64_t)shortNameFormat;
@end

@implementation _NSPersonNameComponentsStyleFormatterGivenOnlyVariant

- (int64_t)shortNameFormat
{
  return 3LL;
}

- (id)keysOfInterest
{
  id result = self->super.super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", @"givenName", 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (id)abbreviatedKeys
{
  return 0LL;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatterGivenOnlyVariant;
  BOOL v4 = -[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](&v6, sel_fullComponentsAreValid_);
  if (v4) {
    LOBYTE(v4) = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "givenName"), "length") > 1;
  }
  return v4;
}

@end