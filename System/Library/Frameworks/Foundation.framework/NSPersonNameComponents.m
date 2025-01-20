@interface NSPersonNameComponents
+ (BOOL)supportsSecureCoding;
+ (id)__componentsRequiredForScriptDetectionWithPhoneticDesired:(BOOL)a3;
+ (id)_allComponents;
+ (id)_allProperties;
- (BOOL)_isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponents:(id)a3;
- (NSPersonNameComponents)init;
- (NSPersonNameComponents)initWithCoder:(id)a3;
- (NSPersonNameComponents)phoneticRepresentation;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (id)_scriptDeterminingStringRepresentationWithPhoneticDesired:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFamilyName:(NSString *)familyName;
- (void)setGivenName:(NSString *)givenName;
- (void)setMiddleName:(NSString *)middleName;
- (void)setNamePrefix:(NSString *)namePrefix;
- (void)setNameSuffix:(NSString *)nameSuffix;
- (void)setNickname:(NSString *)nickname;
- (void)setPhoneticRepresentation:(NSPersonNameComponents *)phoneticRepresentation;
@end

@implementation NSPersonNameComponents

- (NSPersonNameComponents)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPersonNameComponents;
  v2 = -[NSPersonNameComponents init](&v4, sel_init);
  if (v2) {
    v2->_private = objc_alloc_init(&OBJC_CLASS____NSPersonNameComponentsData);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersonNameComponents)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (self)
    {
      if ([a3 containsValueForKey:@"NS.nameComponentsPrivate"]) {
        self->_private = (id)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.nameComponentsPrivate"),  "copy");
      }
    }

    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersonNameComponents cannot be decoded by non-keyed archivers" userInfo:0]);
    -[NSPersonNameComponents encodeWithCoder:](v6, v7, v8);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_private forKey:@"NS.nameComponentsPrivate"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
    -[NSPersonNameComponents copyWithZone:](v5, v6, v7);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[self->_private copyWithZone:a3];
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersonNameComponents;
  -[NSPersonNameComponents dealloc](&v3, sel_dealloc);
}

- (NSString)givenName
{
  return (NSString *)[self->_private givenName];
}

- (void)setGivenName:(NSString *)givenName
{
}

- (NSString)familyName
{
  return (NSString *)[self->_private familyName];
}

- (void)setFamilyName:(NSString *)familyName
{
}

- (NSString)middleName
{
  return (NSString *)[self->_private middleName];
}

- (void)setMiddleName:(NSString *)middleName
{
}

- (NSString)namePrefix
{
  return (NSString *)[self->_private namePrefix];
}

- (void)setNamePrefix:(NSString *)namePrefix
{
}

- (NSString)nameSuffix
{
  return (NSString *)[self->_private nameSuffix];
}

- (void)setNameSuffix:(NSString *)nameSuffix
{
}

- (NSString)nickname
{
  return (NSString *)[self->_private nickname];
}

- (void)setNickname:(NSString *)nickname
{
}

- (NSPersonNameComponents)phoneticRepresentation
{
  return (NSPersonNameComponents *)[self->_private phoneticRepresentation];
}

- (void)setPhoneticRepresentation:(NSPersonNameComponents *)phoneticRepresentation
{
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersonNameComponents;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ {givenName = %@, familyName = %@, middleName = %@, namePrefix = %@, nameSuffix = %@, nickname = %@ phoneticRepresentation = %@ }",  -[NSPersonNameComponents description](&v3, sel_description),  -[NSPersonNameComponents givenName](self, "givenName"),  -[NSPersonNameComponents familyName](self, "familyName"),  -[NSPersonNameComponents middleName](self, "middleName"),  -[NSPersonNameComponents namePrefix](self, "namePrefix"),  -[NSPersonNameComponents nameSuffix](self, "nameSuffix"),  -[NSPersonNameComponents nickname](self, "nickname"),  -[NSPersonNameComponents phoneticRepresentation](self, "phoneticRepresentation"));
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NSPersonNameComponents isEqualToComponents:](self, "isEqualToComponents:");
}

