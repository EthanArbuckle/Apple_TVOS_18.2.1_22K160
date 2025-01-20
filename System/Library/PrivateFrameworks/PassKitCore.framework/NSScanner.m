@interface NSScanner
+ (id)SQLParsingScannerWithSQL:(id)a3;
- (BOOL)_scanBalancedSubstringFromCharacter:(unsigned __int16)a3 appendToString:(id)a4;
- (BOOL)_scanSQLiteIdentifierCharactersIntoString:(id *)a3;
- (BOOL)_scanSQLiteIdentifierIntoString:(id *)a3;
- (BOOL)_scanTableSQLColumn:(id *)a3;
- (BOOL)_scanTableSQLConstraint:(id *)a3;
- (BOOL)_scanThroughQuoteWithDelimiter:(id)a3 appendToString:(id)a4;
- (BOOL)_scanUpToTopLevelDelimiters:(id)a3 intoString:(id *)a4;
- (BOOL)scanTableSQLColumns:(id *)a3 constraints:(id *)a4;
- (BOOL)scanTableSQLPreambleAndTableName:(id *)a3;
@end

@implementation NSScanner

+ (id)SQLParsingScannerWithSQL:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", a3));
  [v3 setCaseSensitive:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  [v3 setCharactersToBeSkipped:v4];

  return v3;
}

- (BOOL)scanTableSQLPreambleAndTableName:(id *)a3
{
  if (-[NSScanner scanString:intoString:](self, "scanString:intoString:", @"CREATE", 0LL)
    && -[NSScanner scanString:intoString:](self, "scanString:intoString:", @"TABLE", 0LL))
  {
    id v11 = 0LL;
    unsigned int v5 = -[NSScanner _scanSQLiteIdentifierIntoString:](self, "_scanSQLiteIdentifierIntoString:", &v11);
    id v6 = v11;
    v7 = v6;
    if (v5)
    {
      id v8 = sub_100311458(v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v8);
      BOOL v9 = 1;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
    v7 = 0LL;
  }

  return v9;
}

- (BOOL)scanTableSQLColumns:(id *)a3 constraints:(id *)a4
{
  *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = 0LL;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  do
  {
    id v8 = v7;
    id v16 = v7;
    unsigned int v9 = -[NSScanner _scanTableSQLColumn:](self, "_scanTableSQLColumn:", &v16);
    id v7 = v16;

    if (!v9) {
      break;
    }
    [*a3 addObject:v7];
  }

  while (-[NSScanner scanString:intoString:](self, "scanString:intoString:", @",", 0LL));
  id v10 = 0LL;
  do
  {
    id v11 = v10;
    id v15 = v10;
    unsigned int v12 = -[NSScanner _scanTableSQLConstraint:](self, "_scanTableSQLConstraint:", &v15);
    id v10 = v15;

    if (!v12) {
      break;
    }
    [*a4 addObject:v10];
  }

  while (-[NSScanner scanString:intoString:](self, "scanString:intoString:", @",", 0LL));
  if ([*a3 count]
    && -[NSScanner scanString:intoString:](self, "scanString:intoString:", @""), 0LL))
  {
    BOOL v13 = -[NSScanner isAtEnd](self, "isAtEnd");
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_scanTableSQLColumn:(id *)a3
{
  NSUInteger v5 = -[NSScanner scanLocation](self, "scanLocation");
  id v21 = 0LL;
  unsigned int v6 = -[NSScanner _scanSQLiteIdentifierIntoString:](self, "_scanSQLiteIdentifierIntoString:", &v21);
  id v7 = v21;
  id v8 = v7;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v9 = qword_100707B50;
  id v10 = v7;
  if (v9 != -1) {
    dispatch_once(&qword_100707B50, &stru_1006562C8);
  }
  id v11 = (void *)qword_100707B48;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uppercaseString]);

  LODWORD(v11) = [v11 containsObject:v12];
  if (!(_DWORD)v11)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___SQLiteTableColumn);
    id v15 = sub_100311458(v10);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[SQLiteTableColumn setName:](v14, "setName:", v16);

    id v20 = 0LL;
    LODWORD(v16) = -[NSScanner _scanUpToTopLevelDelimiters:intoString:]( self,  "_scanUpToTopLevelDelimiters:intoString:",  @","),  &v20);
    id v17 = v20;
    if ((_DWORD)v16) {
      -[SQLiteTableColumn setQualifiers:](v14, "setQualifiers:", v17);
    }
    v18 = v14;
    *a3 = v18;

    BOOL v13 = 1;
  }

  else
  {
LABEL_5:
    -[NSScanner setScanLocation:](self, "setScanLocation:", v5);
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_scanTableSQLConstraint:(id *)a3
{
  return -[NSScanner _scanUpToTopLevelDelimiters:intoString:]( self,  "_scanUpToTopLevelDelimiters:intoString:",  @","),  a3);
}

