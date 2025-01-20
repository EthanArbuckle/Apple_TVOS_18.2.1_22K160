@interface NSPersonNameComponentsFormatter
+ (BOOL)__contents:(id)a3 exclusivelyInCharacterSet:(USet *)a4;
+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForLocalization:(id)a4;
+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForScript:(unint64_t)a4;
+ (BOOL)__shortStyleRestrictionExistsForComponents:(id)a3 shortStyle:(int64_t)a4;
+ (BOOL)__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly;
+ (BOOL)__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly;
+ (BOOL)__style:(int64_t)a3 isRestrictedForLocalization:(id)a4;
+ (BOOL)__style:(int64_t)a3 isRestrictedForScript:(unint64_t)a4;
+ (BOOL)_currentLocaleIsCJK;
+ (BOOL)_isCJKScript:(id)a3;
+ (BOOL)_isMixedScript:(id)a3;
+ (BOOL)_shortNameIsEnabled;
+ (BOOL)_shouldPreferNicknames;
+ (BOOL)isKatakana:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSString)_preferredLocalizationForCurrentLocale;
+ (NSString)localizedStringFromPersonNameComponents:(NSPersonNameComponents *)components style:(NSPersonNameComponentsFormatterStyle)nameFormatStyle options:(NSPersonNameComponentsFormatterOptions)nameOptions;
+ (SEL)__initialsCreatorForScript:(unint64_t)a3;
+ (USet)__getCharacterSetWithPattern:(id)a3;
+ (id)__characterSetWithPattern:(id)a3;
+ (id)__currentLocale;
+ (id)__familyNameFirstOrdering;
+ (id)__givenNameFirstOrdering;
+ (id)__initialsForString:(id)a3;
+ (id)__longestComponentFromComponents:(id)a3;
+ (id)__naiveDelimiterForCombinedNameString:(id)a3;
+ (id)__preferredLanguages;
+ (id)__scriptIdentifierFromIndex:(unint64_t)a3;
+ (id)__stringByStrippingNonInitialPunctuationFromString:(id)a3;
+ (id)__stringValueForShortStyle:(int64_t)a3;
+ (id)__stringValueForStyle:(int64_t)a3;
+ (id)__supportedNameDefaultsFromLocalization:(id)a3;
+ (id)__supportedScriptDefaultsFromScriptName:(id)a3;
+ (id)__thaiConsonantSet;
+ (id)_cjkLanguagesSet;
+ (id)_cjkLocaleIdentifiers;
+ (id)_fallbackDescriptorForStyle:(int64_t)a3 options:(unint64_t)a4;
+ (id)_formatterWithStyle:(int64_t)a3 options:(unint64_t)a4;
+ (id)_localizedDelimiterForComponents:(id)a3 options:(unint64_t)a4;
+ (id)_localizedShortNameForComponents:(id)a3 withStyle:(int64_t)a4 options:(unint64_t)a5;
+ (id)_preferredLocalizationFromLocale:(id)a3;
+ (id)_relevantKeyPathsForStyle:(int64_t)a3 options:(unint64_t)a4;
+ (id)_styleFormatterForStyle:(int64_t)a3 masterFormatter:(id)a4;
+ (id)arabicInitialsCreator;
+ (id)thaiInitialsCreator;
+ (id)tibetanInitialsCreator;
+ (id)westernInitialsCreator;
+ (int64_t)__abbreviatedNameFormatForPersonNameComponents:(id)a3;
+ (int64_t)__abbreviatedNameFormatForString:(id)a3;
+ (int64_t)__nameOrderForLocalization:(id)a3 usingNativeOrdering:(BOOL)a4;
+ (int64_t)__shortNameFormatForLocalization:(id)a3;
+ (int64_t)_defaultDisplayNameOrder;
+ (int64_t)_defaultShortNameFormat;
+ (int64_t)_nameOrderWithOverridesForComponents:(id)a3 options:(unint64_t)a4;
+ (unint64_t)__inferredScriptIndexForComponents:(id)a3;
+ (unint64_t)__inferredScriptIndexForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4;
+ (unint64_t)__inferredScriptIndexFromString:(id)a3;
+ (void)__registerDefaults;
+ (void)forEachExistingComponentWithComponents:(id)a3 performBlock:(id)a4;
- (BOOL)__localizedRestrictionExistsForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4;
- (BOOL)__localizedRestrictionExistsForShortStyle:(int64_t)a3;
- (BOOL)__localizedRestrictionExistsForStyle:(int64_t)a3;
- (BOOL)_forceFamilyNameFirst;
- (BOOL)_forceGivenNameFirst;
- (BOOL)_ignoresFallbacks;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFormatter:(id)a3;
- (BOOL)isPhonetic;
- (NSAttributedString)annotatedStringFromPersonNameComponents:(NSPersonNameComponents *)components;
- (NSLocale)_locale;
- (NSLocale)locale;
- (NSPersonNameComponents)personNameComponentsFromString:(NSString *)string;
- (NSPersonNameComponentsFormatter)init;
- (NSPersonNameComponentsFormatter)initWithCoder:(id)a3;
- (NSPersonNameComponentsFormatter)initWithData:(id)a3;
- (NSPersonNameComponentsFormatterStyle)style;
- (NSString)_preferredLocalizationForExplicitlySetLocale;
- (NSString)stringFromPersonNameComponents:(NSPersonNameComponents *)components;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)__computedNameOrderForComponents:(id)a3;
- (int64_t)__computedShortNameFormat;
- (int64_t)__localizedNameOrderUsingNativeOrdering:(BOOL)a3;
- (int64_t)__localizedShortNameFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setPhonetic:(BOOL)phonetic;
- (void)setStyle:(NSPersonNameComponentsFormatterStyle)style;
- (void)set_forceFamilyNameFirst:(BOOL)a3;
- (void)set_forceGivenNameFirst:(BOOL)a3;
- (void)set_ignoresFallbacks:(BOOL)a3;
- (void)set_locale:(id)a3;
@end

