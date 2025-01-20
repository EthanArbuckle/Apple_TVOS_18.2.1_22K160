@interface _NSPersonNameComponentsStyleFormatterGivenInitialVariant
- (BOOL)fullComponentsAreValid:(id)a3;
- (id)abbreviatedKeys;
- (id)keysOfInterest;
- (int64_t)shortNameFormat;
@end

@implementation _NSPersonNameComponentsStyleFormatterGivenInitialVariant

- (int64_t)shortNameFormat
{
  return 2LL;
}

- (id)keysOfInterest
{
  id result = self->super.super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"familyName",  @"givenName",  0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (id)abbreviatedKeys
{
  v5[1] = *MEMORY[0x1895F89C0];
  id result = self->super.super._abbreviatedKeys;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x189604010]);
    v5[0] = @"givenName";
    id result = (id)objc_msgSend( v4,  "initWithArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v5, 1));
    self->super.super._abbreviatedKeys = (NSSet *)result;
  }

  return result;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatterGivenInitialVariant;
  LODWORD(v4) = -[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](&v6, sel_fullComponentsAreValid_);
  if ((_DWORD)v4)
  {
    uint64_t v4 = [a3 givenName];
    if (v4) {
      LOBYTE(v4) = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "familyName"), "length") > 1;
    }
  }

  return v4;
}

@end