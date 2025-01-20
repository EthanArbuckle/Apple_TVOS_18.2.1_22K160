@interface BillingRegionAndLocationAsset
- (BOOL)isEqual:(id)a3;
- (NSSet)billingCountryCodes;
- (NSSet)countryCodes;
- (NSSet)regionSKUs;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)setBillingCountryCodes:(id)a3;
- (void)setCountryCodes:(id)a3;
- (void)setRegionSKUs:(id)a3;
@end

@implementation BillingRegionAndLocationAsset

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BillingRegionAndLocationAsset;
  return -[EligibilityAsset initForMobileAssetRootKey:withDictionary:]( &v5,  "initForMobileAssetRootKey:withDictionary:",  a3,  a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setBillingCountryCodes:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setRegionSKUs:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
  id v11 = [v10 copyWithZone:a3];
  [v5 setCountryCodes:v11];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (BillingRegionAndLocationAsset *)a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___BillingRegionAndLocationAsset;
  if (-[EligibilityAsset isEqual:](&v22, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v16 = 1;
      goto LABEL_19;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](v6, "billingCountryCodes"));
      char v9 = sub_1000179E0(v7, v8);

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](v6, "regionSKUs"));
        char v12 = sub_1000179E0(v10, v11);

        if ((v12 & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](v6, "countryCodes"));
          char v15 = sub_1000179E0(v13, v14);

          if ((v15 & 1) != 0)
          {
            BOOL v16 = 1;
LABEL_18:

            goto LABEL_19;
          }

          id v20 = sub_10000C968();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v24 = "-[BillingRegionAndLocationAsset isEqual:]";
            __int16 v25 = 2080;
            v26 = "countryCodes";
            goto LABEL_16;
          }

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset billingCountryCodes](self, "billingCountryCodes"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset regionSKUs](self, "regionSKUs"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BillingRegionAndLocationAsset countryCodes](self, "countryCodes"));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BillingRegionAndLocationAsset;
  id v6 = -[EligibilityAsset description](&v10, "description");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Billing, Region, and Locatoin Asset billingCountryCodes:%@ regionSKUs:%@ countryCodes:%@ %@]",  v3,  v4,  v5,  v7));

  return (NSString *)v8;
}

- (NSSet)billingCountryCodes
{
  return self->billingCountryCodes;
}

- (void)setBillingCountryCodes:(id)a3
{
}

- (NSSet)regionSKUs
{
  return self->regionSKUs;
}

- (void)setRegionSKUs:(id)a3
{
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