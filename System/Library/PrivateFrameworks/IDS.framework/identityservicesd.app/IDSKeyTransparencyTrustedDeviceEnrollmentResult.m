@interface IDSKeyTransparencyTrustedDeviceEnrollmentResult
- (IDSKeyTransparencyTrustedDeviceEnrollmentResult)initWithEligibleServiceIdentifiers:(id)a3 signatures:(id)a4;
- (IDSProtoKeyTransparencyTrustedServiceSignatures)signatures;
- (NSArray)eligibleServiceIdentifiers;
- (id)description;
@end

@implementation IDSKeyTransparencyTrustedDeviceEnrollmentResult

- (IDSKeyTransparencyTrustedDeviceEnrollmentResult)initWithEligibleServiceIdentifiers:(id)a3 signatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSKeyTransparencyTrustedDeviceEnrollmentResult;
  v8 = -[IDSKeyTransparencyTrustedDeviceEnrollmentResult init](&v12, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    eligibleServiceIdentifiers = v8->_eligibleServiceIdentifiers;
    v8->_eligibleServiceIdentifiers = v9;

    objc_storeStrong((id *)&v8->_signatures, a4);
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyTrustedDeviceEnrollmentResult eligibleServiceIdentifiers]( self,  "eligibleServiceIdentifiers"));
  id v5 = [v4 count];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyTrustedDeviceEnrollmentResult signatures](self, "signatures"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceSignatures]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p eligibleServiceIdentifiers.count: %lu, serviceSignatures.count: %lu>",  v3,  self,  v5,  [v7 count]));

  return v8;
}

- (NSArray)eligibleServiceIdentifiers
{
  return self->_eligibleServiceIdentifiers;
}

- (IDSProtoKeyTransparencyTrustedServiceSignatures)signatures
{
  return self->_signatures;
}

- (void).cxx_destruct
{
}

@end