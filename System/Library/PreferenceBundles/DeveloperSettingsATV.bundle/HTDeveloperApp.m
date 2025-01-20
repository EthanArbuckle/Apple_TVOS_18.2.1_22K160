@interface HTDeveloperApp
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation HTDeveloperApp

- (BOOL)isEqual:(id)a3
{
  v4 = (HTDeveloperApp *)a3;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTDeveloperApp name](self, "name"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HTDeveloperApp name](v6, "name"));
      if ([v7 isEqualToString:v8])
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[HTDeveloperApp bundleID](self, "bundleID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HTDeveloperApp bundleID](v6, "bundleID"));
        unsigned __int8 v11 = [v9 isEqualToString:v10];
      }

      else
      {
        unsigned __int8 v11 = 0;
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HTDeveloperApp name](self, "name"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HTDeveloperApp bundleID](self, "bundleID"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

@end