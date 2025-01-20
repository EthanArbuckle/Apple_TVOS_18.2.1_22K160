@interface NSOrthography
+ (BOOL)supportsSecureCoding;
+ (NSOrthography)allocWithZone:(_NSZone *)a3;
+ (NSOrthography)defaultOrthographyForLanguage:(NSString *)language;
+ (NSOrthography)orthographyWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map;
+ (id)_orthographyWithDominantScript:(id)a3 languageMap:(id)a4;
+ (id)_scriptNameForScriptIndex:(unint64_t)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSArray)allLanguages;
- (NSArray)allScripts;
- (NSArray)languagesForScript:(NSString *)script;
- (NSDictionary)languageMap;
- (NSOrthography)initWithCoder:(NSCoder *)aDecoder;
- (NSOrthography)initWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map;
- (NSString)dominantLanguage;
- (NSString)dominantLanguageForScript:(NSString *)script;
- (NSString)dominantScript;
- (id)description;
- (id)replacementObjectForPortCoder:(id)a3;
- (unint64_t)hash;
- (unsigned)orthographyFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

+ (NSOrthography)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSOrthography == a1) {
    a1 = (id)objc_opt_class();
  }
  return (NSOrthography *)NSAllocateObject((Class)a1, 0LL, a3);
}

+ (NSOrthography)orthographyWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map
{
  return (NSOrthography *)(id)[objc_allocWithZone((Class)a1) initWithDominantScript:script languageMap:map];
}

- (NSOrthography)initWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map
{
}

- (unint64_t)hash
{
  LODWORD(result) = -[NSOrthography orthographyFlags](self, "orthographyFlags");
  if ((_DWORD)result) {
    return result;
  }
  NSUInteger v4 = -[NSString hash](-[NSOrthography dominantScript](self, "dominantScript"), "hash");
  return -[NSDictionary hash](-[NSOrthography languageMap](self, "languageMap"), "hash") ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }

  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    unsigned int v5 = -[NSOrthography orthographyFlags](self, "orthographyFlags");
    if (v5)
    {
      LOBYTE(v6) = v5 == [a3 orthographyFlags];
    }

    else
    {
      int v6 = -[NSString isEqualToString:]( -[NSOrthography dominantScript](self, "dominantScript"),  "isEqualToString:",  [a3 dominantScript]);
      if (v6) {
        LOBYTE(v6) = -[NSDictionary isEqual:]( -[NSOrthography languageMap](self, "languageMap"),  "isEqual:",  [a3 languageMap]);
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = -[NSOrthography dominantScript](self, "dominantScript");
  NSUInteger v4 = -[NSOrthography dominantLanguage](self, "dominantLanguage");
  unsigned int v5 = -[NSOrthography allScripts](self, "allScripts");
  int v6 = -[NSOrthography languagesForScript:](self, "languagesForScript:", v3);
  v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@->%@", v3, v4);
  if (-[NSArray count](v6, "count") >= 3)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" and %lu other languages",  -[NSArray count](v6, "count") - 1);
LABEL_5:
    v9 = (const __CFString *)v8;
    goto LABEL_7;
  }

  if (-[NSArray count](v6, "count") == 2)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" and %@",  -[NSArray objectAtIndex:](v6, "objectAtIndex:", 1LL));
    goto LABEL_5;
  }

  v9 = &stru_189CA6A28;
LABEL_7:
  if (-[NSArray count](v5, "count") < 3)
  {
    if (-[NSArray count](v5, "count") != 2)
    {
      v11 = &stru_189CA6A28;
      goto LABEL_13;
    }

    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", plus %@",  -[NSArray objectAtIndex:](v5, "objectAtIndex:", 1LL));
  }

  else
  {
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", plus %lu other scripts",  -[NSArray count](v5, "count") - 1);
  }

  v11 = (const __CFString *)v10;
LABEL_13:
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSOrthography;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{%@%@%@}",  -[NSOrthography description](&v13, sel_description),  v7,  v9,  v11);
}

- (Class)classForCoder
{
  return (Class)&OBJC_CLASS___NSOrthography;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v5 = -[NSOrthography dominantScript](self, "dominantScript");
  int v6 = -[NSOrthography languageMap](self, "languageMap");
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:v5 forKey:@"NSDominantScript"];
    [a3 encodeObject:v6 forKey:@"NSLanguageMap"];
  }

  else
  {
    [a3 encodeObject:v5];
    [a3 encodeObject:v6];
  }