@implementation NSPersonNameComponentsFormatter

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  81LL,  @"Invalid parameter not satisfying: %@",  @"!value || [value isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]");
    }
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSPersonNameComponentsFormatter;
    -[NSPersonNameComponentsFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSPersonNameComponentsFormatter stringFromPersonNameComponents:](self, "stringFromPersonNameComponents:", a3));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSPersonNameComponentsFormatter;
    -[NSPersonNameComponentsFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0LL);
  }

- (NSPersonNameComponentsFormatter)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPersonNameComponentsFormatter;
  v2 = -[NSPersonNameComponentsFormatter init](&v4, sel_init);
  if (v2)
  {
    v2->_private = objc_alloc_init(&OBJC_CLASS____NSPersonNameComponentsFormatterData);
    v2->_lock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (NSPersonNameComponentsFormatter)initWithData:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSPersonNameComponentsFormatter;
  objc_super v4 = -[NSPersonNameComponentsFormatter init](&v6, sel_init);
  if (v4)
  {
    v4->_private = (id)[a3 copy];
    v4->_lock._os_unfair_lock_opaque = 0;
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  preferredLocalizationForExplicitlySetLocale = self->__preferredLocalizationForExplicitlySetLocale;
  if (preferredLocalizationForExplicitlySetLocale)
  {

    self->__preferredLocalizationForExplicitlySetLocale = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPersonNameComponentsFormatter;
  -[NSPersonNameComponentsFormatter dealloc](&v4, sel_dealloc);
}

- (NSString)_preferredLocalizationForExplicitlySetLocale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)-[NSString copy](self->__preferredLocalizationForExplicitlySetLocale, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BOOL)_forceFamilyNameFirst
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private forceFamilyNameFirst];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set_forceFamilyNameFirst:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setForceFamilyNameFirst:v3];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_forceGivenNameFirst
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private forceGivenNameFirst];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set_forceGivenNameFirst:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setForceGivenNameFirst:v3];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_ignoresFallbacks
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private ignoresFallbacks];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set_ignoresFallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setIgnoresFallbacks:v3];
  os_unfair_lock_unlock(p_lock);
}

- (NSLocale)_locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (NSLocale *)[self->_private locale];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)set_locale:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setLocale:a3];
  if (a3) {
    self->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend( +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:]( NSPersonNameComponentsFormatter,  "_preferredLocalizationFromLocale:",  a3),  "copy");
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSLocale)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)[self->_private locale];
  os_unfair_lock_unlock(p_lock);
  if (!v4) {
    objc_super v4 = (void *)[MEMORY[0x189603F90] autoupdatingCurrentLocale];
  }
  return (NSLocale *)v4;
}

- (void)setLocale:(NSLocale *)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setLocale:locale];
  if (locale) {
    self->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend( +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:]( NSPersonNameComponentsFormatter,  "_preferredLocalizationFromLocale:",  locale),  "copy");
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPhonetic
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private phonetic];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPhonetic:(BOOL)phonetic
{
  BOOL v3 = phonetic;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setPhonetic:v3];
  os_unfair_lock_unlock(p_lock);
}

- (NSPersonNameComponentsFormatterStyle)style
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSPersonNameComponentsFormatterStyle v4 = [self->_private style];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStyle:(NSPersonNameComponentsFormatterStyle)style
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setStyle:style];
  os_unfair_lock_unlock(p_lock);
}

+ (id)__currentLocale
{
  if (qword_18C496430 != -1) {
    dispatch_once(&qword_18C496430, &__block_literal_global_85);
  }
  return (id)qword_18C496428;
}

id __50__NSPersonNameComponentsFormatter___currentLocale__block_invoke()
{
  id result = (id)[MEMORY[0x189603F90] autoupdatingCurrentLocale];
  qword_18C496428 = (uint64_t)result;
  return result;
}

+ (NSString)_preferredLocalizationForCurrentLocale
{
  if (qword_18C496440 != -1) {
    dispatch_once(&qword_18C496440, &__block_literal_global_255);
  }
  return (NSString *)qword_18C496438;
}

id __73__NSPersonNameComponentsFormatter__preferredLocalizationForCurrentLocale__block_invoke()
{
  id result =  +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:]( NSPersonNameComponentsFormatter,  "_preferredLocalizationFromLocale:",  [MEMORY[0x189603F90] autoupdatingCurrentLocale]);
  qword_18C496438 = (uint64_t)result;
  return result;
}

+ (id)__preferredLanguages
{
  return (id)[MEMORY[0x189603F90] preferredLanguages];
}

+ (BOOL)__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly
{
  return 1;
}

+ (BOOL)__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly
{
  if (objc_msgSend( a1,  "__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly",  MEMORY[0x1895F87A8],  3221225472,  __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke,  &unk_189C9A030,  a1,  *MEMORY[0x1895F89C0]))
  {
    if (qword_18C496448 != -1) {
      dispatch_once(&qword_18C496448, &v3);
    }
  }

  else
  {
    __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke((uint64_t)&v3);
  }

  return _MergedGlobals_7_2;
}

uint64_t __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke( uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  _MergedGlobals_7_2 = 0;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "__preferredLanguages");
  uint64_t result = [v1 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v10;
    uint64_t v5 = *MEMORY[0x189603AD0];
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v4) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = (void *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F90],  "componentsFromLocaleIdentifier:",  *(void *)(*((void *)&v9 + 1) + 8 * v6)),  "objectForKey:",  v5);
      uint64_t result = [v7 isEqualToString:@"ja"];
      if ((result & 1) != 0) {
        break;
      }
      uint64_t result = [v7 isEqualToString:@"zh"];
      if ((_DWORD)result)
      {
        _MergedGlobals_7_2 = 1;
        return result;
      }

      if (v3 == ++v6)
      {
        uint64_t result = [v1 countByEnumeratingWithState:&v9 objects:v8 count:16];
        uint64_t v3 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }

  return result;
}

+ (id)_formatterWithStyle:(int64_t)a3 options:(unint64_t)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setStyle:a3];
  [v6 setPhonetic:(a4 >> 1) & 1];
  objc_msgSend(v6, "set_forceFamilyNameFirst:", (a4 >> 30) & 1);
  objc_msgSend(v6, "set_forceGivenNameFirst:", (a4 >> 31) & 1);
  return v6;
}

