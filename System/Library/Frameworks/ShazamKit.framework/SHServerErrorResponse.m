@interface SHServerErrorResponse
- (NSDictionary)errorDictionary;
- (NSError)error;
- (SHServerErrorResponse)initWithErrorDictionary:(id)a3;
- (int64_t)errorCodeForResponseCode:(id)a3;
- (void)setErrorDictionary:(id)a3;
@end

@implementation SHServerErrorResponse

- (SHServerErrorResponse)initWithErrorDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHServerErrorResponse;
  v6 = -[SHServerErrorResponse init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_errorDictionary, a3);
  }

  return v7;
}

- (NSError)error
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse errorDictionary](self, "errorDictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"detail"]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse errorDictionary](self, "errorDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"detail"]);
    [v3 setValue:v7 forKey:NSLocalizedDescriptionKey];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse errorDictionary](self, "errorDictionary"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"code"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  -[SHServerErrorResponse errorCodeForResponseCode:](self, "errorCodeForResponseCode:", v9),  0LL,  v3));

  return (NSError *)v10;
}

- (int64_t)errorCodeForResponseCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"sh.001"])
  {
    int64_t v4 = 200LL;
  }

  else if ([v3 isEqualToString:@"sh.002"])
  {
    int64_t v4 = 201LL;
  }

  else
  {
    int64_t v4 = 202LL;
  }

  return v4;
}

- (NSDictionary)errorDictionary
{
  return self->_errorDictionary;
}

- (void)setErrorDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end