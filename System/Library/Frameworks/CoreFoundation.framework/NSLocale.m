@interface NSLocale
+ (BOOL)supportsSecureCoding;
+ (NSArray)ISOCountryCodes;
+ (NSArray)ISOCurrencyCodes;
+ (NSArray)ISOLanguageCodes;
+ (NSArray)availableLocaleIdentifiers;
+ (NSArray)commonISOCurrencyCodes;
+ (NSArray)preferredLanguages;
+ (NSDictionary)componentsFromLocaleIdentifier:(NSString *)string;
+ (NSLocale)allocWithZone:(_NSZone *)a3;
+ (NSLocale)currentLocale;
+ (NSLocale)localeWithLocaleIdentifier:(NSString *)ident;
+ (NSLocale)systemLocale;
+ (NSLocaleLanguageDirection)characterDirectionForLanguage:(NSString *)isoLangCode;
+ (NSLocaleLanguageDirection)lineDirectionForLanguage:(NSString *)isoLangCode;
+ (NSString)canonicalLanguageIdentifierFromString:(NSString *)string;
+ (NSString)canonicalLocaleIdentifierFromString:(NSString *)string;
+ (NSString)localeIdentifierFromComponents:(NSDictionary *)dict;
+ (NSString)localeIdentifierFromWindowsLocaleCode:(uint32_t)lcid;
+ (id)internetServicesRegion;
+ (uint32_t)windowsLocaleCodeFromLocaleIdentifier:(NSString *)localeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesMetricSystem;
- (NSCharacterSet)exemplarCharacterSet;
- (NSLocale)init;
- (NSLocale)initWithCoder:(NSCoder *)aDecoder;
- (NSString)alternateQuotationBeginDelimiter;
- (NSString)alternateQuotationEndDelimiter;
- (NSString)calendarIdentifier;
- (NSString)collationIdentifier;
- (NSString)collatorIdentifier;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)currencySymbol;
- (NSString)decimalSeparator;
- (NSString)displayNameForKey:(NSLocaleKey)key value:(id)value;
- (NSString)groupingSeparator;
- (NSString)languageCode;
- (NSString)languageIdentifier;
- (NSString)localeIdentifier;
- (NSString)localizedStringForCalendarIdentifier:(NSString *)calendarIdentifier;
- (NSString)localizedStringForCollationIdentifier:(NSString *)collationIdentifier;
- (NSString)localizedStringForCollatorIdentifier:(NSString *)collatorIdentifier;
- (NSString)localizedStringForCountryCode:(NSString *)countryCode;
- (NSString)localizedStringForCurrencyCode:(NSString *)currencyCode;
- (NSString)localizedStringForLanguageCode:(NSString *)languageCode;
- (NSString)localizedStringForLocaleIdentifier:(NSString *)localeIdentifier;
- (NSString)localizedStringForScriptCode:(NSString *)scriptCode;
- (NSString)localizedStringForVariantCode:(NSString *)variantCode;
- (NSString)quotationBeginDelimiter;
- (NSString)quotationEndDelimiter;
- (NSString)regionCode;
- (NSString)scriptCode;
- (NSString)variantCode;
- (id)_copyDisplayNameForKey:(id)a3 value:(id)a4;
- (id)_prefForKey:(id)a3;
- (id)localizedStringForAlternateQuotationBeginDelimiter:(id)a3;
- (id)localizedStringForAlternateQuotationEndDelimiter:(id)a3;
- (id)localizedStringForCurrencySymbol:(id)a3;
- (id)localizedStringForDecimalSeparator:(id)a3;
- (id)localizedStringForGroupingSeparator:(id)a3;
- (id)localizedStringForQuotationBeginDelimiter:(id)a3;
- (id)localizedStringForQuotationEndDelimiter:(id)a3;
- (id)objectForKey:(NSLocaleKey)key;
- (unint64_t)hash;
@end

@implementation NSLocale

+ (NSLocale)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSLocale == a1) {
    return (NSLocale *)&__placeholderLocale;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSLocale;
  return (NSLocale *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSLocale)init
{
  return -[NSLocale initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", 0LL);
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSLocale localeIdentifier](self, "localeIdentifier"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      return -[NSString isEqual:]( -[NSLocale localeIdentifier](self, "localeIdentifier"),  "isEqual:",  [a3 localeIdentifier]);
    }
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)initWithCoder:(NSCoder *)aDecoder
{
  return 0LL;
}

- (NSString)localeIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleIdentifierKey");
}

