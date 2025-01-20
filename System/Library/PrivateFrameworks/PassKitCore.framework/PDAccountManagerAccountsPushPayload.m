@interface PDAccountManagerAccountsPushPayload
- (BOOL)ignoreLastUpdatedDate;
- (NSDictionary)endpointData;
- (NSString)accountIdentifier;
- (PDAccountManagerAccountsPushPayload)initWithDictionary:(id)a3;
- (id)description;
- (id)topUpTokenIdentifier;
- (unint64_t)endpoint;
- (unint64_t)featureIdentifier;
@end

@implementation PDAccountManagerAccountsPushPayload

- (PDAccountManagerAccountsPushPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v34.receiver = self;
    v34.super_class = (Class)&OBJC_CLASS___PDAccountManagerAccountsPushPayload;
    v5 = -[PDAccountManagerAccountsPushPayload init](&v34, "init");
    if (!v5)
    {
LABEL_28:
      self = v5;
      v13 = self;
      goto LABEL_29;
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"accountIdentifier"]);
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"featureIdentifier"]);
    v5->_featureIdentifier = PKFeatureIdentifierFromString(v8);

    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"endpoint"]);
    v10 = v9;
    if (v9 == @"account") {
      goto LABEL_6;
    }
    if (v9)
    {
      unsigned __int8 v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", @"account");

      if ((v11 & 1) != 0)
      {
LABEL_6:
        uint64_t v12 = 1LL;
LABEL_27:

        v5->_endpoint = v12;
        v32 = (void *)objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"endpointData"]);
        v5->_endpointData = (NSDictionary *)(id)PKDictionaryFromJSONString();

        goto LABEL_28;
      }

      v14 = v10;
      if (v14 == @"financingPlans"
        || (v15 = v14,
            unsigned __int8 v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", @"financingPlans"),
            v15,
            (v16 & 1) != 0))
      {
        uint64_t v12 = 2LL;
        goto LABEL_27;
      }

      v17 = v15;
      if (v17 == @"fundingSources"
        || (v18 = v17,
            unsigned __int8 v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", @"fundingSources"),
            v18,
            (v19 & 1) != 0))
      {
        uint64_t v12 = 3LL;
        goto LABEL_27;
      }

      v20 = v18;
      if (v20 == @"transfers"
        || (v21 = v20,
            unsigned __int8 v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", @"transfers"),
            v21,
            (v22 & 1) != 0))
      {
        uint64_t v12 = 4LL;
        goto LABEL_27;
      }

      v23 = v21;
      if (v23 == @"cloudStoreZones"
        || (v24 = v23,
            unsigned __int8 v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", @"cloudStoreZones"),
            v24,
            (v25 & 1) != 0))
      {
        uint64_t v12 = 5LL;
        goto LABEL_27;
      }

      v26 = v24;
      if (v26 == @"resetBalances"
        || (v27 = v26,
            unsigned __int8 v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", @"resetBalances"),
            v27,
            (v28 & 1) != 0))
      {
        uint64_t v12 = 6LL;
        goto LABEL_27;
      }

      v29 = v27;
      if (v29 == @"invalidateTopUpToken"
        || (v30 = v29,
            unsigned int v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", @"invalidateTopUpToken"),
            v30,
            v31))
      {
        uint64_t v12 = 7LL;
        goto LABEL_27;
      }
    }

    uint64_t v12 = 0LL;
    goto LABEL_27;
  }

  v13 = 0LL;
LABEL_29:

  return v13;
}

- (BOOL)ignoreLastUpdatedDate
{
  return -[NSDictionary PKBoolForKey:]( self->_endpointData,  "PKBoolForKey:",  @"ignoreLastUpdatedDate");
}

- (id)topUpTokenIdentifier
{
  return -[NSDictionary PKStringForKey:](self->_endpointData, "PKStringForKey:", @"tokenIdentifier");
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  uint64_t v5 = PKFeatureIdentifierToString(self->_featureIdentifier);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 appendFormat:@"featureIdentifier: '%@'; ", v6];

  unint64_t endpoint = self->_endpoint;
  else {
    v8 = off_10064EDA8[endpoint];
  }
  [v4 appendFormat:@"endpoint: '%@'; ", v8];
  [v4 appendFormat:@">"];
  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (NSDictionary)endpointData
{
  return self->_endpointData;
}

- (void).cxx_destruct
{
}

@end