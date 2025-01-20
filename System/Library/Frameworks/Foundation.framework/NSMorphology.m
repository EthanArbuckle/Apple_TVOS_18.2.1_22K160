@interface NSMorphology
+ (BOOL)supportsSecureCoding;
+ (NSMorphology)userMorphology;
+ (id)_heuristicMorphologyForLanguage:(id)a3 prefix:(id)a4 suffix:(id)a5 featureName:(id *)a6 matchedPrefix:(BOOL *)a7 matchedSuffix:(BOOL *)a8;
+ (id)_userInflection;
+ (uint64_t)_userMorphologyWithOverrides;
+ (void)_clearCachedUserMorphology;
+ (void)_getUserMorphology:(id *)a3 userInflection:(id *)a4;
- (BOOL)addConstraintsTo:(MDInflectableStringConcept *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnspecified;
- (BOOL)setCustomPronoun:(NSMorphologyCustomPronoun *)features forLanguage:(NSString *)language error:(NSError *)error;
- (NSData)_externalRepresentation;
- (NSDictionary)_customPronouns;
- (NSDictionary)_externalRepresentationDictionary;
- (NSGrammaticalCase)grammaticalCase;
- (NSGrammaticalDefiniteness)definiteness;
- (NSGrammaticalDetermination)determination;
- (NSGrammaticalGender)grammaticalGender;
- (NSGrammaticalNumber)number;
- (NSGrammaticalPartOfSpeech)partOfSpeech;
- (NSGrammaticalPerson)grammaticalPerson;
- (NSGrammaticalPronounType)pronounType;
- (NSMorphology)initWithCoder:(id)a3;
- (NSMorphology)initWithInflection:(id)a3;
- (NSMorphology)initWithMorphunAttributeValues:(id)a3;
- (NSMorphologyCustomPronoun)customPronounForLanguage:(NSString *)language;
- (id)_initWithExternalRepresentation:(id)a3 error:(id *)a4;
- (id)_initWithExternalRepresentationDictionary:(id)a3;
- (id)_morphunConstraints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_adjectival;
- (int64_t)_clusivity;
- (uint64_t)mergeMorphology:(char)a3 override:;
- (unint64_t)hash;
- (void)_overrideUserInflectionInBlock:(void *)a1;
- (void)_setCustomPronouns:(id)a3;
- (void)applyPluralityRulesForNumbers:(id)a3 inLanguages:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)isIdentity;
- (void)setDefiniteness:(NSGrammaticalDefiniteness)definiteness;
- (void)setDetermination:(NSGrammaticalDetermination)determination;
- (void)setGrammaticalCase:(NSGrammaticalCase)grammaticalCase;
- (void)setGrammaticalGender:(NSGrammaticalGender)grammaticalGender;
- (void)setGrammaticalPerson:(NSGrammaticalPerson)grammaticalPerson;
- (void)setNumber:(NSGrammaticalNumber)number;
- (void)setPartOfSpeech:(NSGrammaticalPartOfSpeech)partOfSpeech;
- (void)setPronounType:(NSGrammaticalPronounType)pronounType;
- (void)set_adjectival:(int64_t)a3;
- (void)set_clusivity:(int64_t)a3;
@end

@implementation NSMorphology

