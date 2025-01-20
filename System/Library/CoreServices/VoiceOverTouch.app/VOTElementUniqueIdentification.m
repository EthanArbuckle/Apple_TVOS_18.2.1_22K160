@interface VOTElementUniqueIdentification
+ (id)identificationFromElement:(id)a3;
+ (id)identificationFromKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)hashKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setHashKey:(id)a3;
@end

@implementation VOTElementUniqueIdentification

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [objc_allocWithZone((Class)VOTElementUniqueIdentification) init];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementUniqueIdentification hashKey](self, "hashKey"));
  [v4 setHashKey:v5];

  return v4;
}

+ (id)identificationFromKey:(id)a3
{
  id v3 = a3;
  id v4 = [objc_allocWithZone((Class)VOTElementUniqueIdentification) init];
  [v4 setHashKey:v3];

  return v4;
}

+ (id)identificationFromElement:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  unsigned __int8 v5 = [v3 isApplication];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringWithAXAttribute:2001]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"|" withString:&stru_10017A920]);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stringWithAXAttribute:2031]);
    [v4 rectWithAXAttribute:2003];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 numberWithAXAttribute:2004]);
    id v15 = [v14 unsignedLongLongValue];

    uint64_t v16 = _AXTraitsRemoveTrait(v15, kAXInactiveTrait | kAXSelectedTrait);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 stringWithAXAttribute:2041]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16));
    v27.width = v11;
    v27.height = v13;
    v19 = NSStringFromSize(v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@|%@|%@|%@",  v6,  v8,  v18,  v17,  v20,  v9));

    v22 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
    LODWORD(v18) = [v22 isSystemApp];

    if ((_DWORD)v18)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
      if ([v23 length])
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v21 stringByAppendingFormat:@"|%@", v23]);

        v21 = (void *)v24;
      }
    }

    v6 = v21;
  }

  id v25 = [objc_allocWithZone((Class)VOTElementUniqueIdentification) init];
  [v25 setHashKey:v6];

  return v25;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementUniqueIdentification hashKey](self, "hashKey"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTElementUniqueIdentification;
  id v3 = -[VOTElementUniqueIdentification description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementUniqueIdentification hashKey](self, "hashKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v4, v5));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class(&OBJC_CLASS___VOTElementUniqueIdentification, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 hashKey]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementUniqueIdentification hashKey](self, "hashKey"));
    unsigned __int8 v9 = [v8 isEqualToString:v7];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)hashKey
{
  return self->hashKey;
}

- (void)setHashKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end