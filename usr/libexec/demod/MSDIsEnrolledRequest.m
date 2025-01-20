@interface MSDIsEnrolledRequest
- (Class)getResponseClass;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
@end

@implementation MSDIsEnrolledRequest

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDIsEnrolledResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MSDIsEnrolledRequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v25, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (v10)
  {
    v14 = 0LL;
    v11 = 0LL;
    id v12 = v6;
  }

  else
  {
    id v24 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCommandServerRequest getDataDictFromPayload:error:]( self,  "getDataDictFromPayload:error:",  v7,  &v24));
    id v12 = v24;

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Result"]);
      if (v14)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          if ([v14 BOOLValue])
          {
            id v16 = sub_10003A95C();
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              sub_10009F740(v17);
            }
          }

          objc_msgSend(v9, "setIsEnrolled:", objc_msgSend(v14, "BOOLValue"));
          goto LABEL_10;
        }
      }

      id v19 = sub_10003A95C();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10009F694(self, (uint64_t)v11, v20);
      }
    }

    else
    {
      v14 = 0LL;
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v21)
  {
    id v23 = v12;
    sub_100087610(&v23, 3727744512LL, (uint64_t)@"Unexpected server response.");
    id v22 = v23;

    [v9 setError:v22];
    id v12 = v22;
  }

@end