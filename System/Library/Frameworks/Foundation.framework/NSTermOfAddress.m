@interface NSTermOfAddress
+ (BOOL)supportsSecureCoding;
+ (NSTermOfAddress)feminine;
+ (NSTermOfAddress)localizedForLanguageIdentifier:(NSString *)language withPronouns:(NSArray *)pronouns;
+ (NSTermOfAddress)masculine;
+ (NSTermOfAddress)neutral;
+ (id)currentUser;
- (BOOL)_containsPronoun:(id)a3 withGrammemes:(id)a4;
- (BOOL)_isSupportedInLanguage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)pronouns;
- (NSString)languageIdentifier;
- (NSTermOfAddress)initWithCoder:(id)a3;
- (id)_initWithGender:(int64_t)a3 addressingUser:(BOOL)a4;
- (id)_initWithPronouns:(id)a3 forLanguage:(id)a4;
- (id)_morphologyForLanguage:(id)a3;
- (id)_withExtrapolatedPronouns;
- (id)debugDescription;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSTermOfAddress

- (BOOL)_isSupportedInLanguage:(id)a3
{
  uint64_t v4 = (uint64_t)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = NSTermOfAddress.isSupportedInLanguage(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)_morphologyForLanguage:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = (uint64_t)v4;
  v8._object = v6;
  NSTermOfAddress.morphologyForLanguage(_:)(v8);

  swift_bridgeObjectRelease();
  if (v21)
  {
    type metadata accessor for NSMorphologyPronoun(0LL, &lazy cache variable for type metadata for NSMorphology);
    __int16 v14 = v19;
    char v15 = v20;
    uint64_t v16 = v21;
    char v17 = v22;
    v9.i64[0] = 0xFFFFFFFFFFLL;
    v9.i64[1] = 0xFFFFFFFFFFLL;
    uint64x2_t v10 = (uint64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v22 | ((unint64_t)v23 << 32)), v9);
    int16x8_t v11 = (int16x8_t)vshlq_u64(v10, (uint64x2_t)xmmword_183728FF0);
    *(int32x2_t *)v10.i8 = vmovn_s64((int64x2_t)vshlq_u64(v10, (uint64x2_t)xmmword_183728FE0));
    *(int32x2_t *)v11.i8 = vmovn_s64((int64x2_t)v11);
    v11.i16[1] = v11.i16[2];
    v11.i16[2] = v10.i16[0];
    v11.i16[3] = v10.i16[2];
    unsigned __int32 v18 = vmovn_s16(v11).u32[0];
    *(void *)&v24.grammaticalGender.value = &v14;
    NSMorphology.init(_:)((NSMorphology *)v10.u32[1], v24);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (BOOL)_containsPronoun:(id)a3 withGrammemes:(id)a4
{
  uint64_t v6 = (uint64_t)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  Swift::String v8 = v7;
  uint64_t v9 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64x2_t v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  LOBYTE(v6) = NSTermOfAddress.containsPronoun(_:grammemes:)(v11, (Swift::OpaquePointer)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)_withExtrapolatedPronouns
{
  v30 = self;
  TermOfAddress.init(_:)(v30, &v32);
  uint64_t v26 = v33;
  uint64_t v28 = v32;
  uint64_t v22 = v35;
  uint64_t v24 = v34;
  uint64_t v2 = v36;
  uint64_t v3 = v37;
  uint64_t v4 = v38;
  uint64_t v5 = (uint64_t)v39;
  uint64_t v6 = v40;
  uint64_t v7 = v41;
  uint64_t v8 = v42;
  uint64_t v9 = v43;
  unint64_t v10 = v44;
  TermOfAddress.withExtrapolatedPronouns()((uint64_t)&v45);
  outlined consume of TermOfAddress._TermOfAddress(v28, v26, v24, v22, v2, v3, v4, v5, v6, v7, v8, v9, v10);

  unint64_t v11 = v57;
  if (v57 == 4) {
    return 0LL;
  }
  uint64_t v14 = v55;
  uint64_t v13 = v56;
  uint64_t v15 = v54;
  uint64_t v29 = v51;
  v31 = v52;
  uint64_t v27 = v50;
  uint64_t v23 = v53;
  uint64_t v25 = v49;
  uint64_t v17 = v47;
  uint64_t v16 = v48;
  uint64_t v19 = v45;
  uint64_t v18 = v46;
  uint64_t v32 = v45;
  uint64_t v33 = v46;
  uint64_t v34 = v47;
  uint64_t v35 = v48;
  uint64_t v36 = v49;
  uint64_t v37 = v50;
  uint64_t v38 = v51;
  v39 = v52;
  uint64_t v40 = v53;
  uint64_t v41 = v54;
  uint64_t v42 = v55;
  uint64_t v43 = v56;
  unint64_t v44 = v57;
  TermOfAddress._bridgeToObjectiveC()(v52);
  uint64_t v21 = v20;
  outlined consume of TermOfAddress?(v19, v18, v17, v16, v25, v27, v29, (uint64_t)v31, v23, v15, v14, v13, v11);
  return v21;
}

- (id)_initWithGender:(int64_t)a3 addressingUser:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSTermOfAddress;
  id result = -[NSTermOfAddress init](&v7, sel_init);
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 3) = 0LL;
    *((void *)result + 4) = 0LL;
    *((_BYTE *)result + 16) = a4;
  }

  return result;
}

