@interface NSString
- (BOOL)lib_skanIsVersionFidelityAware;
- (BOOL)lib_skanIsVersionMultiAware;
- (NSData)sk_sha1Hash;
- (NSNumber)lib_numberValue;
- (NSURL)tcr_url;
- (id)lib_accountDSIDValue;
- (id)lib_digestMD5;
- (id)lib_stringByAppendingPathComponents:(id)a3;
- (id)lib_stringByCopyingUTF8StringWithLength:(unint64_t)a3;
- (id)lib_stringByLimitingToLength:(unint64_t)a3 addElipsis:(BOOL)a4;
- (id)lib_stringSantiziedAndTruncatedToLength:(unint64_t)a3;
- (id)lib_volumePath;
- (unint64_t)tcr_unsignedLongLong;
@end

@implementation NSString

- (unint64_t)tcr_unsignedLongLong
{
  unint64_t v4 = 0LL;
  v2 = -[NSScanner initWithString:](objc_alloc(&OBJC_CLASS___NSScanner), "initWithString:", self);
  -[NSScanner scanUnsignedLongLong:](v2, "scanUnsignedLongLong:", &v4);

  return v4;
}

- (NSURL)tcr_url
{
  return +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self);
}

- (NSNumber)lib_numberValue
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v3, "setNumberStyle:", 1LL);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v3, "numberFromString:", self));

  return (NSNumber *)v4;
}

- (id)lib_accountDSIDValue
{
  return +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", strtoull(-[NSString UTF8String](self, "UTF8String"), 0LL, 10));
}

- (id)lib_digestMD5
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lib_digestMD5"));

  return v3;
}

- (id)lib_stringByAppendingPathComponents:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = objc_autoreleasePoolPush();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0LL;
      v12 = v5;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v5 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v12,  "stringByAppendingPathComponent:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  (void)v14));

        v11 = (char *)v11 + 1;
        v12 = v5;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  objc_autoreleasePoolPop(v6);
  return v5;
}

- (id)lib_stringByCopyingUTF8StringWithLength:(unint64_t)a3
{
  v5 = malloc(a3 + 1);
  if (!v5) {
    return &stru_1002FBA48;
  }
  v6 = v5;
  uint64_t v9 = 0LL;
  if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( self,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  v5,  a3,  &v9,  4LL,  0LL,  0LL,  -[NSString length](self, "length"),  0LL))
  {
    v6[v9] = 0;
    id v7 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v6);
  }

  else
  {
    id v7 = &stru_1002FBA48;
  }

  free(v6);
  return v7;
}

- (id)lib_stringByLimitingToLength:(unint64_t)a3 addElipsis:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[NSString length](self, "length") <= a3)
  {
    uint64_t v9 = self;
LABEL_6:
    id v8 = v9;
    return v8;
  }

  if (!v4)
  {
    uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", a3));
    goto LABEL_6;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", a3));
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@...", v7));

  return v8;
}

- (id)lib_stringSantiziedAndTruncatedToLength:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "alphanumericCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @".()-"));
  [v5 formUnionWithCharacterSet:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 invertedSet]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](self, "componentsSeparatedByCharactersInSet:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:&stru_1002FBA48]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lib_stringByLimitingToLength:addElipsis:", a3, 1));
  return v10;
}

- (id)lib_volumePath
{
  if (!-[NSString isAbsolutePath](self, "isAbsolutePath")) {
    return 0LL;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v4 = self;
  if (!-[NSString isEqualToString:](v4, "isEqualToString:", @"/"))
  {
    while (([v3 fileExistsAtPath:v4] & 1) == 0)
    {
      v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](v4, "stringByDeletingLastPathComponent"));

      BOOL v4 = v5;
      if (-[NSString isEqualToString:](v5, "isEqualToString:", @"/")) {
        goto LABEL_7;
      }
    }
  }

  v5 = v4;
LABEL_7:
  bzero(&v10, 0x878uLL);
  id v7 = v5;
  if (statfs(-[NSString fileSystemRepresentation](v7, "fileSystemRepresentation"), &v10))
  {
    id v8 = 0LL;
  }

  else
  {
    id v9 = [v3 stringWithFileSystemRepresentation:v10.f_mntonname length:strlen(v10.f_mntonname)];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v8;
}

- (BOOL)lib_skanIsVersionFidelityAware
{
  return -[NSString compare:options:](self, "compare:options:", @"2.2", 64LL) != NSOrderedAscending;
}

- (BOOL)lib_skanIsVersionMultiAware
{
  return -[NSString compare:options:](self, "compare:options:", @"3.0", 64LL) != NSOrderedAscending;
}

- (NSData)sk_sha1Hash
{
  v2 = self;
  Class v3 = sub_10009CF7C();

  return (NSData *)v3;
}

@end