- (NSString)localizedStringForLocaleIdentifier:(NSString *)localeIdentifier
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleIdentifierKey",  localeIdentifier);
}

- (NSString)languageCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleLanguageCodeKey");
}

- (NSString)localizedStringForLanguageCode:(NSString *)languageCode
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleLanguageCodeKey",  languageCode);
}

- (NSString)countryCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleCountryCodeKey");
}

- (NSString)localizedStringForCountryCode:(NSString *)countryCode
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleCountryCodeKey",  countryCode);
}

- (NSString)scriptCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleScriptCodeKey");
}

- (NSString)localizedStringForScriptCode:(NSString *)scriptCode
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleScriptCodeKey",  scriptCode);
}

- (NSString)variantCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleVariantCodeKey");
}

- (NSString)localizedStringForVariantCode:(NSString *)variantCode
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleVariantCodeKey",  variantCode);
}

- (NSString)calendarIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"calendar");
}

- (NSString)localizedStringForCalendarIdentifier:(NSString *)calendarIdentifier
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", @"calendar", calendarIdentifier);
}

- (NSString)collationIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"collation");
}

- (NSString)localizedStringForCollationIdentifier:(NSString *)collationIdentifier
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", @"collation", collationIdentifier);
}

- (NSString)decimalSeparator
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleDecimalSeparatorKey");
}

- (id)localizedStringForDecimalSeparator:(id)a3
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleDecimalSeparatorKey",  a3);
}

- (NSString)groupingSeparator
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleGroupingSeparatorKey");
}

- (id)localizedStringForGroupingSeparator:(id)a3
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleGroupingSeparatorKey",  a3);
}

- (NSString)currencySymbol
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleCurrencySymbolKey");
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", @"kCFLocaleCurrencySymbolKey", a3);
}

- (NSString)currencyCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"currency");
}

- (NSString)localizedStringForCurrencyCode:(NSString *)currencyCode
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", @"currency", currencyCode);
}

- (NSString)collatorIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleCollatorIdentifierKey");
}

- (NSString)localizedStringForCollatorIdentifier:(NSString *)collatorIdentifier
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleCollatorIdentifierKey",  collatorIdentifier);
}

- (NSString)quotationBeginDelimiter
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleQuotationBeginDelimiterKey");
}

- (id)localizedStringForQuotationBeginDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleQuotationBeginDelimiterKey",  a3);
}

- (NSString)quotationEndDelimiter
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleQuotationEndDelimiterKey");
}

- (id)localizedStringForQuotationEndDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleQuotationEndDelimiterKey",  a3);
}

- (NSString)alternateQuotationBeginDelimiter
{
  return (NSString *)-[NSLocale objectForKey:]( self,  "objectForKey:",  @"kCFLocaleAlternateQuotationBeginDelimiterKey");
}

- (id)localizedStringForAlternateQuotationBeginDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleAlternateQuotationBeginDelimiterKey",  a3);
}

- (NSString)alternateQuotationEndDelimiter
{
  return (NSString *)-[NSLocale objectForKey:]( self,  "objectForKey:",  @"kCFLocaleAlternateQuotationEndDelimiterKey");
}

- (id)localizedStringForAlternateQuotationEndDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:]( self,  "displayNameForKey:value:",  @"kCFLocaleAlternateQuotationEndDelimiterKey",  a3);
}

- (NSCharacterSet)exemplarCharacterSet
{
  return (NSCharacterSet *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleExemplarCharacterSetKey");
}

- (BOOL)usesMetricSystem
{
  return objc_msgSend( -[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleUsesMetricSystemKey"),  "BOOLValue");
}

- (NSString)regionCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"kCFLocaleCountryCodeKey");
}

- (NSString)languageIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", @"locale:languageIdentifier");
}

+ (NSLocale)systemLocale
{
  return (NSLocale *)+[NSLocale _system](&OBJC_CLASS___NSLocale, "_system");
}

+ (NSLocale)currentLocale
{
  return (NSLocale *)+[NSLocale _current](&OBJC_CLASS___NSLocale, "_current");
}

+ (NSLocale)localeWithLocaleIdentifier:(NSString *)ident
{
  return (NSLocale *)(id)[objc_alloc((Class)a1) initWithLocaleIdentifier:ident];
}

+ (NSArray)availableLocaleIdentifiers
{
  return (NSArray *)+[NSLocale _availableLocaleIdentifiers](&OBJC_CLASS___NSLocale, "_availableLocaleIdentifiers");
}

