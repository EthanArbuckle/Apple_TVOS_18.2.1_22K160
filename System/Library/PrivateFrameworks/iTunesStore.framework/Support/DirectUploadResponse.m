@interface DirectUploadResponse
- (DirectUploadResponse)initWithURLResponse:(id)a3 data:(id)a4;
- (NSError)error;
- (NSString)assetToken;
- (NSString)assetTokenType;
- (int64_t)countOfBytesSent;
- (void)setCountOfBytesSent:(int64_t)a3;
@end

@implementation DirectUploadResponse

- (DirectUploadResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___DirectUploadResponse;
  v8 = -[DirectUploadResponse init](&v52, "init");
  if (v8)
  {
    uint64_t v9 = (uint64_t)[v6 statusCode];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSVURLProtocolConsumer consumer](&OBJC_CLASS___SSVURLProtocolConsumer, "consumer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForData:v7 response:v6 error:0]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      id v49 = (id)v9;
      id v13 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"responses"]);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
      v51 = v14;
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        {
          id v18 = v16;

          id v13 = v18;
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"token"]);
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
        v21 = (NSString *)[v19 copy];
      }
      else {
        v21 = 0LL;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"tokenType"]);

      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
      v26 = v11;
      v27 = v10;
      if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
        id obj = [v24 copy];
      }
      else {
        id obj = 0LL;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"statusCode"]);

      v29 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"localizedMessage"]);
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0) {
        id v22 = [v29 copy];
      }
      else {
        id v22 = 0LL;
      }
      v10 = v27;
      v11 = v26;

      if (v21)
      {
        assetToken = v8->_assetToken;
        v8->_assetToken = v21;
        v32 = v21;

        v23 = obj;
        objc_storeStrong((id *)&v8->_assetTokenType, obj);
LABEL_27:

        goto LABEL_28;
      }

      uint64_t v9 = (uint64_t)v49;
      v23 = obj;
    }

    else
    {
      id v22 = 0LL;
      v23 = 0LL;
    }

    if (v9 == 403)
    {
      uint64_t v33 = SSError(SSErrorDomain, 139LL, v22, 0LL);
      v32 = (NSError *)objc_claimAutoreleasedReturnValue(v33);
      uint64_t v34 = SSErrorHTTPStatusCodeKey;
      v35 = v23;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 403LL));
      uint64_t v37 = SSErrorBySettingUserInfoValue(v32, v34, v36);
      uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
      error = v8->_error;
      v8->_error = (NSError *)v38;

      v23 = v35;
    }

    else
    {
      uint64_t v40 = SSError(SSErrorDomain, 3LL, v22, 0LL);
      v41 = (NSError *)objc_claimAutoreleasedReturnValue(v40);
      if (v9 >= 400)
      {
        uint64_t v42 = SSErrorHTTPStatusCodeKey;
        uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
        v44 = v23;
        v45 = (void *)v43;
        uint64_t v46 = SSErrorBySettingUserInfoValue(v41, v42, v43);
        uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);

        v23 = v44;
        v41 = (NSError *)v47;
      }

      v32 = v8->_error;
      v8->_error = v41;
    }

    goto LABEL_27;
  }

- (NSString)assetToken
{
  return self->_assetToken;
}

- (NSString)assetTokenType
{
  return self->_assetTokenType;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end