+ (id)_heuristicMorphologyForLanguage:(id)a3 prefix:(id)a4 suffix:(id)a5 featureName:(id *)a6 matchedPrefix:(BOOL *)a7 matchedSuffix:(BOOL *)a8
{
  id v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = v14;
  id v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  id v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = specialized static NSMorphology._heuristicMorphology(language:prefix:suffix:featureNamePointer:matchedPrefixPointer:matchedSuffixPointer:)( (uint64_t)v13,  v15,  (uint64_t)v16,  v18,  (uint64_t)v19,  v20,  a6,  a7,  (char *)a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v21;
}

- (id)_morphunConstraints
{
  return @objc NSMorphology.morphunConstraints()(self, (uint64_t)a2, (void (*)(void))NSMorphology.morphunConstraints());
}

- (uint64_t)mergeMorphology:(char)a3 override:
{
  if (result)
  {
    v5 = (void *)result;
    if ([a2 grammaticalGender])
    {
      if ((a3 & 1) == 0 && [v5 grammaticalGender])
      {
        if (![a2 partOfSpeech])
        {
LABEL_12:
          if ([a2 number])
          {
            if ((a3 & 1) == 0 && [v5 number])
            {
              if (![a2 grammaticalCase])
              {
LABEL_22:
                if ([a2 determination])
                {
                  if ((a3 & 1) == 0 && [v5 determination])
                  {
                    if (![a2 grammaticalPerson])
                    {
LABEL_32:
                      if ([a2 pronounType])
                      {
                        if ((a3 & 1) == 0 && [v5 pronounType])
                        {
                          if (![a2 definiteness])
                          {
LABEL_42:
                            if ([a2 _adjectival])
                            {
                              if ((a3 & 1) == 0 && [v5 _adjectival])
                              {
                                result = [a2 _clusivity];
                                if (!result) {
                                  return result;
                                }
LABEL_50:
                                result = [v5 _clusivity];
                                if (result) {
                                  return result;
                                }
                                return objc_msgSend(v5, "set_clusivity:", objc_msgSend(a2, "_clusivity"));
                              }

                              objc_msgSend(v5, "set_adjectival:", objc_msgSend(a2, "_adjectival"));
                            }

                            result = [a2 _clusivity];
                            if (!result) {
                              return result;
                            }
                            if ((a3 & 1) != 0) {
                              return objc_msgSend(v5, "set_clusivity:", objc_msgSend(a2, "_clusivity"));
                            }
                            goto LABEL_50;
                          }

                          goto LABEL_40;
                        }

                        objc_msgSend(v5, "setPronounType:", objc_msgSend(a2, "pronounType"));
                      }

                      if (![a2 definiteness]) {
                        goto LABEL_42;
                      }
                      if ((a3 & 1) != 0)
                      {
LABEL_41:
                        objc_msgSend(v5, "setDefiniteness:", objc_msgSend(a2, "definiteness"));
                        goto LABEL_42;
                      }

- (void)isIdentity
{
  if (result)
  {
    v1 = result;
    if ([result grammaticalGender]
      || [v1 grammaticalCase]
      || [v1 partOfSpeech]
      || [v1 definiteness]
      || [v1 number]
      || [v1 determination]
      || [v1 grammaticalPerson]
      || [v1 pronounType]
      || [v1 _clusivity])
    {
      return 0LL;
    }

    else
    {
      return (void *)([v1 _adjectival] == 0);
    }
  }

  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMorphology;
  -[NSMorphology dealloc](&v3, sel_dealloc);
}

- (NSDictionary)_customPronouns
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_customPronouns, "copy");
}

- (void)_setCustomPronouns:(id)a3
{
  customPronouns = self->_customPronouns;
  if (customPronouns != a3)
  {

    self->_customPronouns = (NSMutableDictionary *)[a3 copy];
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  v4[4] = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  v4[7] = -[NSMorphology grammaticalCase](self, "grammaticalCase");
  v4[5] = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  v4[11] = -[NSMorphology definiteness](self, "definiteness");
  v4[6] = -[NSMorphology number](self, "number");
  v4[8] = -[NSMorphology determination](self, "determination");
  v4[9] = -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  v4[10] = -[NSMorphology pronounType](self, "pronounType");
  v4[2] = -[NSMorphology _adjectival](self, "_adjectival");
  v4[3] = -[NSMorphology _clusivity](self, "_clusivity");
  v4[1] = -[NSMutableDictionary mutableCopy](self->_customPronouns, "mutableCopy");
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  NSGrammaticalGender v4 = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  uint64_t v5 = v4 ^ -[NSMorphology grammaticalCase](self, "grammaticalCase") ^ v3;
  NSGrammaticalPartOfSpeech v6 = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  uint64_t v7 = v6 ^ -[NSMorphology definiteness](self, "definiteness");
  uint64_t v8 = v5 ^ v7 ^ -[NSMorphology number](self, "number");
  NSGrammaticalDetermination v9 = -[NSMorphology determination](self, "determination");
  uint64_t v10 = v9 ^ -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  uint64_t v11 = v10 ^ -[NSMorphology pronounType](self, "pronounType");
  int64_t v12 = v8 ^ v11 ^ -[NSMorphology _adjectival](self, "_adjectival");
  int64_t v13 = v12 ^ -[NSMorphology _clusivity](self, "_clusivity");
  return v13 ^ -[NSMutableDictionary hash](self->_customPronouns, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSGrammaticalGender v5 = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  if (v5 != [a3 grammaticalGender]) {
    return 0;
  }
  NSGrammaticalCase v6 = -[NSMorphology grammaticalCase](self, "grammaticalCase");
  if (v6 != [a3 grammaticalCase]) {
    return 0;
  }
  NSGrammaticalPartOfSpeech v7 = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  if (v7 != [a3 partOfSpeech]) {
    return 0;
  }
  NSGrammaticalDefiniteness v8 = -[NSMorphology definiteness](self, "definiteness");
  if (v8 != [a3 definiteness]) {
    return 0;
  }
  NSGrammaticalNumber v9 = -[NSMorphology number](self, "number");
  if (v9 != [a3 number]) {
    return 0;
  }
  NSGrammaticalDetermination v10 = -[NSMorphology determination](self, "determination");
  if (v10 != [a3 determination]) {
    return 0;
  }
  NSGrammaticalPerson v11 = -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  if (v11 != [a3 grammaticalPerson]) {
    return 0;
  }
  NSGrammaticalPronounType v12 = -[NSMorphology pronounType](self, "pronounType");
  if (v12 != [a3 pronounType]) {
    return 0;
  }
  int64_t v13 = -[NSMorphology _adjectival](self, "_adjectival");
  if (v13 != [a3 _adjectival]) {
    return 0;
  }
  int64_t v14 = -[NSMorphology _clusivity](self, "_clusivity");
  if (v14 != [a3 _clusivity]) {
    return 0;
  }
  if (-[NSMutableDictionary count](self->_customPronouns, "count") || [*((id *)a3 + 1) count]) {
    return -[NSMutableDictionary isEqual:](self->_customPronouns, "isEqual:", *((void *)a3 + 1));
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  customPronouns = self->_customPronouns;
  if (customPronouns)
  {
    if (-[NSMutableDictionary count](customPronouns, "count")) {
      [a3 encodeObject:self->_customPronouns forKey:@"customPronouns"];
    }
  }

- (NSMorphology)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSMorphology;
  NSGrammaticalGender v4 = -[NSMorphology init](&v15, sel_init);
  if (v4)
  {
    v4->_grammaticalGender = [a3 decodeIntegerForKey:@"grammaticalGender"];
    v4->_grammaticalCase = [a3 decodeIntegerForKey:@"grammaticalCase"];
    v4->_partOfSpeech = [a3 decodeIntegerForKey:@"partOfSpeech"];
    v4->_definiteness = [a3 decodeIntegerForKey:@"definiteness"];
    v4->_number = [a3 decodeIntegerForKey:@"number"];
    v4->_determination = [a3 decodeIntegerForKey:@"determination"];
    v4->_grammaticalPerson = [a3 decodeIntegerForKey:@"grammaticalPerson"];
    v4->_pronounType = [a3 decodeIntegerForKey:@"pronounType"];
    NSGrammaticalGender v5 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    NSGrammaticalDefiniteness v8 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0),  @"customPronouns");
    if (v8)
    {
      if (!_NSIsNSDictionary())
      {
LABEL_14:
        objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  0));

        return 0LL;
      }

      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
LABEL_6:
        uint64_t v12 = 0LL;
        while (1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          [v8 objectForKeyedSubscript:v13];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_14;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
            if (v10) {
              goto LABEL_6;
            }
            break;
          }
        }
      }
    }

    v4->_customPronouns = (NSMutableDictionary *)[v8 mutableCopy];
  }

  return v4;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSMorphology;
  id v3 = -[NSMorphology description](&v21, sel_description);
  NSGrammaticalGender v4 = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  if ((unint64_t)v4 >= 4) {
    NSGrammaticalGender v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalGender)(%lld)",  v4);
  }
  else {
    NSGrammaticalGender v5 = (NSString *)off_189C99638[v4];
  }
  NSGrammaticalNumber v6 = -[NSMorphology number](self, "number");
  if ((unint64_t)v6 >= (NSGrammaticalNumberPluralMany|NSGrammaticalNumberSingular)) {
    uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalNumber)(%lld)",  v6);
  }
  else {
    uint64_t v7 = (NSString *)off_189C99658[v6];
  }
  NSGrammaticalPartOfSpeech v8 = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  if ((unint64_t)v8 >= (NSGrammaticalPartOfSpeechAbbreviation|NSGrammaticalPartOfSpeechDeterminer)) {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalPartOfSpeech)(%lld)",  v8);
  }
  else {
    uint64_t v9 = (NSString *)off_189C99690[v8];
  }
  NSGrammaticalCase v10 = -[NSMorphology grammaticalCase](self, "grammaticalCase");
  if ((unint64_t)v10 >= (NSGrammaticalCaseTranslative|NSGrammaticalCaseNominative)) {
    uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalCase)(%lld)",  v10);
  }
  else {
    uint64_t v11 = (NSString *)off_189C99708[v10];
  }
  NSGrammaticalDefiniteness v12 = -[NSMorphology definiteness](self, "definiteness");
  if ((unint64_t)v12 >= (NSGrammaticalDefinitenessDefinite|NSGrammaticalDefinitenessIndefinite)) {
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalDefiniteness)(%lld)",  v12);
  }
  else {
    uint64_t v13 = (NSString *)off_189C99780[v12];
  }
  NSGrammaticalDetermination v14 = -[NSMorphology determination](self, "determination");
  if ((unint64_t)v14 >= (NSGrammaticalDeterminationDependent|NSGrammaticalDeterminationIndependent)) {
    objc_super v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalDetermination)(%lld)",  v14);
  }
  else {
    objc_super v15 = (NSString *)off_189C99798[v14];
  }
  NSGrammaticalPerson v16 = -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  if ((unint64_t)v16 >= 4) {
    __int128 v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalPerson)(%lld)",  v16);
  }
  else {
    __int128 v17 = (NSString *)off_189C997B0[v16];
  }
  NSGrammaticalPronounType v18 = -[NSMorphology pronounType](self, "pronounType");
  if ((unint64_t)v18 >= 4) {
    __int128 v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(NSGrammaticalPronounType)(%lld)",  v18);
  }
  else {
    __int128 v19 = (NSString *)off_189C997D0[v18];
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ { grammaticalGender = %@, number = %@, partOfSpeech = %@, case = %@, definiteness = %@, determination = %@, grammaticalPerson = %@, pronounType = %@, customPronouns = %@ }",  v3,  v5,  v7,  v9,  v11,  v13,  v15,  v17,  v19,  self->_customPronouns);
}

- (NSGrammaticalGender)grammaticalGender
{
  return self->_grammaticalGender;
}

- (void)setGrammaticalGender:(NSGrammaticalGender)grammaticalGender
{
  self->_grammaticalGender = grammaticalGender;
}

- (NSGrammaticalPartOfSpeech)partOfSpeech
{
  return self->_partOfSpeech;
}

- (void)setPartOfSpeech:(NSGrammaticalPartOfSpeech)partOfSpeech
{
  self->_partOfSpeech = partOfSpeech;
}

- (NSGrammaticalNumber)number
{
  return self->_number;
}

- (void)setNumber:(NSGrammaticalNumber)number
{
  self->_number = number;
}

- (NSGrammaticalCase)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(NSGrammaticalCase)grammaticalCase
{
  self->_grammaticalCase = grammaticalCase;
}

- (NSGrammaticalDetermination)determination
{
  return self->_determination;
}

- (void)setDetermination:(NSGrammaticalDetermination)determination
{
  self->_determination = determination;
}

- (NSGrammaticalPerson)grammaticalPerson
{
  return self->_grammaticalPerson;
}

- (void)setGrammaticalPerson:(NSGrammaticalPerson)grammaticalPerson
{
  self->_grammaticalPerson = grammaticalPerson;
}

- (NSGrammaticalPronounType)pronounType
{
  return self->_pronounType;
}

- (void)setPronounType:(NSGrammaticalPronounType)pronounType
{
  self->_pronounType = pronounType;
}

- (NSGrammaticalDefiniteness)definiteness
{
  return self->_definiteness;
}

- (void)setDefiniteness:(NSGrammaticalDefiniteness)definiteness
{
  self->_definiteness = definiteness;
}

- (NSMorphologyCustomPronoun)customPronounForLanguage:(NSString *)language
{
  return (NSMorphologyCustomPronoun *)(id)objc_msgSend( (id)-[NSMutableDictionary objectForKeyedSubscript:]( self->_customPronouns,  "objectForKeyedSubscript:",  -[NSString lowercaseString]( language,  "lowercaseString")),  "copy");
}

- (BOOL)setCustomPronoun:(NSMorphologyCustomPronoun *)features forLanguage:(NSString *)language error:(NSError *)error
{
  v11[5] = *MEMORY[0x1895F89C0];
  if (!features
    || (v11[0] = MEMORY[0x1895F87A8],
        v11[1] = 3221225472LL,
        v11[2] = __69__NSMorphology_NSCustomPronouns__setCustomPronoun_forLanguage_error___block_invoke,
        v11[3] = &unk_189C995B8,
        v11[4] = features,
        BOOL v8 = +[NSMorphologyCustomPronoun _validateCustomPronounWithAccessor:forLanguage:error:]( &OBJC_CLASS___NSMorphologyCustomPronoun,  "_validateCustomPronounWithAccessor:forLanguage:error:",  v11,  language,  error)))
  {
    if (!self->_customPronouns) {
      self->_customPronouns = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    }
    uint64_t v9 = (void *)-[NSMorphologyCustomPronoun copy](features, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_customPronouns,  "setObject:forKeyedSubscript:",  v9,  -[NSString lowercaseString](language, "lowercaseString"));

    LOBYTE(v8) = 1;
  }

  return v8;
}

uint64_t __69__NSMorphology_NSCustomPronouns__setCustomPronoun_forLanguage_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) valueForKey:a2];
}

