@interface EscrowUpdateBlobRequest
- (Class)responseClass;
- (EscrowPrerecord)prerecord;
- (EscrowUpdateBlobRequest)initWithRequest:(id)a3;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
- (void)performRequestWithHandler:(id)a3;
- (void)setPrerecord:(id)a3;
@end

@implementation EscrowUpdateBlobRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (EscrowUpdateBlobRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EscrowUpdateBlobRequest;
  v5 = -[EscrowGenericRequest initWithRequest:](&v8, "initWithRequest:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 prerecord]);
    -[EscrowUpdateBlobRequest setPrerecord:](v5, "setPrerecord:", v6);
  }

  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowUpdateBlobResponse, a2);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"/escrowproxy/api/update_blob"]);

  return v3;
}

- (id)command
{
  return @"UPDATE_RECORD";
}

- (id)bodyDictionary
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___EscrowUpdateBlobRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v20, "bodyDictionary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest blob](self, "blob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);
  [v4 setObject:v6 forKeyedSubscript:@"blob"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest blob](self, "blob"));
  id v8 = sub_10000F354(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setObject:v9 forKeyedSubscript:@"blobDigest"];

  if (-[EscrowGenericRequest duplicate](self, "duplicate")) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest duplicateEncodedMetadata](self, "duplicateEncodedMetadata"));
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest encodedMetadata](self, "encodedMetadata"));
  }
  v11 = (void *)v10;
  [v4 setObject:v10 forKeyedSubscript:@"oldMetadata"];

  unsigned int v12 = -[EscrowGenericRequest duplicate](self, "duplicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest metadata](self, "metadata"));
  if (v12)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[EscrowGenericRequest _filteredMetadataForDoubleEnrollment:]( self,  "_filteredMetadataForDoubleEnrollment:",  v13));

    v13 = (void *)v14;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringFromDict]);
  [v4 setObject:v15 forKeyedSubscript:@"newMetadata"];

  uint64_t v17 = CloudServicesLog(v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "EscrowUpdateBlobRequest: bodyDictionary: %@",  buf,  0xCu);
  }

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