- (NSOrthography)initWithCoder:(NSCoder *)aDecoder
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (-[NSCoder allowsKeyedCoding](aDecoder, "allowsKeyedCoding"))
  {
    id v6 = -[NSCoder decodeObjectOfClass:forKey:]( aDecoder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSDominantScript");
    if ((_NSIsNSString() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x189604010];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      id v10 = -[NSCoder decodeObjectOfClasses:forKey:]( aDecoder,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0),  @"NSLanguageMap");
      if ((_NSIsNSDictionary() & 1) != 0)
      {
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          uint64_t v26 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              if ((_NSIsNSString() & 1) == 0)
              {

                v23 = @"Orthography language map key is not a string";
                goto LABEL_29;
              }

              v16 = (void *)[v10 objectForKeyedSubscript:v15];
              if ((_NSIsNSArray() & 1) == 0)
              {

                v23 = @"Orthography language map value is not a list of languages";
                goto LABEL_29;
              }

              __int128 v30 = 0u;
              __int128 v31 = 0u;
              __int128 v28 = 0u;
              __int128 v29 = 0u;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v27 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v29;
                while (2)
                {
                  for (uint64_t j = 0LL; j != v18; ++j)
                  {
                    if (*(void *)v29 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    if ((_NSIsNSString() & 1) == 0)
                    {

                      v23 = @"Orthography language map list contains non-string language";
                      goto LABEL_29;
                    }
                  }

                  uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v27 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v13 = v26;
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v32 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        return -[NSOrthography initWithDominantScript:languageMap:]( self,  "initWithDominantScript:languageMap:",  v6,  v10);
      }

      v23 = @"Orthography language map is not a dictionary";
    }

    else
    {

      v23 = @"Orthography dominant script is not a string";
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (([a3 isBycopy] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSOrthography;
    return -[NSOrthography replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return self;
}

- (NSString)dominantScript
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSOrthography");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)languageMap
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSOrthography");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unsigned)orthographyFlags
{
  return NSOrthographyFlagsForDominantScriptAndLanguageMap( (uint64_t)-[NSOrthography dominantScript](self, "dominantScript"),  -[NSOrthography languageMap](self, "languageMap"));
}

- (NSArray)languagesForScript:(NSString *)script
{
  return (NSArray *)-[NSDictionary objectForKey:]( -[NSOrthography languageMap](self, "languageMap"),  "objectForKey:",  script);
}

- (NSString)dominantLanguageForScript:(NSString *)script
{
  v3 = -[NSOrthography languagesForScript:](self, "languagesForScript:", script);
  unint64_t result = -[NSArray count](v3, "count");
  if (result) {
    return (NSString *)-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0LL);
  }
  return result;
}

- (NSString)dominantLanguage
{
  return -[NSOrthography dominantLanguageForScript:]( self,  "dominantLanguageForScript:",  -[NSOrthography dominantScript](self, "dominantScript"));
}

- (NSArray)allScripts
{
  v3 = (NSArray *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithArray:",  -[NSDictionary allKeys](-[NSOrthography languageMap](self, "languageMap"), "allKeys"));
  NSUInteger v4 = -[NSOrthography dominantScript](self, "dominantScript");
  -[NSArray removeObject:](v3, "removeObject:", v4);
  -[NSArray insertObject:atIndex:](v3, "insertObject:atIndex:", v4, 0LL);
  return v3;
}

- (NSArray)allLanguages
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v3 = (NSArray *)[MEMORY[0x189603FA8] array];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  obuint64_t j = -[NSOrthography allScripts](self, "allScripts");
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = -[NSOrthography languagesForScript:]( self,  "languagesForScript:",  *(void *)(*((void *)&v22 + 1) + 8 * i));
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t j = 0LL; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * j);
              if (!-[NSArray containsObject:](v3, "containsObject:", v13)) {
                -[NSArray addObject:](v3, "addObject:", v13);
              }
            }

            uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
          }

          while (v10);
        }
      }

      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
    }

    while (v5);
  }

  return v3;
}

+ (id)_scriptNameForScriptIndex:(unint64_t)a3
{
  if (!a3) {
    return 0LL;
  }
  id result = @"Zyyy";
  if (a3 != 1 && a3 <= 0x1F) {
    return (id)objc_msgSend(&unk_189D1ED50, "objectAtIndex:");
  }
  return result;
}

+ (id)_orthographyWithDominantScript:(id)a3 languageMap:(id)a4
{
  uint64_t v6 = NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)a3, a4);
  if ((_DWORD)v6) {
    return +[NSSimpleOrthography orthographyWithFlags:](&OBJC_CLASS___NSSimpleOrthography, "orthographyWithFlags:", v6);
  }
  else {
    return +[NSOrthography orthographyWithDominantScript:languageMap:]( &OBJC_CLASS___NSComplexOrthography,  "orthographyWithDominantScript:languageMap:",  a3,  a4);
  }
}

+ (NSOrthography)defaultOrthographyForLanguage:(NSString *)language
{
  uint64_t v5 = objc_msgSend(&unk_189D1ECC0, "indexOfObject:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603F90]) initWithLocaleIdentifier:language];
    uint64_t v7 = (void *)[v6 languageCode];
    uint64_t v8 = (const __CFString *)[v6 scriptCode];
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0LL;
    }
    if (!v9)
    {
      uint64_t v10 = [&unk_189D1ECD8 indexOfObject:v7];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = v10;

        uint64_t v5 = v13;
        goto LABEL_16;
      }

      uint64_t v11 = [v7 stringByAppendingString:@"-"];
      unint64_t v12 = 0LL;
      do
      {
        else {
          uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v12 > 0xF6) {
          break;
        }
        ++v12;
      }

      while (v5 == 0x7FFFFFFFFFFFFFFFLL);
    }

    if (v8) {
      goto LABEL_31;
    }
  }

@end