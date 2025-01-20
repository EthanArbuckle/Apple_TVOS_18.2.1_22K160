@interface IDSValidationSigningResult
- (IDSBAASignerContext)baaSignerContext;
- (IDSBAASigningResult)baaResult;
- (IDSValidationSigningResult)initWithAbsintheResultData:(id)a3 absintheServerKey:(id)a4 absintheError:(id)a5 baaResult:(id)a6;
- (IDSValidationSigningResult)initWithBaaResult:(id)a3;
- (NSData)absintheResultData;
- (NSData)absintheServerKey;
- (NSError)absintheError;
@end

@implementation IDSValidationSigningResult

- (IDSValidationSigningResult)initWithAbsintheResultData:(id)a3 absintheServerKey:(id)a4 absintheError:(id)a5 baaResult:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSValidationSigningResult;
  v15 = -[IDSValidationSigningResult init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_absintheResultData, a3);
    objc_storeStrong((id *)&v16->_absintheServerKey, a4);
    objc_storeStrong((id *)&v16->_absintheError, a5);
    objc_storeStrong((id *)&v16->_baaResult, a6);
  }

  return v16;
}

- (IDSValidationSigningResult)initWithBaaResult:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSValidationSigningResult;
  v6 = -[IDSValidationSigningResult init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    absintheResultData = v6->_absintheResultData;
    v6->_absintheResultData = 0LL;

    absintheServerKey = v7->_absintheServerKey;
    v7->_absintheServerKey = 0LL;

    absintheError = v7->_absintheError;
    v7->_absintheError = 0LL;

    objc_storeStrong((id *)&v7->_baaResult, a3);
  }

  return v7;
}

- (NSData)absintheResultData
{
  return self->_absintheResultData;
}

- (NSData)absintheServerKey
{
  return self->_absintheServerKey;
}

- (NSError)absintheError
{
  return self->_absintheError;
}

- (IDSBAASigningResult)baaResult
{
  return self->_baaResult;
}

- (IDSBAASignerContext)baaSignerContext
{
  return self->_baaSignerContext;
}

- (void).cxx_destruct
{
}

  ;
}

@end