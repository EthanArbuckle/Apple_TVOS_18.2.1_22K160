@interface _NSPersonNameComponentsStyleFormatterShort
- (BOOL)forceShortNameEnabled;
- (BOOL)isEnabled;
- (_NSPersonNameComponentsStyleFormatter)subFormatter;
- (_NSPersonNameComponentsStyleFormatterShort)initWithMasterFormatter:(id)a3;
- (_NSPersonNameComponentsStyleFormatterShortVariantGeneral)variantFormatter;
- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5;
- (id)abbreviatedKeys;
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
- (id)orderedKeysOfInterest;
- (int64_t)shortNameFormat;
- (void)dealloc;
- (void)setForceShortNameEnabled:(BOOL)a3;
- (void)setShortNameFormat:(int64_t)a3;
- (void)setSubFormatter:(id)a3;
@end

@implementation _NSPersonNameComponentsStyleFormatterShort

- (_NSPersonNameComponentsStyleFormatterShort)initWithMasterFormatter:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatterShort;
  result = -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:](&v4, sel_initWithMasterFormatter_, a3);
  if (result) {
    result->_shortNameFormat = 0LL;
  }
  return result;
}

- (BOOL)forceShortNameEnabled
{
  return self->_forceShortNameEnabled;
}

- (void)setForceShortNameEnabled:(BOOL)a3
{
  self->_forceShortNameEnabled = a3;
}

- (int64_t)shortNameFormat
{
  int64_t result = self->_shortNameFormat;
  if (!result)
  {
    int64_t result = -[NSPersonNameComponentsFormatter __computedShortNameFormat]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "__computedShortNameFormat");
    self->_shortNameFormat = result;
  }

  return result;
}

- (void)setShortNameFormat:(int64_t)a3
{
  self->_shortNameFormat = a3;
}

- (_NSPersonNameComponentsStyleFormatterShortVariantGeneral)variantFormatter
{
  int64_t result = self->_variantFormatter;
  if (!result)
  {
    -[_NSPersonNameComponentsStyleFormatterShort shortNameFormat](self, "shortNameFormat");
    int64_t result = (_NSPersonNameComponentsStyleFormatterShortVariantGeneral *)objc_msgSend( objc_alloc((Class)objc_opt_class()),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter]( self,  "masterFormatter"));
    self->_variantFormatter = result;
  }

  return result;
}

- (_NSPersonNameComponentsStyleFormatter)subFormatter
{
  int64_t result = self->_subFormatter;
  if (!result)
  {
    if (+[NSPersonNameComponentsFormatter _shouldPreferNicknames]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_shouldPreferNicknames"))
    {
      int64_t result =  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterNicknameVariant),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
    }

    else
    {
      int64_t result = -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
    }

    self->_subFormatter = result;
  }

  return result;
}

- (void)setSubFormatter:(id)a3
{
  self->_subFormatter = (_NSPersonNameComponentsStyleFormatter *)a3;
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  BOOL v8 = +[NSPersonNameComponentsFormatter _shouldPreferNicknames]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_shouldPreferNicknames",  a3);
  BOOL v9 = +[NSPersonNameComponentsFormatter _isCJKScript:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_isCJKScript:",  a4);
  if (v8)
  {
    if (v9
      || +[NSPersonNameComponentsFormatter _isMixedScript:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_isMixedScript:",  a4))
    {
      v10 =  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterLong),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
    }

    else
    {
      v10 = -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
    }

    -[_NSPersonNameComponentsStyleFormatter setFallbackStyleFormatter:]( -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter"),  "setFallbackStyleFormatter:",  v10);
  }

  else if (v9)
  {
    -[_NSPersonNameComponentsStyleFormatterShort setSubFormatter:]( self,  "setSubFormatter:",   -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterLong),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")));
  }

  else if (!+[NSPersonNameComponentsFormatter _shortNameIsEnabled]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_shortNameIsEnabled") {
         && !-[_NSPersonNameComponentsStyleFormatterShort forceShortNameEnabled](self, "forceShortNameEnabled"))
  }
  {
    return 0LL;
  }

  -[_NSPersonNameComponentsStyleFormatter setFallbackStyleFormatter:]( -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter"),  "setFallbackStyleFormatter:",   -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterShortNameSimpleFallback),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")));
  return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:]( -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter"),  "stringFromComponents:attributesByRange:",  a4,  a5);
}

- (id)abbreviatedKeys
{
  v2 = -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  if (v2) {
    -[_NSPersonNameComponentsStyleFormatter abbreviatedKeys](v2, "abbreviatedKeys");
  }
  return 0LL;
}

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result =  -[_NSPersonNameComponentsStyleFormatter keysOfInterest]( -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter"),  "keysOfInterest");
    self->super._keysOfInterest = (NSSet *)result;
  }

  return result;
}

- (id)orderedKeysOfInterest
{
  v5[1] = *MEMORY[0x1895F89C0];
  -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = @"nickname";
    return (id)[MEMORY[0x189603F18] arrayWithObjects:v5 count:1];
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatterShort;
    return -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](&v4, sel_orderedKeysOfInterest);
  }

- (id)fallbackStyleFormatter
{
  if (!+[NSPersonNameComponentsFormatter _shouldPreferNicknames]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_shouldPreferNicknames")) {
    return  -[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]( objc_alloc(&OBJC_CLASS____NSPersonNameComponentsStyleFormatterMedium),  "initWithMasterFormatter:",  -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
  }
  id result = -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
  if (result) {
    return -[_NSPersonNameComponentsStyleFormatterShort variantFormatter](self, "variantFormatter");
  }
  return result;
}

- (BOOL)isEnabled
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return 1;
  }
  BOOL v4 = -[_NSPersonNameComponentsStyleFormatterShort forceShortNameEnabled](self, "forceShortNameEnabled")
    || +[NSPersonNameComponentsFormatter _shortNameIsEnabled]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_shortNameIsEnabled");
  LOBYTE(v5) = 1;
  char v6 = -[NSPersonNameComponentsFormatter __localizedRestrictionExistsForStyle:]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "__localizedRestrictionExistsForStyle:",  1LL);
  -[_NSPersonNameComponentsStyleFormatterShort subFormatter](self, "subFormatter");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    int v5 = !-[NSPersonNameComponentsFormatter __localizedRestrictionExistsForShortStyle:]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "__localizedRestrictionExistsForShortStyle:",  -[_NSPersonNameComponentsStyleFormatterShort shortNameFormat](self, "shortNameFormat"));
  }
  if (v4) {
    return v5 & ~v6;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatterShort;
  -[_NSPersonNameComponentsStyleFormatter dealloc](&v3, sel_dealloc);
}

@end