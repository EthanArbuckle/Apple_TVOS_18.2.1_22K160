@interface CountryAndRegionAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)countryCodes;
- (NSSet)regionSKUs;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)setCountryCodes:(id)a3;
- (void)setRegionSKUs:(id)a3;
@end

@implementation CountryAndRegionAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CountryAndRegionAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:]( &v5,  "initForMobileAssetRootKey:withDictionary:",  a3,  a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset countryCodes](self, "countryCodes"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset regionSKUs](self, "regionSKUs"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setRegionSKUs:v9];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset countryCodes](self, "countryCodes"));
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset regionSKUs](self, "regionSKUs"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CountryAndRegionAsset *)a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CountryAndRegionAsset;
  if (-[EligibilityAsset isEqual:](&v18, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v13 = 1;
      goto LABEL_16;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset countryCodes](self, "countryCodes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset countryCodes](v6, "countryCodes"));
      char v9 = sub_1000179E0(v7, v8);

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset regionSKUs](self, "regionSKUs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset regionSKUs](v6, "regionSKUs"));
        char v12 = sub_1000179E0(v10, v11);

        if ((v12 & 1) != 0)
        {
          BOOL v13 = 1;
LABEL_15:

          goto LABEL_16;
        }

        id v16 = sub_10000C968();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[CountryAndRegionAsset isEqual:]";
          __int16 v21 = 2080;
          v22 = "regionSKUs";
          goto LABEL_13;
        }
      }

      else
      {
        id v14 = sub_10000C968();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[CountryAndRegionAsset isEqual:]";
          __int16 v21 = 2080;
          v22 = "countryCodes";
LABEL_13:
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Property %s did not match",  buf,  0x16u);
        }
      }

      BOOL v13 = 0;
      goto LABEL_15;
    }
  }

  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset countryCodes](self, "countryCodes"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndRegionAsset regionSKUs](self, "regionSKUs"));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CountryAndRegionAsset;
  id v5 = -[EligibilityAsset description](&v9, "description");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Country and Region Asset countryCodes:%@ regionSKUs:%@  %@]",  v3,  v4,  v6));

  return (NSString *)v7;
}

- (NSSet)countryCodes
{
  return self->countryCodes;
}

- (void)setCountryCodes:(id)a3
{
}

- (NSSet)regionSKUs
{
  return self->regionSKUs;
}

- (void)setRegionSKUs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end