+ (void)_clearCachedUserMorphology
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_90);

  qword_18C496548 = 0LL;
  qword_18C496550 = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_90);
  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  v2 = (os_log_s *)_NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_182EB1000, v2, OS_LOG_TYPE_INFO, "User morphology was cleared.", v3, 2u);
  }

+ (void)_getUserMorphology:(id *)a3 userInflection:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (qword_18C496558 != -1) {
    dispatch_once(&qword_18C496558, &__block_literal_global_2);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_90);
  if (!qword_18C496548)
  {
    if (+[_NSAttributedStringGrammarInflection _isSimulatingLockedDevice]( &OBJC_CLASS____NSAttributedStringGrammarInflection,  "_isSimulatingLockedDevice"))
    {
LABEL_30:

      if (qword_18C496548)
      {
        NSGrammaticalPerson v16 = objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection);
        uint64_t v17 = -[_NSAttributedStringGrammarInflection initWithMorphology:](v16, "initWithMorphology:", qword_18C496548);
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      qword_18C496550 = v17;
      goto LABEL_34;
    }

    CFPropertyListRef v6 = (CFPropertyListRef)objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "dictionaryForKey:",  @"AppleUserMorphology");
    if (v6)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v7 = (os_log_s *)_NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = (uint64_t)v6;
        __int16 v21 = 2082;
        uint64_t v22 = "true";
        _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_INFO,  "User morphology preferences value read from the standard user defaults: %@ (is present? %{public}s)",  buf,  0x16u);
      }
    }

    getpid();
    NSGrammaticalPronounType v18 = -[NSString UTF8String]( +[_NSAttributedStringGrammarInflection _protectedPreferencesDomain]( &OBJC_CLASS____NSAttributedStringGrammarInflection,  "_protectedPreferencesDomain"),  "UTF8String");
    int v8 = sandbox_check();
    BOOL v9 = +[_NSAttributedStringGrammarInflection _isSimulatingThirdPartyProcess]( &OBJC_CLASS____NSAttributedStringGrammarInflection,  "_isSimulatingThirdPartyProcess",  v18);
    if (v6 || v9)
    {
      if (!v6) {
        goto LABEL_20;
      }
    }

    else
    {
      if (v8) {
        goto LABEL_20;
      }
      NSGrammaticalCase v10 = +[_NSAttributedStringGrammarInflection _protectedPreferencesDomain]( &OBJC_CLASS____NSAttributedStringGrammarInflection,  "_protectedPreferencesDomain");
      CFPropertyListRef v11 = (id)CFPreferencesCopyValue( @"AppleUserMorphology",  (CFStringRef)v10,  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
      if (!v11) {
        goto LABEL_20;
      }
      CFPropertyListRef v6 = v11;
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      NSGrammaticalDefiniteness v12 = (os_log_s *)_NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = (uint64_t)v6;
        __int16 v21 = 2082;
        uint64_t v22 = "true";
        _os_log_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_INFO,  "User morphology preferences value read from the protected domain: %@ (is present? %{public}s)",  buf,  0x16u);
      }
    }

    if ((_NSIsNSDictionary() & 1) != 0)
    {
LABEL_25:
      if (_NSIsNSDictionary())
      {
        qword_18C496548 = -[NSMorphology _initWithExternalRepresentationDictionary:]( objc_alloc(&OBJC_CLASS___NSMorphology),  "_initWithExternalRepresentationDictionary:",  v6);
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        objc_super v15 = (os_log_s *)_NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = qword_18C496548;
          _os_log_impl(&dword_182EB1000, v15, OS_LOG_TYPE_INFO, "User morphology produced: %@", buf, 0xCu);
        }
      }

      goto LABEL_30;
    }

