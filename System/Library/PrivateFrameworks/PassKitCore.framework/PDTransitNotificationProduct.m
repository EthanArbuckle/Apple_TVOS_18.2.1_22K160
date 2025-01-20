@interface PDTransitNotificationProduct
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)transitNetworkIdentifier;
- (PKPaymentMarket)transitMarket;
- (int64_t)credentialType;
- (unint64_t)hash;
- (void)setCredentialType:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setTransitMarket:(id)a3;
- (void)setTransitNetworkIdentifier:(id)a3;
@end

@implementation PDTransitNotificationProduct

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    v7 = v4;
  }
  else {
    v7 = 0LL;
  }
  id v8 = v7;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDTransitNotificationProduct transitMarket](self, "transitMarket"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 transitMarket]);
    if (PKEqualObjects(v9, v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDTransitNotificationProduct displayName](self, "displayName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 transitMarket]);
      if (PKEqualObjects(v11, v12)
        && (id v13 = -[PDTransitNotificationProduct credentialType](self, "credentialType"),
            v13 == [v8 credentialType]))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDTransitNotificationProduct transitNetworkIdentifier](self, "transitNetworkIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 transitNetworkIdentifier]);
        char v16 = PKEqualObjects(v14, v15);
      }

      else
      {
        char v16 = 0;
      }
    }

    else
    {
      char v16 = 0;
    }
  }

  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v3 safelyAddObject:self->_transitMarket];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_transitNetworkIdentifier];
  uint64_t v4 = PKCombinedHash(PKHashStartingValue, v3);
  unint64_t v5 = PKIntegerHash(v4, self->_credentialType);

  return v5;
}

- (PKPaymentMarket)transitMarket
{
  return (PKPaymentMarket *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTransitMarket:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (NSString)transitNetworkIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTransitNetworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end