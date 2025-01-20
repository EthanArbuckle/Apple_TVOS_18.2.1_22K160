@interface CountryAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)countryCodes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)setCountryCodes:(id)a3;
@end

@implementation CountryAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CountryAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:]( &v5,  "initForMobileAssetRootKey:withDictionary:",  a3,  a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CountryAsset *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CountryAsset;
  if (!-[EligibilityAsset isEqual:](&v13, "isEqual:", v4)) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_11;
  }

  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](v6, "countryCodes"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[CountryAsset isEqual:]";
        __int16 v16 = 2080;
        v17 = "countryCodes";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }

  else
  {
LABEL_9:
    char v9 = 0;
  }

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAsset countryCodes](self, "countryCodes"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CountryAsset;
  id v4 = -[EligibilityAsset description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Country Asset countryCodes:%@ %@]",  v3,  v5));

  return (NSString *)v6;
}

- (NSSet)countryCodes
{
  return self->countryCodes;
}

- (void)setCountryCodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end