+ (NSString)localizedStringFromPersonNameComponents:(NSPersonNameComponents *)components style:(NSPersonNameComponentsFormatterStyle)nameFormatStyle options:(NSPersonNameComponentsFormatterOptions)nameOptions
{
  if (!components) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSPersonNameComponentsFormatter.m",  1712LL,  @"Invalid parameter not satisfying: %@",  @"components != nil");
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSPersonNameComponentsFormatter.m",  1713LL,  @"Invalid parameter not satisfying: %@",  @"[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]");
  }
  return (NSString *)objc_msgSend( (id)objc_msgSend(a1, "_formatterWithStyle:options:", nameFormatStyle, nameOptions),  "stringFromPersonNameComponents:",  components);
}

+ (id)__familyNameFirstOrdering
{
  if (qword_18C496458 != -1) {
    dispatch_once(&qword_18C496458, &__block_literal_global_266);
  }
  return (id)qword_18C496450;
}

id __60__NSPersonNameComponentsFormatter___familyNameFirstOrdering__block_invoke()
{
  v1[5] = *MEMORY[0x1895F89C0];
  v1[0] = @"namePrefix";
  v1[1] = @"familyName";
  v1[2] = @"givenName";
  v1[3] = @"middleName";
  v1[4] = @"nameSuffix";
  id result = (id)[MEMORY[0x189603F18] arrayWithObjects:v1 count:5];
  qword_18C496450 = (uint64_t)result;
  return result;
}

+ (id)__givenNameFirstOrdering
{
  if (qword_18C496468 != -1) {
    dispatch_once(&qword_18C496468, &__block_literal_global_267);
  }
  return (id)qword_18C496460;
}

id __59__NSPersonNameComponentsFormatter___givenNameFirstOrdering__block_invoke()
{
  v1[5] = *MEMORY[0x1895F89C0];
  v1[0] = @"namePrefix";
  v1[1] = @"givenName";
  v1[2] = @"middleName";
  v1[3] = @"familyName";
  v1[4] = @"nameSuffix";
  id result = (id)[MEMORY[0x189603F18] arrayWithObjects:v1 count:5];
  qword_18C496460 = (uint64_t)result;
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0) {
    return -[NSPersonNameComponentsFormatter stringFromPersonNameComponents:]( self,  "stringFromPersonNameComponents:",  a3);
  }
  else {
    return 0LL;
  }
}

- (NSString)stringFromPersonNameComponents:(NSPersonNameComponents *)components
{
  if (!components) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSPersonNameComponentsFormatter.m",  1749LL,  @"Invalid parameter not satisfying: %@",  @"components != nil");
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSPersonNameComponentsFormatter.m",  1750LL,  @"Invalid parameter not satisfying: %@",  @"[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]");
  }
  id result = (NSString *)objc_msgSend( +[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:]( NSPersonNameComponentsFormatter,  "_styleFormatterForStyle:masterFormatter:",  -[NSPersonNameComponentsFormatter style](self, "style"),  self),  "stringFromComponents:attributesByRange:",  components,  0);
  if (!result)
  {
    if (qword_18C4964C0 != -1) {
      dispatch_once(&qword_18C4964C0, &__block_literal_global_1108);
    }
    if (byte_18C496421) {
      return (NSString *)&stru_189CA6A28;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (NSAttributedString)annotatedStringFromPersonNameComponents:(NSPersonNameComponents *)components
{
  if (!components) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSPersonNameComponentsFormatter.m",  1763LL,  @"Invalid parameter not satisfying: %@",  @"components != nil");
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSPersonNameComponentsFormatter.m",  1764LL,  @"Invalid parameter not satisfying: %@",  @"[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]");
  }
  id result = (NSAttributedString *)objc_msgSend( +[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:]( NSPersonNameComponentsFormatter,  "_styleFormatterForStyle:masterFormatter:",  -[NSPersonNameComponentsFormatter style](self, "style"),  self),  "annotatedStringFromPersonNameComponents:",  components);
  if (!result)
  {
    if (qword_18C4964C0 != -1) {
      dispatch_once(&qword_18C4964C0, &__block_literal_global_1108);
    }
    if (byte_18C496421) {
      return  -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  &stru_189CA6A28);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

+ (id)_styleFormatterForStyle:(int64_t)a3 masterFormatter:(id)a4
{
  uint64_t v4 = off_189C62270;
  switch(a3)
  {
    case 0LL:
    case 2LL:
      return (id)[objc_alloc(*v4) initWithMasterFormatter:a4];
    case 1LL:
      uint64_t v4 = off_189C62278;
      return (id)[objc_alloc(*v4) initWithMasterFormatter:a4];
    case 3LL:
      uint64_t v4 = off_189C62268;
      return (id)[objc_alloc(*v4) initWithMasterFormatter:a4];
    case 4LL:
      uint64_t v4 = off_189C62238;
      return (id)[objc_alloc(*v4) initWithMasterFormatter:a4];
    default:
      if (a3 != 31) {
        return 0LL;
      }
      uint64_t v4 = off_189C62240;
      return (id)[objc_alloc(*v4) initWithMasterFormatter:a4];
  }

+ (void)forEachExistingComponentWithComponents:(id)a3 performBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = +[NSPersonNameComponents _allComponents](&OBJC_CLASS___NSPersonNameComponents, "_allComponents");
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          __int128 v12 = (void *)[a3 valueForKeyPath:v11];
          if ([v12 length]) {
            (*((void (**)(id, uint64_t, void *))a4 + 2))(a4, v11, v12);
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }

      while (v8);
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSPersonNameComponentsFormatter.m",  1808LL,  @"block to perform should not be nil");
  }

+ (BOOL)isKatakana:(id)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46__NSPersonNameComponentsFormatter_isKatakana___block_invoke;
  v6[3] = &unk_189C9A030;
  v6[4] = a1;
  if (qword_18C496478 != -1) {
    dispatch_once(&qword_18C496478, v6);
  }
  return objc_msgSend(a1, "__contents:exclusivelyInCharacterSet:", a3, qword_18C496470);
}

uint64_t __46__NSPersonNameComponentsFormatter_isKatakana___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__getCharacterSetWithPattern:", @"[:scx=Kana:]");
  qword_18C496470 = result;
  return result;
}

+ (id)__thaiConsonantSet
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __53__NSPersonNameComponentsFormatter___thaiConsonantSet__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C496488 != -1) {
    dispatch_once(&qword_18C496488, v3);
  }
  return (id)qword_18C496480;
}

