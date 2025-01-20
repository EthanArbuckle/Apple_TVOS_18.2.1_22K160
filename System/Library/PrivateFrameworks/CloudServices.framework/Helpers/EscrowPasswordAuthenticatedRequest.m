@interface EscrowPasswordAuthenticatedRequest
- (id)authorizationHeader;
- (id)validateInput;
@end

@implementation EscrowPasswordAuthenticatedRequest

- (id)validateInput
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___EscrowPasswordAuthenticatedRequest;
  id v3 = -[EscrowGenericRequest validateInput](&v16, "validateInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest appleID](self, "appleID"));
    if ([v5 length])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest iCloudPassword](self, "iCloudPassword"));
      id v7 = [v6 length];

      if (v7) {
        return 0LL;
      }
    }

    else
    {
    }

    uint64_t v10 = CloudServicesLog(v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest appleID](self, "appleID"));
      if ([v12 length]) {
        v13 = @"Yes";
      }
      else {
        v13 = @"No";
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest iCloudPassword](self, "iCloudPassword"));
      if ([v14 length]) {
        v15 = @"Yes";
      }
      else {
        v15 = @"No";
      }
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Missing required parameters AppleID: %@\n%@iCloud password:",  buf,  0x16u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing required parameters"));
  }

  return v4;
}

- (id)authorizationHeader
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest appleID](self, "appleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest iCloudPassword](self, "iCloudPassword"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[EscrowGenericRequest authorizationHeaderWithUser:password:authType:]( self,  "authorizationHeaderWithUser:password:authType:",  v3,  v4,  @"Basic"));

  return v5;
}

@end