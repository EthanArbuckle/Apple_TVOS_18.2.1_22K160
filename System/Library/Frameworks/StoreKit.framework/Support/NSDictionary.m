@interface NSDictionary
- (BOOL)tcr_BOOLForKey:(id)a3;
- (BOOL)tcr_BOOLForKey:(id)a3 missingValue:(BOOL)a4;
- (BOOL)tcr_BOOLForKeyPath:(id)a3;
- (BOOL)tcr_BOOLForKeyPath:(id)a3 missingValue:(BOOL)a4;
- (BOOL)tcr_nullForKey:(id)a3;
- (BOOL)tcr_nullForKeyPath:(id)a3;
- (float)tcr_floatForKey:(id)a3;
- (id)_tcr_associatedReader;
- (id)_tcr_valueOfClass:(Class)a3 forKey:(id)a4;
- (id)lib_objectForCaseInsensitiveKey:(id)a3;
- (id)tcr_arrayForKey:(id)a3;
- (id)tcr_arrayForKeyPath:(id)a3;
- (id)tcr_dataForKey:(id)a3;
- (id)tcr_dataForKeyPath:(id)a3;
- (id)tcr_dateForKey:(id)a3;
- (id)tcr_dateForKeyPath:(id)a3;
- (id)tcr_dictionaryForKey:(id)a3;
- (id)tcr_dictionaryForKeyPath:(id)a3;
- (id)tcr_integerValueForKey:(id)a3;
- (id)tcr_integerValueForKeyPath:(id)a3;
- (id)tcr_numberForKey:(id)a3;
- (id)tcr_numberForKeyPath:(id)a3;
- (id)tcr_stringForKey:(id)a3;
- (id)tcr_stringForKeyPath:(id)a3;
- (id)tcr_urlForKey:(id)a3;
- (id)tcr_urlForKeyPath:(id)a3;
- (int64_t)tcr_integerValueForKey:(id)a3 missingValue:(int64_t)a4;
- (int64_t)tcr_integerValueForKeyPath:(id)a3 missingValue:(int64_t)a4;
- (unint64_t)tcr_unsignedLongLongForKey:(id)a3;
- (unint64_t)tcr_unsignedLongLongForKeyPath:(id)a3;
@end

@implementation NSDictionary

- (id)lib_objectForCaseInsensitiveKey:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary keyEnumerator](self, "keyEnumerator", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10));
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v13 = 0LL;
LABEL_11:

  return v13;
}

- (id)tcr_arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSArray),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)tcr_arrayForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSArray) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)tcr_BOOLForKey:(id)a3
{
  return -[NSDictionary tcr_BOOLForKey:missingValue:](self, "tcr_BOOLForKey:missingValue:", a3, 0LL);
}

- (BOOL)tcr_BOOLForKey:(id)a3 missingValue:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_numberForKey:](self, "tcr_numberForKey:", a3));
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (BOOL)tcr_BOOLForKeyPath:(id)a3
{
  return -[NSDictionary tcr_BOOLForKeyPath:missingValue:](self, "tcr_BOOLForKeyPath:missingValue:", a3, 0LL);
}

- (BOOL)tcr_BOOLForKeyPath:(id)a3 missingValue:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_numberForKeyPath:](self, "tcr_numberForKeyPath:", a3));
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)tcr_dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSData),  v4);
  id v6 = (NSData *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    id v7 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  v4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8) {
      id v6 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v8,  0LL);
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)tcr_dataForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSData) forKeyPath:v4];
  id v7 = (NSData *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    id v8 = [v5 valueOfClass:objc_opt_class(NSString) forKeyPath:v4];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v9) {
      id v7 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v9,  0LL);
    }
    else {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (id)tcr_dateForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSDate),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)tcr_dateForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSDate) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)tcr_dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSDictionary),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)tcr_dictionaryForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSDictionary) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (float)tcr_floatForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_numberForKey:](self, "tcr_numberForKey:", a3));
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (id)tcr_integerValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    id v7 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      uint64_t v11 = 0LL;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v8));
      id v6 = 0LL;
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (int64_t)tcr_integerValueForKey:(id)a3 missingValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    id v9 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return a4;
}

- (id)tcr_integerValueForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSNumber) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    id v8 = [v5 valueOfClass:objc_opt_class(NSString) forKeyPath:v4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      uint64_t v12 = 0LL;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v9));
      id v7 = 0LL;
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (int64_t)tcr_integerValueForKeyPath:(id)a3 missingValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v8 = [v7 valueOfClass:objc_opt_class(NSNumber) forKeyPath:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    id v10 = [v7 valueOfClass:objc_opt_class(NSString) forKeyPath:v6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return a4;
}

- (BOOL)tcr_nullForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNull),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  BOOL v8 = v6 == v7;

  return v8;
}

- (BOOL)tcr_nullForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSNull) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  LOBYTE(v4) = v7 == v8;

  return (char)v4;
}

- (id)tcr_numberForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSNumber),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    id v7 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  v4);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v9, "setNumberStyle:", 1LL);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v9, "numberFromString:", v8));
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)tcr_numberForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSNumber) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    id v8 = [v5 valueOfClass:objc_opt_class(NSString) forKeyPath:v4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v10, "setNumberStyle:", 1LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v10, "numberFromString:", v9));
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (id)tcr_stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSDictionary _tcr_valueOfClass:forKey:]( self,  "_tcr_valueOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString),  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)tcr_stringForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v6 = [v5 valueOfClass:objc_opt_class(NSString) forKeyPath:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (unint64_t)tcr_unsignedLongLongForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_numberForKey:](self, "tcr_numberForKey:", a3));
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (unint64_t)tcr_unsignedLongLongForKeyPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_numberForKeyPath:](self, "tcr_numberForKeyPath:", a3));
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (id)tcr_urlForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_stringForKey:](self, "tcr_stringForKey:", a3));
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)tcr_urlForKeyPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary tcr_stringForKeyPath:](self, "tcr_stringForKeyPath:", a3));
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_tcr_valueOfClass:(Class)a3 forKey:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a4));
  if ((objc_opt_isKindOfClass(v5, a3) & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (id)_tcr_associatedReader
{
  v8.receiver = self;
  v8.super_class = &OBJC_CLASS___NSDictionary;
  id v3 = -[NSDictionary _tcr_associatedReader](&v8, "_tcr_associatedReader");
  id v4 = (TypeCheckedDictionaryReader *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TypeCheckedDictionaryReader);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v6 = -[TypeCheckedDictionaryReader initWithDictionary:]( objc_alloc(&OBJC_CLASS___TypeCheckedDictionaryReader),  "initWithDictionary:",  self);

    -[NSDictionary _tcr_associateWithReader:](self, "_tcr_associateWithReader:", v6);
    id v4 = v6;
  }

  return v4;
}

@end