id __53__NSPersonNameComponentsFormatter___thaiConsonantSet__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend( *(id *)(a1 + 32),  "__characterSetWithPattern:",  @"[กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ]");
  qword_18C496480 = (uint64_t)result;
  return result;
}

+ (id)__characterSetWithPattern:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__33;
  __int128 v14 = __Block_byref_object_dispose__33;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v15 = 0LL;
  CFIndex v4 = objc_msgSend( a3,  "length",  MEMORY[0x1895F87A8],  3221225472,  __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke,  &unk_189CA5E20,  &v10);
  if (CFStringGetCharactersPtr((CFStringRef)a3))
  {
    __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke((uint64_t)&v9);
  }

  else
  {
    unint64_t v5 = 2 * v4;
    if ((unint64_t)(2 * v4) < 0x101)
    {
      if (v4)
      {
        MEMORY[0x1895F8858](0LL);
        id v6 = (UniChar *)((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      }

      else
      {
        id v6 = 0LL;
      }
    }

    else
    {
      id v6 = (UniChar *)malloc(2 * v4);
    }

    v17.location = 0LL;
    v17.length = v4;
    CFStringGetCharacters((CFStringRef)a3, v17, v6);
    __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke((uint64_t)&v9);
    if (v5 >= 0x101) {
      free(v6);
    }
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = _CFCreateCharacterSetFromUSet();
  return uset_close();
}

+ (USet)__getCharacterSetWithPattern:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  if (a3)
  {
    CFIndex v4 = objc_msgSend(a3, "length", v9);
    if (CFStringGetCharactersPtr((CFStringRef)a3))
    {
      int v13 = 0;
      v10[3] = uset_openPattern();
    }

    else
    {
      unint64_t v6 = 2 * v4;
      if ((unint64_t)(2 * v4) < 0x101)
      {
        if (v4)
        {
          MEMORY[0x1895F8858](0LL);
          id v7 = (UniChar *)((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
        }

        else
        {
          id v7 = 0LL;
        }
      }

      else
      {
        id v7 = (UniChar *)malloc(2 * v4);
      }

      v15.location = 0LL;
      v15.length = v4;
      CFStringGetCharacters((CFStringRef)a3, v15, v7);
      int v13 = 0;
      v10[3] = uset_openPattern();
      if (v6 >= 0x101) {
        free(v7);
      }
    }

    unint64_t v5 = (USet *)v10[3];
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

+ (BOOL)__contents:(id)a3 exclusivelyInCharacterSet:(USet *)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a3 || ![a3 length]) {
    return 1;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  CFIndex v5 = [a3 length];
  if (CFStringGetCharactersPtr((CFStringRef)a3))
  {
    *((_BYTE *)v12 + 24) = uset_containsAllCodePoints() != 0;
  }

  else
  {
    unint64_t v7 = 2 * v5;
    if ((unint64_t)(2 * v5) < 0x101)
    {
      if (v5)
      {
        MEMORY[0x1895F8858](0LL);
        uint64_t v8 = (UniChar *)((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      }

      else
      {
        uint64_t v8 = 0LL;
      }
    }

    else
    {
      uint64_t v8 = (UniChar *)malloc(2 * v5);
    }

    v16.location = 0LL;
    v16.length = v5;
    CFStringGetCharacters((CFStringRef)a3, v16, v8);
    *((_BYTE *)v12 + 24) = uset_containsAllCodePoints() != 0;
    if (v7 >= 0x101) {
      free(v8);
    }
  }

  BOOL v6 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)__longestComponentFromComponents:(id)a3
{
  v12[4] = *MEMORY[0x1895F89C0];
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2020000000LL;
  v12[3] = 0LL;
  uint64_t v6 = 0LL;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __68__NSPersonNameComponentsFormatter___longestComponentFromComponents___block_invoke;
  v5[3] = &unk_189CA5E48;
  v5[4] = v12;
  v5[5] = &v6;
  [a1 forEachExistingComponentWithComponents:a3 performBlock:v5];
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v12, 8);
  return v3;
}

unint64_t __68__NSPersonNameComponentsFormatter___longestComponentFromComponents___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  unint64_t result = [a3 length];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (result > *(void *)(v6 + 24))
  {
    *(void *)(v6 + 24) = result;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a3;
  }

  return result;
}

+ (id)__stringByStrippingNonInitialPunctuationFromString:(id)a3
{
  if (qword_18C496498 != -1) {
    dispatch_once(&qword_18C496498, &__block_literal_global_279);
  }
  if ([a3 length]
    && (![a3 rangeOfCharacterFromSet:qword_18C496490] ? (BOOL v5 = v4 == 0) : (BOOL v5 = 1), v5))
  {
    return (id)objc_msgSend( (id)objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", qword_18C496490),  "componentsJoinedByString:",  &stru_189CA6A28);
  }

  else
  {
    return a3;
  }

NSCharacterSet *__86__NSPersonNameComponentsFormatter___stringByStrippingNonInitialPunctuationFromString___block_invoke()
{
  unint64_t result =  -[NSCharacterSet invertedSet]( +[NSCharacterSet letterCharacterSet](&OBJC_CLASS___NSCharacterSet, "letterCharacterSet"),  "invertedSet");
  qword_18C496490 = (uint64_t)result;
  return result;
}

+ (unint64_t)__inferredScriptIndexFromString:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_msgSend( (id)objc_msgSend(a1, "__stringByStrippingNonInitialPunctuationFromString:", a3),  "stringByReplacingOccurrencesOfString:withString:",  @" ",  &stru_189CA6A28);
  unint64_t v4 = [v3 length];
  MEMORY[0x1895F8858](v4);
  unint64_t v7 = (char *)v11 - v6;
  if (v8 > 0x100) {
    unint64_t v7 = (char *)malloc(2 * v5);
  }
  else {
    bzero((char *)v11 - v6, 2 * v5);
  }
  objc_msgSend(v3, "getCharacters:range:", v7, 0, objc_msgSend(v3, "length"));
  unint64_t v9 = NSOrthographyScriptIndexForCharacters((uint64_t)v7, [v3 length], 0);
  if (v4 >= 0x101) {
    free(v7);
  }
  return v9;
}

+ (unint64_t)__inferredScriptIndexForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = +[NSPersonNameComponents _allComponents](&OBJC_CLASS___NSPersonNameComponents, "_allComponents");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0LL;
  uint64_t v11 = *(void *)v21;
  do
  {
    for (uint64_t i = 0LL; i != v9; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = (void *)objc_msgSend( a1,  "__stringByStrippingNonInitialPunctuationFromString:",  objc_msgSend(a3, "valueForKeyPath:", *(void *)(*((void *)&v20 + 1) + 8 * i)));
      if (v13)
      {
        char v14 = v13;
        if ([v13 length])
        {
          uint64_t v15 = objc_msgSend(a1, "__inferredScriptIndexFromString:", v14);
          BOOL v16 = v15 == 1 && a4;
          if (v15 && !v16)
          {
            if (v10 == v15 || v10 == 0) {
              unint64_t v10 = v15;
            }
            else {
              unint64_t v10 = 1LL;
            }
          }
        }
      }
    }

    uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  }

  while (v9);
  return v10;
}

+ (unint64_t)__inferredScriptIndexForComponents:(id)a3
{
  return objc_msgSend(a1, "__inferredScriptIndexForComponents:ignoreUndeterminedComponents:", a3, 0);
}

+ (id)__scriptIdentifierFromIndex:(unint64_t)a3
{
  return +[NSOrthography _scriptNameForScriptIndex:](&OBJC_CLASS___NSOrthography, "_scriptNameForScriptIndex:", a3);
}

+ (id)__naiveDelimiterForCombinedNameString:(id)a3
{
  return &stru_189CA6A28;
}

+ (BOOL)_isCJKScript:(id)a3
{
  unint64_t v4 = (void *)[a3 _scriptDeterminingStringRepresentationWithPhoneticDesired:0];
  uint64_t v5 = [v4 length];
  if (v5) {
    LOBYTE(v5) = objc_msgSend( +[NSPersonNameComponentsFormatter _cjkLanguagesSet]( NSPersonNameComponentsFormatter,  "_cjkLanguagesSet"),  "containsObject:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(a1, "__inferredScriptIndexFromString:", v4)));
  }
  return v5;
}

+ (BOOL)_isMixedScript:(id)a3
{
  return objc_msgSend(a1, "__inferredScriptIndexForComponents:", a3) == 1;
}

+ (id)_cjkLanguagesSet
{
  if (qword_18C4964A8 != -1) {
    dispatch_once(&qword_18C4964A8, &__block_literal_global_283);
  }
  return (id)qword_18C4964A0;
}

uint64_t __51__NSPersonNameComponentsFormatter__cjkLanguagesSet__block_invoke()
{
  uint64_t result = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  &off_189D0ECC0,  &off_189D0ECD8,  &off_189D0ECF0,  &off_189D0ED08,  0);
  qword_18C4964A0 = result;
  return result;
}

+ (id)_cjkLocaleIdentifiers
{
  if (qword_18C4964B8 != -1) {
    dispatch_once(&qword_18C4964B8, &__block_literal_global_288);
  }
  return (id)qword_18C4964B0;
}

uint64_t __56__NSPersonNameComponentsFormatter__cjkLocaleIdentifiers__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", @"ja", @"zh", @"ko", 0);
  qword_18C4964B0 = result;
  return result;
}

+ (BOOL)_currentLocaleIsCJK
{
  id v3 = +[NSPersonNameComponentsFormatter __currentLocale]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__currentLocale");
  return objc_msgSend( (id)objc_msgSend(a1, "_cjkLocaleIdentifiers"),  "containsObject:",  objc_msgSend(v3, "objectForKey:", *MEMORY[0x189603AD0]));
}

- (int64_t)__computedNameOrderForComponents:(id)a3
{
  int v5 = [a3 _isEmpty];
  if (!a3 || v5) {
    return -[NSPersonNameComponentsFormatter __localizedNameOrderUsingNativeOrdering:]( self,  "__localizedNameOrderUsingNativeOrdering:",  1LL);
  }
  if (!+[NSPersonNameComponentsFormatter _isCJKScript:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_isCJKScript:",  a3))
  {
    if (-[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale]( self,  "_preferredLocalizationForExplicitlySetLocale"))
    {
      int64_t result = +[NSPersonNameComponentsFormatter __nameOrderForLocalization:usingNativeOrdering:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__nameOrderForLocalization:usingNativeOrdering:",  -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale]( self,  "_preferredLocalizationForExplicitlySetLocale"),  1LL);
      if (result) {
        goto LABEL_8;
      }
    }

    if (!-[NSPersonNameComponentsFormatter _forceFamilyNameFirst](self, "_forceFamilyNameFirst"))
    {
      if (-[NSPersonNameComponentsFormatter _forceGivenNameFirst](self, "_forceGivenNameFirst"))
      {
        int64_t result = 1LL;
      }

      else
      {
        int64_t result = +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_defaultDisplayNameOrder");
        if (!result) {
          int64_t result = -[NSPersonNameComponentsFormatter __localizedNameOrderUsingNativeOrdering:]( self,  "__localizedNameOrderUsingNativeOrdering:",  0LL);
        }
      }

      goto LABEL_8;
    }
  }

  int64_t result = 2LL;
LABEL_8:
  return result;
}

- (int64_t)__computedShortNameFormat
{
  int64_t result = +[NSPersonNameComponentsFormatter _defaultShortNameFormat]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_defaultShortNameFormat");
  if (!result) {
    return -[NSPersonNameComponentsFormatter __localizedShortNameFormat](self, "__localizedShortNameFormat");
  }
  return result;
}

- (BOOL)__localizedRestrictionExistsForStyle:(int64_t)a3
{
  unint64_t v4 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale]( self,  "_preferredLocalizationForExplicitlySetLocale");
  if (!v4) {
    unint64_t v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_preferredLocalizationForCurrentLocale");
  }
  return +[NSPersonNameComponentsFormatter __style:isRestrictedForLocalization:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__style:isRestrictedForLocalization:",  a3,  v4);
}

- (BOOL)__localizedRestrictionExistsForShortStyle:(int64_t)a3
{
  unint64_t v4 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale]( self,  "_preferredLocalizationForExplicitlySetLocale");
  if (!v4) {
    unint64_t v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_preferredLocalizationForCurrentLocale");
  }
  return +[NSPersonNameComponentsFormatter __shortStyle:isRestrictedForLocalization:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__shortStyle:isRestrictedForLocalization:",  a3,  v4);
}

- (BOOL)__localizedRestrictionExistsForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4
{
  return +[NSPersonNameComponentsFormatter __style:isRestrictedForScript:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__style:isRestrictedForScript:",  -[NSPersonNameComponentsFormatter style](self, "style"),  +[NSPersonNameComponentsFormatter __inferredScriptIndexForComponents:ignoreUndeterminedComponents:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__inferredScriptIndexForComponents:ignoreUndeterminedComponents:",  a3,  a4));
}

+ (BOOL)__shortStyleRestrictionExistsForComponents:(id)a3 shortStyle:(int64_t)a4
{
  return +[NSPersonNameComponentsFormatter __shortStyle:isRestrictedForScript:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__shortStyle:isRestrictedForScript:",  a4,  +[NSPersonNameComponentsFormatter __inferredScriptIndexForComponents:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__inferredScriptIndexForComponents:",  a3));
}

- (int64_t)__localizedNameOrderUsingNativeOrdering:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale]( self,  "_preferredLocalizationForExplicitlySetLocale");
  if (!v4) {
    unint64_t v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_preferredLocalizationForCurrentLocale");
  }
  return +[NSPersonNameComponentsFormatter __nameOrderForLocalization:usingNativeOrdering:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__nameOrderForLocalization:usingNativeOrdering:",  v4,  v3);
}

- (int64_t)__localizedShortNameFormat
{
  v2 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale]( self,  "_preferredLocalizationForExplicitlySetLocale");
  if (!v2) {
    v2 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "_preferredLocalizationForCurrentLocale");
  }
  return +[NSPersonNameComponentsFormatter __shortNameFormatForLocalization:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__shortNameFormatForLocalization:",  v2);
}

+ (int64_t)_nameOrderWithOverridesForComponents:(id)a3 options:(unint64_t)a4
{
  return objc_msgSend( (id)objc_msgSend(a1, "_formatterWithStyle:options:", 0, a4),  "_nameOrderWithOverridesForComponents:",  a3);
}

+ (id)_localizedDelimiterForComponents:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend( a1,  "__naiveDelimiterForCombinedNameString:",  objc_msgSend(a3, "_scriptDeterminingStringRepresentationWithPhoneticDesired:", (a4 >> 1) & 1));
}

+ (id)_relevantKeyPathsForStyle:(int64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend( +[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:]( NSPersonNameComponentsFormatter,  "_styleFormatterForStyle:masterFormatter:",  a3,  objc_msgSend(a1, "_formatterWithStyle:options:", a3, a4)),  "orderedKeysOfInterest");
}

+ (id)_fallbackDescriptorForStyle:(int64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend( +[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:]( NSPersonNameComponentsFormatter,  "_styleFormatterForStyle:masterFormatter:",  a3,  objc_msgSend(a1, "_formatterWithStyle:options:", a3, a4)),  "fallbackDescriptor");
}

- (NSPersonNameComponents)personNameComponentsFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!string) {
    return 0LL;
  }
  v4[0] = 0LL;
  if (-[NSPersonNameComponentsFormatter getObjectValue:forString:errorDescription:]( self,  "getObjectValue:forString:errorDescription:",  v4,  string,  0LL))
  {
    return (NSPersonNameComponents *)v4[0];
  }

  else
  {
    return 0LL;
  }

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v10 = (void *)*((void *)self->_private + 4);
  if (!v10)
  {
    NPNameParserClass = (objc_class *)getNPNameParserClass();
    if (!NPNameParserClass) {
      goto LABEL_8;
    }
    *((void *)self->_private + 4) = objc_alloc_init(NPNameParserClass);
    unint64_t v10 = (void *)*((void *)self->_private + 4);
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v12 = (void *)[v10 personNameComponentsFromString:string];
  if (!v12)
  {
LABEL_8:
    if (!error) {
      return 0;
    }
    char v14 = (NSString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Person's name could not be detected" value:&stru_189CA6A28 table:@"Formatter"];
    BOOL result = 0;
    *error = v14;
    return result;
  }

  if (obj) {
    *obj = v12;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithData:",  self->_private);
  uint64_t v7 = [self->_private locale];
  if (v7) {
    v6[2] = objc_msgSend( +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:]( NSPersonNameComponentsFormatter,  "_preferredLocalizationFromLocale:",  v7),  "copy");
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersonNameComponentsFormatter)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    int v5 = -[NSPersonNameComponentsFormatter initWithData:]( self,  "initWithData:",  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.nameComponentsFormatterPrivate"]);
    uint64_t v6 = [v5->_private locale];
    if (v6) {
      v5->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend( +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:]( NSPersonNameComponentsFormatter,  "_preferredLocalizationFromLocale:",  v6),  "copy");
    }
    return v5;
  }

  else
  {
    uint64_t v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ cannot be decoded by non-keyed archivers",  objc_opt_class());

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
    -[NSPersonNameComponentsFormatter encodeWithCoder:](v9, v10, v11);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    os_unfair_lock_lock(&self->_lock);
    [a3 encodeObject:self->_private forKey:@"NS.nameComponentsFormatterPrivate"];
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
    -[NSPersonNameComponentsFormatter isEqual:](v5, v6, v7);
  }

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NSPersonNameComponentsFormatter isEqualToFormatter:](self, "isEqualToFormatter:");
}

