@interface NSPPrivateAccessTokenChallenge
+ (id)challengeAttributeName;
+ (id)httpAuthenticationScheme;
+ (id)originNameKeyAttributeName;
+ (id)tokenKeyAttributeName;
- (BOOL)isSupportedTokenType;
- (BOOL)typeHasAllowedOriginList;
- (BOOL)typeRequiresOriginName;
- (BOOL)typeRequiresRedemptionNonce;
- (NSArray)originNames;
- (NSData)challengeData;
- (NSData)redemptionNonce;
- (NSPPrivateAccessTokenChallenge)initWithData:(id)a3;
- (NSString)issuerName;
- (NSString)originName;
- (id)initRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5;
- (id)initRateLimitedRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5;
- (unsigned)tokenType;
@end

@implementation NSPPrivateAccessTokenChallenge

+ (id)httpAuthenticationScheme
{
  return @"PrivateToken";
}

+ (id)challengeAttributeName
{
  return @"challenge";
}

+ (id)tokenKeyAttributeName
{
  return @"token-key";
}

+ (id)originNameKeyAttributeName
{
  return @"issuer-encap-key";
}

- (NSPPrivateAccessTokenChallenge)initWithData:(id)a3
{
  id v4 = a3;
  v7 = v4;
  if (!v4)
  {
    uint64_t v79 = nplog_obj(0LL, v5, v6);
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v115[0] = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v81 = "%s called with null data";
      goto LABEL_83;
    }

- (id)initRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  uint64_t v5 = self;
  if (a3)
  {
    uint64_t v5 = (NSPPrivateAccessTokenChallenge *)sub_1000AAE68(self, 2u, a3, a4, a5);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v8 = nplog_obj(self, a2, 0LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[NSPPrivateAccessTokenChallenge initRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null issuerName",  (uint8_t *)&v10,  0xCu);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)initRateLimitedRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = v10;
  if (!v8)
  {
    uint64_t v18 = nplog_obj(v10, v11, v12);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      int v23 = 136315138;
      uint64_t v24 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v20 = "%s called with null issuerName";
      goto LABEL_13;
    }

- (BOOL)isSupportedTokenType
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 2
      || -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeRequiresOriginName
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeRequiresRedemptionNonce
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeHasAllowedOriginList
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 2;
}

- (NSData)challengeData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (unsigned)tokenType
{
  return self->_tokenType;
}

- (NSString)issuerName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSData)redemptionNonce
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)originName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSArray)originNames
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end