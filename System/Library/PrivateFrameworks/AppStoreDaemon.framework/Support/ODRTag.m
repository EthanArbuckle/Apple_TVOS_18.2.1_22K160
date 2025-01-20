@interface ODRTag
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
@end

@implementation ODRTag

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___ODRTagEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"always_preserved";
  v3[1] = @"bundle_id";
  v3[2] = @"bundle_key";
  v3[3] = @"name";
  v3[4] = @"preservation_priority";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  5LL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ODRTag, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = sub_10023AC00(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = sub_10023AC00(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([v9 isEqualToString:v11])
    {
      id v12 = sub_10023AC24(self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v14 = sub_10023AC24(v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if ([v13 isEqualToString:v15])
      {
        id v16 = sub_10023AC88(self);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        id v18 = sub_10023AC88(v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        unsigned __int8 v20 = [v17 isEqualToString:v19];
      }

      else
      {
        unsigned __int8 v20 = 0;
      }
    }

    else
    {
      unsigned __int8 v20 = 0;
    }
  }

  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

@end