- (BOOL)isEqualToFormatter:(id)a3
{
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = -[_NSPersonNameComponentsFormatterData isEqualToFormatterData:](self->_private, *((void **)a3 + 1));
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

+ (id)_localizedShortNameForComponents:(id)a3 withStyle:(int64_t)a4 options:(unint64_t)a5
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSPersonNameComponentsFormatter.m",  2298LL,  @"Components should not be nil");
  }
  uint64_t v9 =  -[_NSPersonNameComponentsStyleFormatterShort initWithMasterFormatter:]( [_NSPersonNameComponentsStyleFormatterShort alloc],  "initWithMasterFormatter:",  [a1 _formatterWithStyle:1 options:a5]);
  -[_NSPersonNameComponentsStyleFormatterShort setShortNameFormat:](v9, "setShortNameFormat:", a4);
  -[_NSPersonNameComponentsStyleFormatterShort setForceShortNameEnabled:](v9, "setForceShortNameEnabled:", 1LL);
  return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:]( v9,  "stringFromComponents:attributesByRange:",  a3,  0LL);
}

+ (int64_t)_defaultDisplayNameOrder
{
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultDisplayNameOrder"]) != 0)
  {
    return [v2 integerValue];
  }

  else
  {
    return objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "integerForKey:",  @"NSPersonNameDefaultDisplayNameOrder");
  }