uint64_t __84__NSMorphology_NSMorphologyUserSettingsInternal___getUserMorphology_userInflection___block_invoke()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  return notify_register_dispatch( "com.apple.mobile.keybagd.lock_status",  (int *)&_getUserMorphology_userInflection__keybagToken,  global_queue,  &__block_literal_global_178);
}

uint64_t __84__NSMorphology_NSMorphologyUserSettingsInternal___getUserMorphology_userInflection___block_invoke_2()
{
  return +[NSMorphology _clearCachedUserMorphology](&OBJC_CLASS___NSMorphology, "_clearCachedUserMorphology");
}

+ (id)_userInflection
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = 0LL;
  [a1 _getUserMorphology:0 userInflection:v3];
  id result = (id)v3[0];
  if (!v3[0]) {
    return objc_alloc_init(&OBJC_CLASS____NSAttributedStringGrammarInflection);
  }
  return result;
}

+ (uint64_t)_userMorphologyWithOverrides
{
  return 0LL;
}

- (void)_overrideUserInflectionInBlock:(void *)a1
{
  if (a1)
  {
    id v5 = (id)_NSMorphologyUserInflectionTemporaryOverride;
    id v4 = a1;
    _NSMorphologyUserInflectionTemporaryOverride = (uint64_t)v4;
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    _NSMorphologyUserInflectionTemporaryOverride = (uint64_t)v5;
  }

- (BOOL)isUnspecified
{
  if (-[NSMorphology grammaticalGender](self, "grammaticalGender")
    || -[NSMorphology number](self, "number")
    || -[NSMorphology partOfSpeech](self, "partOfSpeech"))
  {
    return 0;
  }

  customPronouns = self->_customPronouns;
  return !customPronouns || -[NSMutableDictionary count](customPronouns, "count") == 0;
}

+ (NSMorphology)userMorphology
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = 0LL;
  [a1 _getUserMorphology:v3 userInflection:0];
  id result = (NSMorphology *)v3[0];
  if (!v3[0]) {
    return objc_alloc_init(&OBJC_CLASS___NSMorphology);
  }
  return result;
}

