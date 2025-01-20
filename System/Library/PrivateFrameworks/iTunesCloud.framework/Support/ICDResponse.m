@interface ICDResponse
+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7;
+ (id)responseWithResponse:(id)a3;
- (ICDResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7;
- (NSData)responseData;
- (NSDictionary)responseHeaderFields;
- (NSError)error;
- (NSString)MIMEType;
- (NSURL)responseDataFileURL;
- (id)description;
- (unint64_t)responseCode;
- (void)setResponseDataFileURL:(id)a3;
@end

@implementation ICDResponse

- (ICDResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ICDResponse;
  v16 = -[ICDResponse init](&v25, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_error, a7);
    v18 = (NSString *)[v14 copy];
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = v18;

    v17->_responseCode = a3;
    v20 = (NSData *)[v13 copy];
    responseData = v17->_responseData;
    v17->_responseData = v20;

    v22 = (NSDictionary *)[v12 copy];
    responseHeaderFields = v17->_responseHeaderFields;
    v17->_responseHeaderFields = v22;
  }

  return v17;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ICDResponse;
  id v3 = -[ICDResponse description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingFormat:@" [%ld]: %ld bytes (%@)\n%@", self->_responseCode, -[NSData length](self->_responseData, "length"), self->_MIMEType, self->_responseHeaderFields]);

  return v5;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (unint64_t)responseCode
{
  return self->_responseCode;
}

- (NSDictionary)responseHeaderFields
{
  return self->_responseHeaderFields;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSURL)responseDataFileURL
{
  return self->_responseDataFileURL;
}

- (void)setResponseDataFileURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v17 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v16)),  "initWithCode:headerFields:data:MIMEType:error:",  a3,  v15,  v14,  v13,  v12);

  return v17;
}

+ (id)responseWithResponse:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc((Class)objc_opt_class(a1, v5));
  id v7 = [v4 responseCode];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 responseHeaderFields]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 responseData]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 MIMEType]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  id v12 = [v6 initWithCode:v7 headerFields:v8 data:v9 MIMEType:v10 error:v11];
  return v12;
}

@end