+ (int64_t)_defaultShortNameFormat
{
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultShortNameFormat"]) != 0)
  {
    return [v2 integerValue];
  }

  else
  {
    return objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "integerForKey:",  @"NSPersonNameDefaultShortNameFormat");
  }

+ (BOOL)_shouldPreferNicknames
{
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultShouldPreferNicknamesPreference"]) != 0)
  {
    return [v2 BOOLValue];
  }

  else
  {
    return objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSPersonNameDefaultShouldPreferNicknamesPreference");
  }

+ (BOOL)_shortNameIsEnabled
{
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultShortNameEnabled"]) != 0)
  {
    return [v2 BOOLValue];
  }

  else
  {
    return objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSPersonNameDefaultShortNameEnabled");
  }

+ (id)__initialsForString:(id)a3
{
  uint64_t v4 = objc_msgSend( a1,  "performSelector:",  +[NSPersonNameComponentsFormatter __initialsCreatorForScript:]( NSPersonNameComponentsFormatter,  "__initialsCreatorForScript:",  +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:]( NSPersonNameComponentsFormatter,  "__inferredScriptIndexFromString:")));
  return (id)(*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, a3);
}

+ (id)westernInitialsCreator
{
  return &__block_literal_global_301;
}

uint64_t __57__NSPersonNameComponentsFormatter_westernInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeOfComposedCharacterSequenceAtIndex:0];
  return objc_msgSend(a2, "substringWithRange:", v3, v4);
}

