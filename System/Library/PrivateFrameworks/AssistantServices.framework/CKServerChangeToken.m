@interface CKServerChangeToken
+ (id)ad_unarchiveTokenFromData:(id)a3 withExceptionBlock:(id)a4;
- (id)ad_archiveTokenToDataWithExceptionBlock:(id)a3;
@end

@implementation CKServerChangeToken

- (id)ad_archiveTokenToDataWithExceptionBlock:(id)a3
{
  id v4 = a3;
  v5 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", self, NSKeyedArchiveRootObjectKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v5, "encodedData"));
  id v7 = [v6 copy];

  return v7;
}

+ (id)ad_unarchiveTokenFromData:(id)a3 withExceptionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    v8 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  0LL);
    id v9 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v8,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken),  NSKeyedArchiveRootObjectKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[NSKeyedUnarchiver finishDecoding](v8, "finishDecoding");
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

@end