- (id)_initWithExternalRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NSMorphology;
  CFPropertyListRef v6 = -[NSMorphology init](&v27, sel_init);
  if (!v6) {
    return v6;
  }
  id v7 = +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  a4);
  if (!v7)
  {
LABEL_40:

    return 0LL;
  }

  int v8 = v7;
  if ((_NSIsNSDictionary() & 1) == 0
    || (_NSGrammaticalGenderGetFromExternalRepresentation( (void *)[v8 objectForKeyedSubscript:@"grammaticalGender"],  &v6->_grammaticalGender) & 1) == 0 || (_NSGrammaticalNumberGetFromExternalRepresentation( (void *)objc_msgSend(v8, "objectForKeyedSubscript:", @"number"),  &v6->_number) & 1) == 0 || (_NSGrammaticalPartOfSpeechGetFromExternalRepresentation( (void *)objc_msgSend(v8, "objectForKeyedSubscript:", @"partOfSpeech"),  &v6->_partOfSpeech) & 1) == 0 || (_NSGrammaticalCaseGetFromExternalRepresentation( (void *)objc_msgSend(v8, "objectForKeyedSubscript:", @"grammaticalCase"),  &v6->_grammaticalCase) & 1) == 0 || (_NSGrammaticalPronounTypeGetFromExternalRepresentation( (void *)objc_msgSend(v8, "objectForKeyedSubscript:", @"pronounType"),  &v6->_pronounType) & 1) == 0)
  {
    goto LABEL_38;
  }

  BOOL v9 = (void *)[v8 objectForKeyedSubscript:@"determination"];
  if (v9)
  {
    NSGrammaticalCase v10 = v9;
    if ([v9 isEqual:@"independent"])
    {
      uint64_t v11 = 1LL;
    }

    else
    {
      if (([v10 isEqual:@"dependent"] & 1) == 0) {
        goto LABEL_38;
      }
      uint64_t v11 = 2LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  v6->_determination = v11;
  NSGrammaticalDefiniteness v12 = (void *)[v8 objectForKeyedSubscript:@"definiteness"];
  if (v12)
  {
    uint64_t v13 = v12;
    if ([v12 isEqual:@"indefinite"])
    {
      uint64_t v14 = 1LL;
    }

    else
    {
      if (([v13 isEqual:@"definite"] & 1) == 0) {
        goto LABEL_38;
      }
      uint64_t v14 = 2LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  v6->_definiteness = v14;
  uint64_t v15 = [v8 objectForKeyedSubscript:@"customPronouns"];
  if (!v15) {
    return v6;
  }
  NSGrammaticalPerson v16 = (void *)v15;
  if ((_NSIsNSDictionary() & 1) == 0)
  {
LABEL_38:
    if (a4) {
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840LL,  0LL);
    }
    goto LABEL_40;
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
LABEL_25:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * v20);
      uint64_t v22 = [v16 objectForKey:v21];
      if (+[NSMorphologyCustomPronoun isSupportedForLanguage:]( &OBJC_CLASS___NSMorphologyCustomPronoun,  "isSupportedForLanguage:",  v21))
      {
        id v23 = -[NSMorphologyCustomPronoun _initWithExternalRepresentationDictionary:]( objc_alloc(&OBJC_CLASS___NSMorphologyCustomPronoun),  "_initWithExternalRepresentationDictionary:",  v22);
        if (!v23) {
          goto LABEL_38;
        }
        v24 = v23;
        customPronouns = v6->_customPronouns;
        if (!customPronouns)
        {
          customPronouns = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
          v6->_customPronouns = customPronouns;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](customPronouns, "setObject:forKeyedSubscript:", v24, v21);
      }

      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v18) {
          goto LABEL_25;
        }
        return v6;
      }
    }
  }

  return v6;
}