- (id)_initWithPronouns:(id)a3 forLanguage:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSTermOfAddress;
  uint64_t v6 = -[NSTermOfAddress init](&v9, sel_init);
  objc_super v7 = v6;
  if (v6)
  {
    v6->_gender = 0LL;
    v6->_language = (NSString *)[a4 copy];
    v7->_pronouns = (NSArray *)[a3 copy];
    v7->_addressesCurrentUser = 0;
  }

  return v7;
}

+ (NSTermOfAddress)neutral
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __26__NSTermOfAddress_neutral__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C496BE0 != -1) {
    dispatch_once(&qword_18C496BE0, v3);
  }
  return (NSTermOfAddress *)_MergedGlobals_120;
}

uint64_t __26__NSTermOfAddress_neutral__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _initWithGender:3 addressingUser:0];
  _MergedGlobals_120 = result;
  return result;
}

+ (NSTermOfAddress)feminine
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __27__NSTermOfAddress_feminine__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C496BF0 != -1) {
    dispatch_once(&qword_18C496BF0, v3);
  }
  return (NSTermOfAddress *)qword_18C496BE8;
}

uint64_t __27__NSTermOfAddress_feminine__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _initWithGender:1 addressingUser:0];
  qword_18C496BE8 = result;
  return result;
}

+ (NSTermOfAddress)masculine
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __28__NSTermOfAddress_masculine__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C496C00 != -1) {
    dispatch_once(&qword_18C496C00, v3);
  }
  return (NSTermOfAddress *)qword_18C496BF8;
}

uint64_t __28__NSTermOfAddress_masculine__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _initWithGender:2 addressingUser:0];
  qword_18C496BF8 = result;
  return result;
}

+ (id)currentUser
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __30__NSTermOfAddress_currentUser__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C496C10 != -1) {
    dispatch_once(&qword_18C496C10, v3);
  }
  return (id)qword_18C496C08;
}

uint64_t __30__NSTermOfAddress_currentUser__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _initWithGender:0 addressingUser:1];
  qword_18C496C08 = result;
  return result;
}

