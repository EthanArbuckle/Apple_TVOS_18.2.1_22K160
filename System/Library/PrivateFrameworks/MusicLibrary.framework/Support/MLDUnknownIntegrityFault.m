@interface MLDUnknownIntegrityFault
- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4;
- (MLDUnknownIntegrityFault)initWithFaultString:(id)a3;
- (NSString)faultString;
- (id)description;
@end

@implementation MLDUnknownIntegrityFault

- (MLDUnknownIntegrityFault)initWithFaultString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MLDUnknownIntegrityFault;
  v5 = -[MLDUnknownIntegrityFault init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    faultString = v5->_faultString;
    v5->_faultString = v6;
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p %@>",  v5,  self,  self->_faultString));

  return v6;
}

- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4
{
  if (a4)
  {
    v5 = (objc_class *)objc_opt_class(self, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    v11 = @"unhandleable integrity fault";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  -1LL,  v8));
  }

  return 0;
}

- (NSString)faultString
{
  return self->_faultString;
}

- (void).cxx_destruct
{
}

@end