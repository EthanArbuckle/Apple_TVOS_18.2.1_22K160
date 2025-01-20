@interface _NSLocalizedNumberFormatRuleAutomatic
+ (BOOL)supportsSecureCoding;
- (_NSLocalizedNumberFormatRuleAutomatic)initWithCoder:(id)a3;
- (id)_formattedString:(id)a3 withStringLocale:(id)a4 andDisplayLocale:(id)a5;
- (id)_locked_formatterForLocale:(id)a3;
- (id)description;
@end

@implementation _NSLocalizedNumberFormatRuleAutomatic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSLocalizedNumberFormatRuleAutomatic)initWithCoder:(id)a3
{
  return (_NSLocalizedNumberFormatRuleAutomatic *) +[NSLocalizedNumberFormatRule automatic]( &OBJC_CLASS___NSLocalizedNumberFormatRule,  "automatic");
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSLocalizedNumberFormatRuleAutomatic;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (format number rule)",  -[_NSLocalizedNumberFormatRuleAutomatic description](&v3, sel_description));
}

- (id)_locked_formatterForLocale:(id)a3
{
  Mutable = (const __CFDictionary *)_locked_formatterForLocale__formatters;
  if (!_locked_formatterForLocale__formatters)
  {
    Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DD0],  0LL,  &formatterCacheKeyCallBacks,  MEMORY[0x189605250]);
    _locked_formatterForLocale__formatters = (uint64_t)Mutable;
  }

  Value = (NSNumberFormatter *)CFDictionaryGetValue(Mutable, a3);
  if (!Value)
  {
    Value = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setLocale:](Value, "setLocale:", a3);
    -[NSNumberFormatter setDecimalSeparator:](Value, "setDecimalSeparator:", [a3 decimalSeparator]);
    -[NSNumberFormatter setGroupingSeparator:](Value, "setGroupingSeparator:", [a3 groupingSeparator]);
    if (CFDictionaryGetCount((CFDictionaryRef)_locked_formatterForLocale__formatters) >= 101) {
      CFDictionaryRemoveAllValues((CFMutableDictionaryRef)_locked_formatterForLocale__formatters);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)_locked_formatterForLocale__formatters, a3, Value);
  }

  return Value;
}

- (id)_formattedString:(id)a3 withStringLocale:(id)a4 andDisplayLocale:(id)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&_formattedString_withStringLocale_andDisplayLocale__lock);
  v9 = (void *)objc_msgSend( -[_NSLocalizedNumberFormatRuleAutomatic _locked_formatterForLocale:]( self,  "_locked_formatterForLocale:",  a4),  "numberFromString:",  a3);
  if (v9)
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    uint64_t v20 = 0LL;
    uint64_t v11 = objc_msgSend(a3, "rangeOfString:", objc_msgSend(a4, "decimalSeparator"));
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v10;
      uint64_t v13 = [a3 length];
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __92___NSLocalizedNumberFormatRuleAutomatic__formattedString_withStringLocale_andDisplayLocale___block_invoke;
      v16[3] = &unk_189CA1A30;
      v16[4] = &v17;
      objc_msgSend(a3, "enumerateSubstringsInRange:options:usingBlock:", v11 + v12, v13 - (v11 + v12), 2, v16);
    }

    id v14 = -[_NSLocalizedNumberFormatRuleAutomatic _locked_formatterForLocale:](self, "_locked_formatterForLocale:", a5);
    [v14 setMinimumFractionDigits:v18[3]];
    v9 = (void *)[v14 stringFromNumber:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&_formattedString_withStringLocale_andDisplayLocale__lock);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_formattedString_withStringLocale_andDisplayLocale__lock);
  }

  return v9;
}

@end