+ (NSTermOfAddress)localizedForLanguageIdentifier:(NSString *)language withPronouns:(NSArray *)pronouns
{
  return (NSTermOfAddress *) -[NSTermOfAddress _initWithPronouns:forLanguage:]( objc_alloc(&OBJC_CLASS___NSTermOfAddress),  "_initWithPronouns:forLanguage:",  pronouns,  language);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSTermOfAddress;
  -[NSTermOfAddress dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  if (-[NSTermOfAddress isEqual:]( self,  "isEqual:",  +[NSTermOfAddress neutral](&OBJC_CLASS___NSTermOfAddress, "neutral")))
  {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>{ neutral }",  objc_opt_class(),  self,  v6,  v7);
  }

  if (-[NSTermOfAddress isEqual:]( self,  "isEqual:",  +[NSTermOfAddress feminine](&OBJC_CLASS___NSTermOfAddress, "feminine")))
  {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>{ feminine }",  objc_opt_class(),  self,  v6,  v7);
  }

  if (-[NSTermOfAddress isEqual:]( self,  "isEqual:",  +[NSTermOfAddress masculine](&OBJC_CLASS___NSTermOfAddress, "masculine")))
  {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>{ masculine }",  objc_opt_class(),  self,  v6,  v7);
  }

  BOOL v4 = -[NSTermOfAddress isEqual:]( self,  "isEqual:",  +[NSTermOfAddress currentUser](&OBJC_CLASS___NSTermOfAddress, "currentUser"));
  uint64_t v5 = objc_opt_class();
  if (v4) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>{ currentUser }",  v5,  self,  v6,  v7);
  }
  else {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>{ languageIdentifier: %@, pronouns: %@ }",  v5,  self,  self->_language,  self->_pronouns);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTermOfAddress)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSTermOfAddress;
  BOOL v4 = -[NSTermOfAddress init](&v14, sel_init);
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    unint64_t v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    uint64_t v13 = @"Encoder does not allow keyed coding!";
    goto LABEL_13;
  }

  if (v4)
  {
    uint64_t v5 = [a3 decodeIntegerForKey:@"termOfAddress"];
    v4->_gender = v5;
    if ((unint64_t)(v5 - 1) <= 2)
    {
      v4->_addressesCurrentUser = 0;
LABEL_6:
      v4->_language = 0LL;
      v4->_pronouns = 0LL;
      return v4;
    }

    char v6 = [a3 decodeBoolForKey:@"addressesUser"];
    v4->_addressesCurrentUser = v6;
    if ((v6 & 1) != 0) {
      goto LABEL_6;
    }
    v4->_language = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"language"),  "copy");
    p_language = (id *)&v4->_language;
    uint64_t v8 = objc_msgSend( (id)objc_msgSend(a3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"pronouns"),  "copy");
    v4->_pronouns = (NSArray *)v8;
    if (!v4->_language || v8 == 0)
    {

      id *p_language = 0LL;
      v4->_pronouns = 0LL;

      unint64_t v11 = (void *)MEMORY[0x189603F70];
      uint64_t v12 = *MEMORY[0x189603A60];
      uint64_t v13 = @"Could not decode language or pronouns for NSTermOfAddress";
LABEL_13:
      objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (self->_addressesCurrentUser) {
      [a3 encodeBool:1 forKey:@"addressesUser"];
    }
    int64_t gender = self->_gender;
    if (gender) {
      [a3 encodeInteger:gender forKey:@"termOfAddress"];
    }
    language = self->_language;
    if (language) {
      [a3 encodeObject:language forKey:@"language"];
    }
    pronouns = self->_pronouns;
    if (pronouns) {
      [a3 encodeObject:pronouns forKey:@"pronouns"];
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Encoder does not allow keyed coding!" userInfo:0]);
    -[NSTermOfAddress hash](v8, v9);
  }

- (unint64_t)hash
{
  unint64_t v3 = self->_gender ^ [(id)objc_opt_class() hash] ^ self->_addressesCurrentUser;
  language = self->_language;
  if (language) {
    v3 ^= -[NSString hash](language, "hash");
  }
  pronouns = self->_pronouns;
  if (pronouns) {
    v3 ^= -[NSArray hash](pronouns, "hash");
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_gender == *((void *)a3 + 1)
    && self->_addressesCurrentUser == *((unsigned __int8 *)a3 + 16))
  {
    pronouns = self->_pronouns;
    if (pronouns == *((NSArray **)a3 + 4) || (BOOL v6 = -[NSArray isEqualToArray:](pronouns, "isEqualToArray:")))
    {
      language = self->_language;
      LOBYTE(v6) = language == *((NSString **)a3 + 3) || -[NSString isEqualToString:](language, "isEqualToString:");
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSString)languageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSArray)pronouns
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

@end