- (id)_initWithExternalRepresentationDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NSMorphology;
  id v4 = -[NSMorphology init](&v23, sel_init);
  if (!v4) {
    return v4;
  }
  if (!_NSGrammaticalGenderGetFromExternalRepresentation( (void *)[a3 objectForKeyedSubscript:@"grammaticalGender"],  &v4->_grammaticalGender)
    || !_NSGrammaticalNumberGetFromExternalRepresentation( (void *)[a3 objectForKeyedSubscript:@"number"],  &v4->_number)
    || !_NSGrammaticalPartOfSpeechGetFromExternalRepresentation( (void *)[a3 objectForKeyedSubscript:@"partOfSpeech"],  &v4->_partOfSpeech)
    || !_NSGrammaticalCaseGetFromExternalRepresentation( (void *)[a3 objectForKeyedSubscript:@"grammaticalCase"],  &v4->_grammaticalCase)
    || !_NSGrammaticalPronounTypeGetFromExternalRepresentation( (void *)[a3 objectForKeyedSubscript:@"pronounType"],  &v4->_pronounType))
  {
    goto LABEL_36;
  }

  id v5 = (void *)[a3 objectForKeyedSubscript:@"determination"];
  if (v5)
  {
    CFPropertyListRef v6 = v5;
    if ([v5 isEqual:@"independent"])
    {
      uint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v7 = 2LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  v4->_determination = v7;
  int v8 = (void *)[a3 objectForKeyedSubscript:@"definiteness"];
  if (v8)
  {
    BOOL v9 = v8;
    if ([v8 isEqual:@"indefinite"])
    {
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v10 = 2LL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  v4->_definiteness = v10;
  uint64_t v11 = [a3 objectForKeyedSubscript:@"customPronouns"];
  if (!v11) {
    return v4;
  }
  NSGrammaticalDefiniteness v12 = (void *)v11;
  if (!_NSIsNSDictionary())
  {
LABEL_36:

    return 0LL;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
LABEL_23:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * v16);
      uint64_t v18 = [v12 objectForKey:v17];
      if (+[NSMorphologyCustomPronoun isSupportedForLanguage:]( &OBJC_CLASS___NSMorphologyCustomPronoun,  "isSupportedForLanguage:",  v17))
      {
        id v19 = -[NSMorphologyCustomPronoun _initWithExternalRepresentationDictionary:]( objc_alloc(&OBJC_CLASS___NSMorphologyCustomPronoun),  "_initWithExternalRepresentationDictionary:",  v18);
        if (!v19) {
          goto LABEL_36;
        }
        uint64_t v20 = v19;
        customPronouns = v4->_customPronouns;
        if (!customPronouns)
        {
          customPronouns = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
          v4->_customPronouns = customPronouns;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](customPronouns, "setObject:forKeyedSubscript:", v20, v17);
      }

      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v14) {
          goto LABEL_23;
        }
        return v4;
      }
    }
  }

  return v4;
}

