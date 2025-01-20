@interface CountryAndGracePeriodAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)countryCodes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)gracePeriodInSeconds;
- (unint64_t)hash;
- (void)setCountryCodes:(id)a3;
- (void)setGracePeriodInSeconds:(unint64_t)a3;
@end

@implementation CountryAndGracePeriodAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CountryAndGracePeriodAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:]( &v5,  "initForMobileAssetRootKey:withDictionary:",  a3,  a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndGracePeriodAsset countryCodes](self, "countryCodes"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  objc_msgSend( v5,  "setGracePeriodInSeconds:",  -[CountryAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds"));
  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndGracePeriodAsset countryCodes](self, "countryCodes"));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = -[CountryAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CountryAndGracePeriodAsset *)a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CountryAndGracePeriodAsset;
  if (-[EligibilityAsset isEqual:](&v16, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v11 = 1;
      goto LABEL_16;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndGracePeriodAsset countryCodes](self, "countryCodes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndGracePeriodAsset countryCodes](v6, "countryCodes"));
      char v9 = sub_1000179E0(v7, v8);

      if ((v9 & 1) != 0)
      {
        id v10 = -[CountryAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds");
        if (v10 == (id)-[CountryAndGracePeriodAsset gracePeriodInSeconds](v6, "gracePeriodInSeconds"))
        {
          BOOL v11 = 1;
LABEL_15:

          goto LABEL_16;
        }

        id v14 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[CountryAndGracePeriodAsset isEqual:]";
          __int16 v19 = 2080;
          v20 = "gracePeriodInSeconds";
          goto LABEL_13;
        }
      }

      else
      {
        id v12 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[CountryAndGracePeriodAsset isEqual:]";
          __int16 v19 = 2080;
          v20 = "countryCodes";
LABEL_13:
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Property %s did not match",  buf,  0x16u);
        }
      }

      BOOL v11 = 0;
      goto LABEL_15;
    }
  }

  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CountryAndGracePeriodAsset countryCodes](self, "countryCodes"));
  unint64_t v4 = -[CountryAndGracePeriodAsset gracePeriodInSeconds](self, "gracePeriodInSeconds");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CountryAndGracePeriodAsset;
  id v5 = -[EligibilityAsset description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Country and Grace Period Asset countryCodes:%@ gracePeriod:%lu %@]",  v3,  v4,  v6));

  return (NSString *)v7;
}

- (NSSet)countryCodes
{
  return self->countryCodes;
}

- (void)setCountryCodes:(id)a3
{
}

- (unint64_t)gracePeriodInSeconds
{
  return self->gracePeriodInSeconds;
}

- (void)setGracePeriodInSeconds:(unint64_t)a3
{
  self->gracePeriodInSeconds = a3;
}

- (void).cxx_destruct
{
}

@end