@interface MSDServerRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSString)getName;
- (NSString)savePath;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setSavePath:(id)a3;
@end

@implementation MSDServerRequest

- (BOOL)isValid
{
  return 1;
}

- (NSString)getName
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDServerResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[MSDServerRequest getResponseClass](self, "getResponseClass");
  v10 = (void *)objc_opt_new(v8, v9);
  if (v6)
  {
    id v11 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100096498(self, (uint64_t)v6, v12);
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"data"]);
    [v10 setData:v13];
  }

  [v10 setError:v6];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 setSavePath:self->_savePath];
  [v4 setCompletion:self->_completion];
  return v4;
}

- (NSString)savePath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSavePath:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end