+ (id)thaiInitialsCreator
{
  return &__block_literal_global_302_0;
}

uint64_t __54__NSPersonNameComponentsFormatter_thaiInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend( a2,  "rangeOfCharacterFromSet:",  +[NSPersonNameComponentsFormatter __thaiConsonantSet]( NSPersonNameComponentsFormatter,  "__thaiConsonantSet"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return (uint64_t)a2;
  }
  else {
    return objc_msgSend(a2, "substringWithRange:", v3, v4);
  }
}

+ (id)tibetanInitialsCreator
{
  return &__block_literal_global_303_0;
}

uint64_t __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  uint64_t v3 = [a2 length];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke_2;
  v6[3] = &unk_189CA5F30;
  v6[4] = a2;
  v6[5] = &v11;
  void v6[6] = &v7;
  objc_msgSend(a2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 514, v6);
  else {
    uint64_t v4 = 0LL;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  _BYTE *a7)
{
  uint64_t v9 = result;
  if (a4 == 1
    && ((BOOL result = objc_msgSend(*(id *)(result + 32), "characterAtIndex:"), (_DWORD)result == 3853)
     || (_DWORD)result == 3851))
  {
    *a7 = 1;
  }

  else if (++*(void *)(*(void *)(*(void *)(v9 + 40) + 8LL) + 24LL) < 3uLL)
  {
    *(void *)(*(void *)(*(void *)(v9 + 48) + 8LL) + 24LL) += a4;
  }

  else
  {
    *a7 = 1;
  }

  return result;
}

+ (id)arabicInitialsCreator
{
  return &__block_literal_global_304;
}

uint64_t __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  BOOL v16 = __Block_byref_object_copy__33;
  CFRange v17 = __Block_byref_object_dispose__33;
  uint64_t v18 = 0LL;
  uint64_t v3 = [a2 length];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke_2;
  v12[3] = &unk_189CA1A30;
  v12[4] = &v13;
  objc_msgSend(a2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v12);
  id v4 = (id)v14[5];
  uint64_t v5 = [(id)v14[5] length];
  SEL v6 = v14;
  if (v5)
  {
    int v7 = [(id)v14[5] isEqualToString:@"ه"];
    SEL v6 = v14;
    if (v7)
    {
      uint64_t v8 = @"ه‍";
LABEL_6:
      v6[5] = (uint64_t)v8;
      goto LABEL_7;
    }

    int v9 = [(id)v14[5] isEqualToString:@"ہ"];
    SEL v6 = v14;
    if (v9)
    {
      uint64_t v8 = @"ھ";
      goto LABEL_6;
    }
  }

uint64_t __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  _BYTE *a7)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  *a7 = 1;
  return result;
}

+ (void)__registerDefaults
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __53__NSPersonNameComponentsFormatter___registerDefaults__block_invoke;
  v2[3] = &unk_189C9A030;
  v2[4] = a1;
  if (__registerDefaults_onceToken != -1) {
    dispatch_once(&__registerDefaults_onceToken, v2);
  }
}

