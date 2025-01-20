@interface _CPLEngineWrapperOpenError
- (BOOL)shouldTryReopening;
- (BOOL)shouldTryReopeningWithoutLibrary;
- (CPLEngineParameters)parameters;
- (NSDate)errorDate;
- (NSError)openError;
- (_CPLEngineWrapperOpenError)initWithParameters:(id)a3 openError:(id)a4;
@end

@implementation _CPLEngineWrapperOpenError

- (_CPLEngineWrapperOpenError)initWithParameters:(id)a3 openError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____CPLEngineWrapperOpenError;
  v9 = -[_CPLEngineWrapperOpenError init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameters, a3);
    objc_storeStrong((id *)&v10->_openError, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    errorDate = v10->_errorDate;
    v10->_errorDate = (NSDate *)v11;
  }

  return v10;
}

- (BOOL)shouldTryReopeningWithoutLibrary
{
  if ((-[NSError isCPLErrorWithCode:](self->_openError, "isCPLErrorWithCode:", 4LL) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    unsigned int v3 = -[NSError isCPLErrorWithCode:](self->_openError, "isCPLErrorWithCode:", 1014LL);
    if (v3) {
      LOBYTE(v3) = -[_CPLEngineWrapperOpenError shouldTryReopening](self, "shouldTryReopening");
    }
  }

  return v3;
}

- (BOOL)shouldTryReopening
{
  BOOL result = (-[NSError isCPLErrorWithCode:](self->_openError, "isCPLErrorWithCode:", 4LL) & 1) != 0
        || (-[NSDate timeIntervalSinceNow](self->_errorDate, "timeIntervalSinceNow"), v3 > 0.0)
        || v3 < -10.0;
  return result;
}

- (CPLEngineParameters)parameters
{
  return self->_parameters;
}

- (NSError)openError
{
  return self->_openError;
}

- (NSDate)errorDate
{
  return self->_errorDate;
}

- (void).cxx_destruct
{
}

@end