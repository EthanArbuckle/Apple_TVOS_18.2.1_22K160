@interface NSException(NSException)
+ (uint64_t)supportsSecureCoding;
- (NSString)debugDescription;
- (uint64_t)encodeWithCoder:()NSException;
- (uint64_t)initWithCoder:()NSException;
@end

@implementation NSException(NSException)

- (uint64_t)encodeWithCoder:()NSException
{
  char v5 = [a3 allowsKeyedCoding];
  uint64_t v6 = [a1 name];
  if ((v5 & 1) != 0)
  {
    [a3 encodeObject:v6 forKey:@"NS.name"];
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "reason"), @"NS.reason");
    return objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "userInfo"), @"NS.userinfo");
  }

  else
  {
    [a3 encodeObject:v6];
    objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "reason"));
    return objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "userInfo"));
  }

- (uint64_t)initWithCoder:()NSException
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    return objc_msgSend( a1,  "initWithName:reason:userInfo:",  objc_msgSend(a3, "decodeObject"),  objc_msgSend(a3, "decodeObject"),  objc_msgSend(a3, "decodeObject"));
  }
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v5 = [&unk_189D1CDA0 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(&unk_189D1CDA0);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if (([a3 containsValueForKey:v9] & 1) == 0)
        {
          v29 = @"NSDebugDescription";
          v30 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing required key '%@'",  v9);
          v17 = (void *)MEMORY[0x189603F68];
          v18 = &v30;
          v19 = &v29;
          goto LABEL_19;
        }
      }

      uint64_t v6 = [&unk_189D1CDA0 countByEnumeratingWithState:&v32 objects:v31 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [a3 decodeObjectOfClass:v10 forKey:@"NS.name"];
  if (!v11)
  {
    v27 = @"NSDebugDescription";
    v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing required 'name' for the exception.");
    v17 = (void *)MEMORY[0x189603F68];
    v18 = &v28;
    v19 = &v27;
LABEL_19:
    v20 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  [v17 dictionaryWithObjects:v18 forKeys:v19 count:1]);

    [a3 failWithError:v20];
    return 0LL;
  }

  uint64_t v12 = v11;
  if ((_NSIsNSString() & 1) == 0)
  {
    v25 = @"NSDebugDescription";
    v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Name must be a string - got: %@",  objc_opt_class());
    v17 = (void *)MEMORY[0x189603F68];
    v18 = &v26;
    v19 = &v25;
    goto LABEL_19;
  }

  uint64_t v13 = [a3 decodeObjectOfClass:v10 forKey:@"NS.reason"];
  if (v13 && (_NSIsNSString() & 1) == 0)
  {
    v23 = @"NSDebugDescription";
    v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Reason must be a string - got: %@",  objc_opt_class());
    v17 = (void *)MEMORY[0x189603F68];
    v18 = &v24;
    v19 = &v23;
    goto LABEL_19;
  }

  uint64_t v14 = objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( (id)objc_msgSend(a3, "allowedClasses"),  "setByAddingObjectsFromSet:",  __NSPropertyListClasses_ForArchival_ErrorAndException()),  @"NS.userinfo");
  if (v14 && (_NSIsNSDictionary() & 1) == 0)
  {
    v21 = @"NSDebugDescription";
    v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UserInfo must be a dictionary - got: %@",  objc_opt_class());
    v17 = (void *)MEMORY[0x189603F68];
    v18 = &v22;
    v19 = &v21;
    goto LABEL_19;
  }

  v15 = (void *)[a1 initWithName:v12 reason:v13 userInfo:v14];
  [v15 _markAsUnarchived];
  return (uint64_t)v15;
}

+ (uint64_t)supportsSecureCoding
{
  return 1LL;
}

- (NSString)debugDescription
{
  int v2 = [a1 _isUnarchived];
  uint64_t v3 = [a1 description];
  if (v2) {
    return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n UNARCHIVED", v3, v5);
  }
  else {
    return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@\n%@",  v3,  [a1 callStackSymbols]);
  }
}

@end