uint64_t __53__NSPersonNameComponentsFormatter___registerDefaults__block_invoke(uint64_t a1)
{
  v8[4] = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_msgSend( *(id *)(a1 + 32),  "_preferredLocalizationFromLocale:",  objc_msgSend(*(id *)(a1 + 32), "__currentLocale"));
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "__style:isRestrictedForLocalization:", 1, v2) ^ 1;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "__shortNameFormatForLocalization:", v2);
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "__nameOrderForLocalization:usingNativeOrdering:", v2, 0);
  v8[0] = MEMORY[0x189604A88];
  v7[0] = @"NSPersonNameDefaultShouldPreferNicknamesPreference";
  v7[1] = @"NSPersonNameDefaultShortNameEnabled";
  v8[1] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3);
  v7[2] = @"NSPersonNameDefaultShortNameFormat";
  v8[2] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
  v7[3] = @"NSPersonNameDefaultDisplayNameOrder";
  v8[3] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5);
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:4];
  return _CFXPreferencesRegisterDefaultValues();
}

+ (id)_preferredLocalizationFromLocale:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(&unk_189D1FDB0, "objectForKeyedSubscript:", @"localeInfo"), "allKeys");
  v6[0] = [a3 localeIdentifier];
  return -[NSArray objectAtIndexedSubscript:]( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v4,  [MEMORY[0x189603F18] arrayWithObjects:v6 count:1]),  "objectAtIndexedSubscript:",  0);
}

+ (id)__supportedNameDefaultsFromLocalization:(id)a3
{
  return (id)objc_msgSend( (id)objc_msgSend(&unk_189D20710, "objectForKeyedSubscript:", @"localeInfo"),  "objectForKeyedSubscript:",  a3);
}

+ (id)__supportedScriptDefaultsFromScriptName:(id)a3
{
  if (a3) {
    return (id)objc_msgSend( (id)objc_msgSend(&unk_189D21070, "objectForKeyedSubscript:", @"scriptInfo"),  "objectForKeyedSubscript:",  a3);
  }
  else {
    return 0LL;
  }
}

+ (int64_t)__nameOrderForLocalization:(id)a3 usingNativeOrdering:(BOOL)a4
{
  uint64_t v5 = (void *)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a3);
  SEL v6 = v5;
  return [v7 integerValue];
}

+ (int64_t)__abbreviatedNameFormatForString:(id)a3
{
  if (![a3 length]) {
    return 6LL;
  }
  int64_t result = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( a1,  "__supportedScriptDefaultsFromScriptName:",  objc_msgSend( a1,  "__scriptIdentifierFromIndex:",  objc_msgSend(a1, "__inferredScriptIndexFromString:", a3))),  "objectForKeyedSubscript:",  @"abbreviatedNameStyle"),  "integerValue");
  if (!result) {
    return 5LL;
  }
  return result;
}

+ (int64_t)__abbreviatedNameFormatForPersonNameComponents:(id)a3
{
  int64_t v5 = objc_msgSend(a1, "__abbreviatedNameFormatForString:", objc_msgSend(a3, "givenName"));
  int64_t v6 = objc_msgSend(a1, "__abbreviatedNameFormatForString:", objc_msgSend(a3, "familyName"));
  if (v6 != v5)
  {
    if (v5 == 6 || v6 == 2 || v6 == 4)
    {
      return v6;
    }

    else if (v6 != 6 && (v5 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    {
      if (v6 == 3)
      {
        return 4LL;
      }

      else if (v6 == 5)
      {
        if (((v5 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
          return 2LL;
        }
        else {
          return 6LL;
        }
      }

      else
      {
        return 2LL;
      }
    }
  }

  return v5;
}

+ (int64_t)__shortNameFormatForLocalization:(id)a3
{
  return objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a3),  "objectForKeyedSubscript:",  @"shortNameStyle"),  "integerValue");
}

+ (BOOL)__style:(int64_t)a3 isRestrictedForLocalization:(id)a4
{
  int64_t v6 = (void *)objc_msgSend( (id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a4),  "objectForKeyedSubscript:",  @"styleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForStyle:", a3);
  return v6 && [v6 objectForKeyedSubscript:v7] != 0;
}

+ (BOOL)__style:(int64_t)a3 isRestrictedForScript:(unint64_t)a4
{
  int64_t v6 = (void *)objc_msgSend( (id)objc_msgSend( a1,  "__supportedScriptDefaultsFromScriptName:",  objc_msgSend(a1, "__scriptIdentifierFromIndex:", a4)),  "objectForKeyedSubscript:",  @"styleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForStyle:", a3);
  return v6 && [v6 objectForKeyedSubscript:v7] != 0;
}

+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForScript:(unint64_t)a4
{
  int64_t v6 = (void *)objc_msgSend( (id)objc_msgSend( a1,  "__supportedScriptDefaultsFromScriptName:",  objc_msgSend(a1, "__scriptIdentifierFromIndex:", a4)),  "objectForKeyedSubscript:",  @"shortStyleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForShortStyle:", a3);
  if (v7) {
    LOBYTE(v7) = [v6 objectForKeyedSubscript:v7] != 0;
  }
  return v7;
}

+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForLocalization:(id)a4
{
  int64_t v6 = (void *)objc_msgSend( (id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a4),  "objectForKeyedSubscript:",  @"shortStyleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForShortStyle:", a3);
  return v6 && [v6 objectForKeyedSubscript:v7] != 0;
}

+ (SEL)__initialsCreatorForScript:(unint64_t)a3
{
  uint64_t v3 = (NSString *)objc_msgSend( (id)objc_msgSend( a1,  "__supportedScriptDefaultsFromScriptName:",  objc_msgSend(a1, "__scriptIdentifierFromIndex:", a3)),  "objectForKeyedSubscript:",  @"initialsCreator");
  if (v3) {
    return NSSelectorFromString(v3);
  }
  else {
    return sel_westernInitialsCreator;
  }
}

+ (id)__stringValueForStyle:(int64_t)a3
{
  else {
    return off_189CA5FB0[a3];
  }
}

+ (id)__stringValueForShortStyle:(int64_t)a3
{
  else {
    return off_189CA5FD8[a3];
  }
}

@end