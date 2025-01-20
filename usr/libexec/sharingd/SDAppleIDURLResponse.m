@interface SDAppleIDURLResponse
- (NSDictionary)responseInfo;
- (SDAppleIDURLResponse)initWithHTTPUTLResponse:(id)a3 data:(id)a4;
- (int64_t)statusCode;
@end

@implementation SDAppleIDURLResponse

- (SDAppleIDURLResponse)initWithHTTPUTLResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SDAppleIDURLResponse;
  v8 = -[SDAppleIDURLResponse init](&v18, "init");
  if (v8)
  {
    v8->_statusCode = (int64_t)[v6 statusCode];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 MIMEType]);
    unsigned int v10 = [v9 hasPrefix:@"application/json"];

    if (v10)
    {
      id v17 = 0LL;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v17));
      id v13 = v17;
      if (v11)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
        if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
        {
          objc_storeStrong((id *)&v8->_responseInfo, v11);
        }

        else if (dword_100642B98 <= 60 {
               && (dword_100642B98 != -1 || _LogCategory_Initialize(&dword_100642B98, 60LL)))
        }
        {
          LogPrintF( &dword_100642B98,  "-[SDAppleIDURLResponse initWithHTTPUTLResponse:data:]",  60LL,  "### JSON object not a dictionary\n");
        }
      }

      else
      {
        if (dword_100642B98 <= 60
          && (dword_100642B98 != -1 || _LogCategory_Initialize(&dword_100642B98, 60LL)))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
          LogPrintF( &dword_100642B98,  "-[SDAppleIDURLResponse initWithHTTPUTLResponse:data:]",  60LL,  "### JSON -> Data failed with error %@\n",  v16);
        }

        v11 = 0LL;
      }
    }

    else
    {
      v11 = 0LL;
      id v13 = 0LL;
    }
  }

  return v8;
}

- (NSDictionary)responseInfo
{
  return self->_responseInfo;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
}

@end