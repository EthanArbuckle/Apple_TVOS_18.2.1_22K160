@interface TIAnalyticsValidationResult
- (BOOL)success;
- (NSString)errorSummary;
- (TIAnalyticsValidationResult)init;
- (void)addError:(id)a3;
@end

@implementation TIAnalyticsValidationResult

- (TIAnalyticsValidationResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TIAnalyticsValidationResult;
  v2 = -[TIAnalyticsValidationResult init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_success = 1;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    errors = v3->_errors;
    v3->_errors = v4;
  }

  return v3;
}

- (void)addError:(id)a3
{
  self->_success = 0;
}

- (NSString)errorSummary
{
  if (-[NSMutableArray count](self->_errors, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( self->_errors,  "componentsJoinedByString:",  @"\n  "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Validation errors were found:\n  %@",  v3));
  }

  else
  {
    v4 = @"No validation errors were found";
  }

  return (NSString *)v4;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
}

@end