- (BOOL)_scanSQLiteIdentifierIntoString:(id *)a3
{
  v4 = self;
  id v13 = 0LL;
  unsigned __int8 v5 = -[NSScanner scanString:intoString:](self, "scanString:intoString:", @"'", &v13);
  id v6 = v13;
  id v7 = v6;
  if ((v5 & 1) != 0)
  {
    id v8 = v6;
  }

  else
  {
    id v12 = v6;
    unsigned int v9 = -[NSScanner scanString:intoString:](v4, "scanString:intoString:", @"\"", &v12);
    id v8 = v12;

    if (!v9)
    {
      LOBYTE(v4) = -[NSScanner _scanSQLiteIdentifierCharactersIntoString:]( v4,  "_scanSQLiteIdentifierCharactersIntoString:",  a3);
      goto LABEL_8;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v8));
  LODWORD(v4) = -[NSScanner _scanThroughQuoteWithDelimiter:appendToString:]( v4,  "_scanThroughQuoteWithDelimiter:appendToString:",  v8,  v10);
  if ((_DWORD)v4) {
    *a3 = v10;
  }

LABEL_8:
  return (char)v4;
}

- (BOOL)_scanSQLiteIdentifierCharactersIntoString:(id *)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "alphanumericCharacterSet"));
  [v5 addCharactersInString:@"_$"];
  LOBYTE(a3) = -[NSScanner scanCharactersFromSet:intoString:](self, "scanCharactersFromSet:intoString:", v5, a3);

  return (char)a3;
}

- (BOOL)_scanUpToTopLevelDelimiters:(id)a3 intoString:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSMutableCharacterSet,  "characterSetWithCharactersInString:",  @"'("));
  [v7 formUnionWithCharacterSet:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v18 = 0LL;
  unsigned int v9 = -[NSScanner scanUpToCharactersFromSet:intoString:](self, "scanUpToCharactersFromSet:intoString:", v7, &v18);
  id v10 = v18;
  if (v9) {
    [v8 appendString:v10];
  }
  if (!-[NSScanner isAtEnd](self, "isAtEnd"))
  {
    while (1)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSScanner string](self, "string"));
      id v13 = objc_msgSend(v12, "characterAtIndex:", -[NSScanner scanLocation](self, "scanLocation"));

      -[NSScanner _scanBalancedSubstringFromCharacter:appendToString:]( self,  "_scanBalancedSubstringFromCharacter:appendToString:",  v13,  v8);
      id v17 = v10;
      unsigned int v14 = -[NSScanner scanUpToCharactersFromSet:intoString:](self, "scanUpToCharactersFromSet:intoString:", v7, &v17);
      id v11 = v17;

      if (v14) {
        [v8 appendString:v11];
      }
      id v10 = v11;
      if (-[NSScanner isAtEnd](self, "isAtEnd")) {
        goto LABEL_9;
      }
    }
  }

  id v11 = v10;
LABEL_9:
  id v15 = [v8 length];
  if (v15) {
    *a4 = v8;
  }

  return v15 != 0LL;
}

- (BOOL)_scanBalancedSubstringFromCharacter:(unsigned __int16)a3 appendToString:(id)a4
{
  unsigned __int16 v11 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v11,  1LL));
  [v5 appendString:v6];
  -[NSScanner scanString:intoString:](self, "scanString:intoString:", v6, 0LL);
  if (v11 == 34 || v11 == 39)
  {
    LOBYTE(self) = -[NSScanner _scanThroughQuoteWithDelimiter:appendToString:]( self,  "_scanThroughQuoteWithDelimiter:appendToString:",  v6,  v5);
  }

  else if (v11 == 40)
  {
    id v10 = 0LL;
    unsigned int v7 = -[NSScanner _scanUpToTopLevelDelimiters:intoString:]( self,  "_scanUpToTopLevelDelimiters:intoString:",  @""),  &v10);
    id v8 = v10;
    if (v7) {
      [v5 appendString:v8];
    }
    LODWORD(self) = -[NSScanner scanString:intoString:](self, "scanString:intoString:", @""), 0LL);
    if ((_DWORD)self) {
      [v5 appendString:@""]);
    }
  }

  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_scanThroughQuoteWithDelimiter:(id)a3 appendToString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[NSScanner isAtEnd](self, "isAtEnd"))
  {
    do
    {
      id v12 = 0LL;
      unsigned int v8 = -[NSScanner scanUpToString:intoString:](self, "scanUpToString:intoString:", v6, &v12);
      id v9 = v12;
      if (v8) {
        [v7 appendString:v9];
      }
      if (-[NSScanner scanString:intoString:](self, "scanString:intoString:", v6, 0LL))
      {
        [v7 appendString:v6];
        if (!-[NSScanner scanString:intoString:](self, "scanString:intoString:", v6, 0LL))
        {

          BOOL v10 = 1;
          goto LABEL_9;
        }

        [v7 appendString:v6];
      }
    }

    while (!-[NSScanner isAtEnd](self, "isAtEnd"));
  }

  BOOL v10 = 0;
LABEL_9:

  return v10;
}

@end