- (NSDictionary)_externalRepresentationDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (-[NSMorphology grammaticalGender](self, "grammaticalGender"))
  {
    unint64_t v4 = -[NSMorphology grammaticalGender](self, "grammaticalGender") - 1;
    if (v4 > 2) {
      id v5 = 0LL;
    }
    else {
      id v5 = off_189C997F0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"grammaticalGender"];
  }

  if (-[NSMorphology number](self, "number"))
  {
    unint64_t v6 = -[NSMorphology number](self, "number") - 1;
    if (v6 > 5) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = off_189C99808[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"number"];
  }

  if (-[NSMorphology partOfSpeech](self, "partOfSpeech"))
  {
    unint64_t v8 = -[NSMorphology partOfSpeech](self, "partOfSpeech") - 1;
    if (v8 > 0xD) {
      BOOL v9 = 0LL;
    }
    else {
      BOOL v9 = off_189C99838[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"partOfSpeech"];
  }

  return (NSDictionary *)v3;
}

- (NSData)_externalRepresentation
{
  return +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  -[NSMorphology _externalRepresentationDictionary](self, "_externalRepresentationDictionary"),  0LL,  0LL);
}

- (NSMorphology)initWithInflection:(id)a3
{
  unint64_t v4 = -[NSMorphology init](self, "init");
  if (v4)
  {
    unint64_t v5 = [a3 gender];
    if (v5 <= 3) {
      -[NSMorphology setGrammaticalGender:](v4, "setGrammaticalGender:", qword_183850428[v5]);
    }
    unint64_t v6 = [a3 number];
    if (v6 <= 6) {
      -[NSMorphology setNumber:](v4, "setNumber:", qword_183850448[v6]);
    }
    uint64_t v7 = [a3 englishCustomPronoun];
    if (v7) {
      -[NSMorphology setCustomPronoun:forLanguage:error:]( v4,  "setCustomPronoun:forLanguage:error:",  v7,  @"en",  0LL);
    }
  }

  return v4;
}

- (int64_t)_clusivity
{
  return self->_clusivity;
}

- (void)set_clusivity:(int64_t)a3
{
  self->_clusivity = a3;
}

- (int64_t)_adjectival
{
  return self->_adjectival;
}

- (void)set_adjectival:(int64_t)a3
{
  self->_adjectival = a3;
}

- (void)applyPluralityRulesForNumbers:(id)a3 inLanguages:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (-[NSMorphology number](self, "number") == NSGrammaticalNumberPlural) {
    return;
  }
  uint64_t v7 = [a3 count];
  if (v7 < 1) {
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0LL;
  for (uint64_t i = 0LL; i != v8; ++i)
  {
    uint64_t v11 = (const __CFNumber *)[a3 objectAtIndexedSubscript:i];
    NSGrammaticalDefiniteness v12 = (void *)[a4 objectAtIndexedSubscript:i];
    uint64_t valuePtr = -1LL;
    if (CFNumberGetValue(v11, kCFNumberCFIndexType, &valuePtr))
    {
      if (v9) {
        continue;
      }
    }

    else
    {
      uint64_t valuePtr = -1LL;
      if (v9) {
        continue;
      }
    }

    memset(v18, 0, 157);
    if ((objc_msgSend( v12,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  v18,  157,  0,  4,  0,  0,  objc_msgSend(v12, "length"),  0) & 1) == 0) {
      strcpy(v18, "en");
    }
    uplrules_open();
    memset(v17, 0, 314);
    -[__CFNumber doubleValue](v11, "doubleValue");
    int v13 = uplrules_select();
    uplrules_close();
    uint64_t v9 = 0LL;
    if (v13 >= 1)
    {
      uint64_t v14 = -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharactersNoCopy:length:freeWhenDone:",  v17,  v13,  0LL);
      if (-[NSString isEqual:](v14, "isEqual:", @"one"))
      {
        uint64_t v9 = 1LL;
LABEL_18:

        continue;
      }

      if (-[NSString isEqual:](v14, "isEqual:", @"two"))
      {
        uint64_t v9 = 4LL;
        goto LABEL_18;
      }

      BOOL v15 = -[NSString isEqual:](v14, "isEqual:", @"other");

      if (v15) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 0LL;
      }
    }
  }

  if (!v9) {
LABEL_23:
  }
    uint64_t v9 = 3LL;
  if (-[NSMorphology number](self, "number"))
  {
    if (-[NSMorphology number](self, "number") != v9)
    {
      uint64_t v9 = 3LL;
      goto LABEL_27;
    }
  }

  else
  {
LABEL_27:
    -[NSMorphology setNumber:](self, "setNumber:", v9);
  }

