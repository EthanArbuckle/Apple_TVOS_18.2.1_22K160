@interface TransparencyIDSRegistrationData
- (id)metricsTimeToCreate;
- (id)validateSignature:(id)a3 withPublicKey:(id)a4;
@end

@implementation TransparencyIDSRegistrationData

- (id)validateSignature:(id)a3 withPublicKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData publicKey](self, "publicKey"));

  if (v8)
  {

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData publicKey](self, "publicKey"));
    unsigned int v10 = [v7 isEqual:v9];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData tbsKTIDSRegistrationData](self, "tbsKTIDSRegistrationData"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData signature](self, "signature"));
      unsigned int v13 = [v6 verifyData:v11 signature:v12 accountPublicKeyInfo:v7 error:0];

      if (v13) {
        v14 = 0LL;
      }
      else {
        v14 = @"signatureIncorrect";
      }
    }

    else
    {
      v14 = @"publicKeyMismatch";
    }
  }

  else
  {
    v14 = @"notSignedYet-publicKey";
  }

  return (id)v14;
}

- (id)metricsTimeToCreate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData createdAt](self, "createdAt"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData signedAt](self, "signedAt"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData signedAt](self, "signedAt"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData createdAt](self, "createdAt"));
    }

    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSRegistrationData createdAt](self, "createdAt"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }

    id v7 = (void *)v6;
    [v5 timeIntervalSinceDate:v6];
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  return v3;
}

@end