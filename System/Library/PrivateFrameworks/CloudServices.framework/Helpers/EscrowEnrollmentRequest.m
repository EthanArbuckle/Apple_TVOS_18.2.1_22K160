@interface EscrowEnrollmentRequest
- (Class)responseClass;
- (EscrowEnrollmentRequest)initWithRequest:(id)a3;
- (EscrowPrerecord)prerecord;
- (id)bodyDictionary;
- (id)command;
- (id)validateInput;
- (void)performRequestWithHandler:(id)a3;
- (void)setPrerecord:(id)a3;
@end

@implementation EscrowEnrollmentRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (EscrowEnrollmentRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EscrowEnrollmentRequest;
  v5 = -[EscrowGenericRequest initWithRequest:](&v8, "initWithRequest:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 prerecord]);
    -[EscrowEnrollmentRequest setPrerecord:](v5, "setPrerecord:", v6);
  }

  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowEnrollmentResponse, a2);
}

- (id)command
{
  return @"ENROLL";
}

- (id)validateInput
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___EscrowEnrollmentRequest;
  id v4 = -[EscrowPasswordAuthenticatedRequest validateInput](&v16, "validateInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5) {
    return v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowEnrollmentRequest prerecord](self, "prerecord"));
  if (!v6)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recoveryPassphrase](self, "recoveryPassphrase"));
    if (![v2 length]
      || (uint64_t v7 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest escrowRecord](self, "escrowRecord"))) == 0)
    {

      goto LABEL_11;
    }

    v5 = (void *)v7;
  }

  if (-[EscrowGenericRequest stingray](self, "stingray") || -[EscrowGenericRequest iCDP](self, "iCDP"))
  {
    if (v6)
    {
      v5 = 0LL;
    }

    else
    {

      v5 = 0LL;
      v6 = v2;
    }

- (id)bodyDictionary
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___EscrowEnrollmentRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v23, "bodyDictionary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest phoneNumber](self, "phoneNumber"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest phoneNumber](self, "phoneNumber"));
    [v4 setObject:v6 forKeyedSubscript:@"phoneNumber"];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryCode](self, "countryCode"));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryCode](self, "countryCode"));
    [v4 setObject:v8 forKeyedSubscript:@"countryISOCode"];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryDialCode](self, "countryDialCode"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest countryDialCode](self, "countryDialCode"));
    [v4 setObject:v10 forKeyedSubscript:@"countryDialCode"];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));
    [v4 setObject:v12 forKeyedSubscript:@"dsid"];
  }

  unsigned int v13 = -[EscrowGenericRequest duplicate](self, "duplicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest metadata](self, "metadata"));
  if (v13)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[EscrowGenericRequest _filteredMetadataForDoubleEnrollment:]( self,  "_filteredMetadataForDoubleEnrollment:",  v14));

    v14 = (void *)v15;
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v14 base64EncodedStringFromDict]);
  [v4 setObject:v16 forKeyedSubscript:@"metadata"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest blob](self, "blob"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 base64EncodedStringWithOptions:0]);
  [v4 setObject:v18 forKeyedSubscript:@"blob"];

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest blob](self, "blob"));
  id v20 = sub_10000F354(v19);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v4 setObject:v21 forKeyedSubscript:@"blobDigest"];

  return v4;
}

- (EscrowPrerecord)prerecord
{
  return self->_prerecord;
}

- (void)setPrerecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end