+ (NSArray)ISOLanguageCodes
{
  return (NSArray *)+[NSLocale _isoLanguageCodes](&OBJC_CLASS___NSLocale, "_isoLanguageCodes");
}

+ (NSArray)ISOCountryCodes
{
  return (NSArray *)+[NSLocale _isoCountryCodes](&OBJC_CLASS___NSLocale, "_isoCountryCodes");
}

+ (NSArray)ISOCurrencyCodes
{
  return (NSArray *)+[NSLocale _isoCurrencyCodes](&OBJC_CLASS___NSLocale, "_isoCurrencyCodes");
}

+ (NSArray)commonISOCurrencyCodes
{
  return (NSArray *)+[NSLocale _commonISOCurrencyCodes](&OBJC_CLASS___NSLocale, "_commonISOCurrencyCodes");
}

+ (NSArray)preferredLanguages
{
  return (NSArray *)+[NSLocale _preferredLanguages](&OBJC_CLASS___NSLocale, "_preferredLanguages");
}

+ (NSDictionary)componentsFromLocaleIdentifier:(NSString *)string
{
  return (NSDictionary *)+[NSLocale _componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "_componentsFromLocaleIdentifier:",  string);
}

+ (NSString)localeIdentifierFromComponents:(NSDictionary *)dict
{
  return (NSString *)+[NSLocale _localeIdentifierFromComponents:]( &OBJC_CLASS___NSLocale,  "_localeIdentifierFromComponents:",  dict);
}

+ (NSString)canonicalLocaleIdentifierFromString:(NSString *)string
{
  if (string) {
    return (NSString *)+[NSLocale _canonicalLocaleIdentifierFromString:]( &OBJC_CLASS___NSLocale,  "_canonicalLocaleIdentifierFromString:");
  }
  else {
    return 0LL;
  }
}

+ (NSString)canonicalLanguageIdentifierFromString:(NSString *)string
{
  if (string) {
    return (NSString *)+[NSLocale _canonicalLanguageIdentifierFromString:]( &OBJC_CLASS___NSLocale,  "_canonicalLanguageIdentifierFromString:");
  }
  else {
    return 0LL;
  }
}

+ (NSString)localeIdentifierFromWindowsLocaleCode:(uint32_t)lcid
{
  return (NSString *)+[NSLocale _localeIdentifierFromWindowsLocaleCode:]( &OBJC_CLASS___NSLocale,  "_localeIdentifierFromWindowsLocaleCode:",  *(void *)&lcid);
}

+ (uint32_t)windowsLocaleCodeFromLocaleIdentifier:(NSString *)localeIdentifier
{
  return +[NSLocale _windowsLocaleCodeFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "_windowsLocaleCodeFromLocaleIdentifier:",  localeIdentifier);
}

+ (NSLocaleLanguageDirection)characterDirectionForLanguage:(NSString *)isoLangCode
{
  return +[NSLocale _characterDirectionForLanguage:]( &OBJC_CLASS___NSLocale,  "_characterDirectionForLanguage:",  isoLangCode);
}

+ (NSLocaleLanguageDirection)lineDirectionForLanguage:(NSString *)isoLangCode
{
  return +[NSLocale _lineDirectionForLanguage:](&OBJC_CLASS___NSLocale, "_lineDirectionForLanguage:", isoLangCode);
}

- (id)_copyDisplayNameForKey:(id)a3 value:(id)a4
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", a3, a4);
}

- (id)_prefForKey:(id)a3
{
  return 0LL;
}

+ (id)internetServicesRegion
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"AppleInternetServicesRegion", @"kCFPreferencesCurrentApplication");
  if (v2)
  {
    v3 = (void *)v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID()) {
      return v3;
    }
    CFRelease(v3);
  }

  return -[NSLocale objectForKey:]( +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"),  "objectForKey:",  @"kCFLocaleCountryCodeKey");
}

- (id)objectForKey:(NSLocaleKey)key
{
  v3 = __CFLookUpClass("NSLocale");
  OUTLINED_FUNCTION_0_26(v3);
  return 0LL;
}

- (NSString)displayNameForKey:(NSLocaleKey)key value:(id)value
{
  CFTypeID v4 = __CFLookUpClass("NSLocale");
  OUTLINED_FUNCTION_0_26(v4);
  return 0LL;
}

@end