- (NSMorphology)initWithMorphunAttributeValues:(id)a3
{
  v24[24] = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSMorphology;
  unint64_t v4 = -[NSMorphology init](&v13, sel_init);
  if (v4)
  {
    v23[0] = @"abbreviation";
    v23[1] = @"adjective";
    v24[0] = &unk_189D1F040;
    v24[1] = &unk_189D1F068;
    v23[2] = @"adverb";
    v23[3] = @"conjunction";
    v24[2] = &unk_189D1F090;
    v24[3] = &unk_189D1F0B8;
    v23[4] = @"interjection";
    v23[5] = @"letter";
    v24[4] = &unk_189D1F0E0;
    v24[5] = &unk_189D1F108;
    v24[6] = &unk_189D1F130;
    v23[6] = @"noun";
    v23[7] = @"proper-noun";
    v21[0] = @"f";
    v21[1] = @"v";
    v22[0] = &off_189D0DB50;
    v22[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 15LL);
    v24[7] = [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v24[8] = &unk_189D1F158;
    v23[8] = @"number";
    v23[9] = @"particle";
    v24[9] = &unk_189D1F180;
    v24[10] = &unk_189D1F1A8;
    v23[10] = @"pronoun";
    v23[11] = @"verb";
    v24[11] = &unk_189D1F1D0;
    v24[12] = &unk_189D1F1F8;
    v23[12] = @"feminine";
    v23[13] = @"masculine";
    v24[13] = &unk_189D1F220;
    v24[14] = &unk_189D1F248;
    v23[14] = @"neuter";
    v23[15] = @"common";
    v19[1] = @"v";
    v20[0] = &off_189D0DC70;
    v19[0] = @"f";
    v20[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 4LL);
    v24[15] = [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v24[16] = &unk_189D1F270;
    v23[16] = @"singular";
    v23[17] = @"plural";
    v24[17] = &unk_189D1F298;
    v24[18] = &unk_189D1F2C0;
    v23[18] = @"accusative";
    v23[19] = @"dative";
    v24[19] = &unk_189D1F2E8;
    v24[20] = &unk_189D1F310;
    v23[20] = @"genitive";
    v23[21] = @"locative";
    v24[21] = &unk_189D1F338;
    v24[22] = &unk_189D1F360;
    v23[22] = @"nominative";
    v23[23] = @"prepositional";
    v24[23] = &unk_189D1F388;
    unint64_t v5 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:24];
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = (void *)[v5 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v9)];
          if (v10)
          {
            uint64_t v11 = v10;
            switch(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"f"), "unsignedIntegerValue"))
            {
              case 0LL:
                -[NSMorphology setPartOfSpeech:]( v4,  "setPartOfSpeech:",  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"v"), "unsignedIntegerValue"));
                break;
              case 1LL:
                -[NSMorphology setGrammaticalGender:]( v4,  "setGrammaticalGender:",  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"v"), "unsignedIntegerValue"));
                break;
              case 2LL:
                -[NSMorphology setNumber:]( v4,  "setNumber:",  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"v"), "unsignedIntegerValue"));
                break;
              case 4LL:
                -[NSMorphology setGrammaticalCase:]( v4,  "setGrammaticalCase:",  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"v"), "unsignedIntegerValue"));
                break;
              default:
                break;
            }
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }

      while (v7);
    }
  }

  return v4;
}

- (BOOL)addConstraintsTo:(MDInflectableStringConcept *)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = -[NSMorphology _morphunConstraints](self, "_morphunConstraints");
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    int v8 = 0;
    uint64_t v9 = *(void *)v25;
    *(void *)&__int128 v6 = 138543874LL;
    __int128 v15 = v6;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        NSGrammaticalDefiniteness v12 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", v11, v15);
        CFTypeRef cf = 0LL;
        _MergedGlobals_109(a3, v11, v12, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          objc_super v13 = (os_log_s *)_NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            uint64_t v18 = v11;
            __int16 v19 = 2114;
            uint64_t v20 = v12;
            __int16 v21 = 2114;
            CFTypeRef v22 = cf;
            _os_log_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_INFO,  "Unable to set constraint %{public}@=%{public}@: %{public}@",  buf,  0x20u);
          }

          CFRelease(cf);
        }

        v8 |= [v12 isEqualToString:@"pos"] ^ 1;
        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }

    while (v7);
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

@end