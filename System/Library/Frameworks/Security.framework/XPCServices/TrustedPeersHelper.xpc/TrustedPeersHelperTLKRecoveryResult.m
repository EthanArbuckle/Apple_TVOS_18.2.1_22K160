@interface TrustedPeersHelperTLKRecoveryResult
+ (BOOL)supportsSecureCoding;
- (NSDictionary)tlkRecoveryErrors;
- (NSSet)successfulKeysRecovered;
- (TrustedPeersHelperTLKRecoveryResult)initWithCoder:(id)a3;
- (TrustedPeersHelperTLKRecoveryResult)initWithSuccessfulKeyUUIDs:(id)a3 totalTLKSharesRecovered:(int64_t)a4 tlkRecoveryErrors:(id)a5;
- (id)description;
- (int64_t)totalTLKSharesRecovered;
- (void)encodeWithCoder:(id)a3;
- (void)setSuccessfulKeysRecovered:(id)a3;
- (void)setTlkRecoveryErrors:(id)a3;
- (void)setTotalTLKSharesRecovered:(int64_t)a3;
@end

@implementation TrustedPeersHelperTLKRecoveryResult

- (TrustedPeersHelperTLKRecoveryResult)initWithSuccessfulKeyUUIDs:(id)a3 totalTLKSharesRecovered:(int64_t)a4 tlkRecoveryErrors:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperTLKRecoveryResult;
  v11 = -[TrustedPeersHelperTLKRecoveryResult init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_successfulKeysRecovered, a3);
    v12->_totalTLKSharesRecovered = a4;
    objc_storeStrong((id *)&v12->_tlkRecoveryErrors, a5);
  }

  return v12;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperTLKRecoveryResult successfulKeysRecovered](self, "successfulKeysRecovered"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TLKRecoveryResult: %@ totalTLKSharesRecovered:%d>",  v3,  -[TrustedPeersHelperTLKRecoveryResult totalTLKSharesRecovered](self, "totalTLKSharesRecovered")));

  return v4;
}

- (TrustedPeersHelperTLKRecoveryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperTLKRecoveryResult;
  v5 = -[TrustedPeersHelperTLKRecoveryResult init](&v14, "init");
  if (v5)
  {
    v15[0] = objc_opt_class(&OBJC_CLASS___NSSet);
    v15[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"keys"]);
    successfulKeysRecovered = v5->_successfulKeysRecovered;
    v5->_successfulKeysRecovered = (NSSet *)v8;

    v5->_totalTLKSharesRecovered = (int64_t)[v4 decodeInt64ForKey:@"totalShares"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorClasses"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"errors"]);
    tlkRecoveryErrors = v5->_tlkRecoveryErrors;
    v5->_tlkRecoveryErrors = (NSDictionary *)v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperTLKRecoveryResult successfulKeysRecovered](self, "successfulKeysRecovered"));
  [v4 encodeObject:v5 forKey:@"keys"];

  objc_msgSend( v4,  "encodeInt64:forKey:",  -[TrustedPeersHelperTLKRecoveryResult totalTLKSharesRecovered](self, "totalTLKSharesRecovered"),  @"totalShares");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperTLKRecoveryResult tlkRecoveryErrors](self, "tlkRecoveryErrors"));
  [v4 encodeObject:v6 forKey:@"errors"];
}

- (NSSet)successfulKeysRecovered
{
  return (NSSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSuccessfulKeysRecovered:(id)a3
{
}

- (int64_t)totalTLKSharesRecovered
{
  return self->_totalTLKSharesRecovered;
}

- (void)setTotalTLKSharesRecovered:(int64_t)a3
{
  self->_totalTLKSharesRecovered = a3;
}

- (NSDictionary)tlkRecoveryErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTlkRecoveryErrors:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end