- (BOOL)isEqualToComponents:(id)a3
{
  id v3 = a3;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    id v5 = +[NSPersonNameComponents _allProperties](&OBJC_CLASS___NSPersonNameComponents, "_allProperties");
    uint64_t v8 = 0LL;
    v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    char v11 = 1;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __46__NSPersonNameComponents_isEqualToComponents___block_invoke;
    v7[3] = &unk_189C9B2C0;
    v7[4] = self;
    v7[5] = v3;
    v7[6] = &v8;
    [v5 enumerateObjectsUsingBlock:v7];
    LOBYTE(v3) = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return (char)v3;
}

uint64_t __46__NSPersonNameComponents_isEqualToComponents___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  SEL v6 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
  uint64_t result = [*(id *)(a1 + 40) valueForKey:a2];
  if (result) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 || v6 && (!result || (uint64_t result = [v6 isEqual:result], (result & 1) == 0)))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *a3 = 1;
  }

  return result;
}

- (unint64_t)hash
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 1LL;
  id v3 = +[NSPersonNameComponents _allProperties](&OBJC_CLASS___NSPersonNameComponents, "_allProperties");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __30__NSPersonNameComponents_hash__block_invoke;
  v6[3] = &unk_189C9B2E8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__NSPersonNameComponents_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t result = [v3 hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result - v4 + 32 * v4;
  return result;
}

+ (id)_allComponents
{
  v3[6] = *MEMORY[0x1895F89C0];
  v3[0] = @"givenName";
  v3[1] = @"familyName";
  v3[2] = @"middleName";
  v3[3] = @"namePrefix";
  v3[4] = @"nameSuffix";
  v3[5] = @"nickname";
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v3, 6));
}

+ (id)_allProperties
{
  void v3[7] = *MEMORY[0x1895F89C0];
  v3[0] = @"givenName";
  v3[1] = @"familyName";
  v3[2] = @"middleName";
  v3[3] = @"namePrefix";
  v3[4] = @"nameSuffix";
  v3[5] = @"nickname";
  v3[6] = @"phoneticRepresentation";
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v3, 7));
}

+ (id)__componentsRequiredForScriptDetectionWithPhoneticDesired:(BOOL)a3
{
  v6[3] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v6[0] = @"phoneticRepresentation.givenName";
    v6[1] = @"phoneticRepresentation.middleName";
    v6[2] = @"phoneticRepresentation.familyName";
    id v3 = v6;
  }

  else
  {
    v5[0] = @"givenName";
    v5[1] = @"middleName";
    v5[2] = @"familyName";
    id v3 = v5;
  }

  return (id)[MEMORY[0x189603F18] arrayWithObjects:v3 count:3];
}

- (id)_scriptDeterminingStringRepresentationWithPhoneticDesired:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = +[NSPersonNameComponents __componentsRequiredForScriptDetectionWithPhoneticDesired:]( &OBJC_CLASS___NSPersonNameComponents,  "__componentsRequiredForScriptDetectionWithPhoneticDesired:",  v3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSPersonNameComponents valueForKeyPath:]( self,  "valueForKeyPath:",  *(void *)(*((void *)&v14 + 1) + 8 * v10));
        if (v11) {
          -[NSString appendString:](v5, "appendString:", v11);
        }
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }

    while (v8);
  }

  return v5;
}

- (BOOL)_isEmpty
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!self) {
    return 1;
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v3 = (void *)[(id)objc_opt_class() _allProperties];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v15;
  BOOL v7 = 1;
  do
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = (void *)-[NSPersonNameComponents valueForKeyPath:]( self,  "valueForKeyPath:",  *(void *)(*((void *)&v14 + 1) + 8 * i));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        BOOL v10 = [v9 length] == 0;
      }
      else {
        BOOL v10 = v9 == 0LL;
      }
      if (!v10) {
        BOOL v7 = 0;
      }
    }

    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  }

  while (v5);
  return v7;
}

@end