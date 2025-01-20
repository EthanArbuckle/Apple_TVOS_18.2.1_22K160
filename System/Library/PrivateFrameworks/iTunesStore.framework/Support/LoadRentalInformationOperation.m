@interface LoadRentalInformationOperation
- (LoadRentalInformationOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (NSDictionary)rentalInformation;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setRentalKeyIdentifier:(id)a3;
@end

@implementation LoadRentalInformationOperation

- (LoadRentalInformationOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LoadRentalInformationOperation;
  v8 = -[LoadRentalInformationOperation init](&v14, "init");
  if (v8)
  {
    v9 = (NSNumber *)[v6 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = v9;

    v11 = (NSNumber *)[v7 copy];
    rentalKeyIdentifier = v8->_rentalKeyIdentifier;
    v8->_rentalKeyIdentifier = v11;
  }

  return v8;
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadRentalInformationOperation rentalKeyIdentifier](self, "rentalKeyIdentifier"));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoadRentalInformationOperation accountIdentifier](self, "accountIdentifier"));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[LoadRentalInformationOperation accountIdentifier](self, "accountIdentifier"));
      id v7 = [v6 unsignedLongLongValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadRentalInformationOperation rentalKeyIdentifier](self, "rentalKeyIdentifier"));
      v9 = sub_100022CFC((uint64_t)v7, (uint64_t)[v8 unsignedLongLongValue]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      if (v10)
      {
        id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)[v10 rentalStartTime]));
        uint64_t v12 = sub_10001F7A0();
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        [v27 setObject:v11 forKey:v13];

        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v10 rentalDuration]));
        uint64_t v15 = sub_10001F770();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v27 setObject:v14 forKey:v16];

        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v10 playbackDuration]));
        uint64_t v18 = sub_10001F780();
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        [v27 setObject:v17 forKey:v19];

        if ([v10 playbackStartTime] != -1)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)[v10 playbackStartTime]));
          uint64_t v21 = sub_10001F790();
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          [v27 setObject:v20 forKey:v22];
        }

        -[LoadRentalInformationOperation setSuccess:](self, "setSuccess:", 1LL);
      }

      else
      {
        -[LoadRentalInformationOperation setSuccess:](self, "setSuccess:", 0LL);
        uint64_t v23 = SSError(SSErrorDomain, 15LL, 0LL, 0LL);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        -[LoadRentalInformationOperation setError:](self, "setError:", v24);

        id v27 = 0LL;
      }

      v3 = v27;
    }

    else
    {
      v3 = 0LL;
    }
  }

  id v28 = v3;
  v25 = (NSDictionary *)[v3 copy];
  rentalInformation = self->_rentalInformation;
  self->_rentalInformation = v25;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)rentalKeyIdentifier
{
  return self->_rentalKeyIdentifier;
}

- (void)setRentalKeyIdentifier:(id)a3
{
}

- (NSDictionary)rentalInformation
{
  return self->_rentalInformation;
}

- (void).cxx_destruct
{
}

@end