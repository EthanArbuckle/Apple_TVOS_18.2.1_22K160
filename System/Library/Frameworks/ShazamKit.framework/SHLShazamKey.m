@interface SHLShazamKey
+ (SHLShazamKey)keyWithValue:(id)a3;
- (BOOL)isShazamKeyValid:(id)a3;
- (NSString)validatedKey;
- (SHLShazamKey)initWithKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SHLShazamKey

+ (SHLShazamKey)keyWithValue:(id)a3
{
  id v3 = a3;
  v4 = -[SHLShazamKey initWithKey:](objc_alloc(&OBJC_CLASS___SHLShazamKey), "initWithKey:", v3);

  return v4;
}

- (SHLShazamKey)initWithKey:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SHLShazamKey;
  v6 = -[SHLShazamKey init](&v10, "init");
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    if (!-[SHLShazamKey isShazamKeyValid:](v6, "isShazamKeyValid:", v5))
    {
      v8 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong(p_isa + 1, a3);
  }

  v8 = p_isa;
LABEL_6:

  return v8;
}

- (BOOL)isShazamKeyValid:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 invertedSet]);

    if ([v3 rangeOfCharacterFromSet:v5] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v3 longLongValue]));
      BOOL v7 = [v6 unsignedIntegerValue] != (id)-1;
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHLShazamKey allocWithZone:](&OBJC_CLASS___SHLShazamKey, "allocWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamKey validatedKey](self, "validatedKey"));
  id v7 = [v6 copyWithZone:a3];
  v8 = -[SHLShazamKey initWithKey:](v5, "initWithKey:", v7);

  return v8;
}

- (NSString)validatedKey
{
  return self->_validatedKey;
}

- (void).cxx_destruct
{
}

@end