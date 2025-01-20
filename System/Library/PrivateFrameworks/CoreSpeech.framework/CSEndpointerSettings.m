@interface CSEndpointerSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)disableEndpointer;
- (CSEndpointerSettings)initWithCoder:(id)a3;
- (CSEndpointerSettings)initWithDisableEndpointer:(BOOL)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSEndpointerSettings

- (CSEndpointerSettings)initWithDisableEndpointer:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSEndpointerSettings;
  result = -[CSEndpointerSettings init](&v5, "init");
  if (result) {
    result->_disableEndpointer = a3;
  }
  return result;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v4 = v3;
  else {
    objc_super v5 = @"NO";
  }
  [v3 appendFormat:@"[disableEndpointer = %@]", v5];
  return v4;
}

- (CSEndpointerSettings)initWithCoder:(id)a3
{
  return -[CSEndpointerSettings initWithDisableEndpointer:]( self,  "initWithDisableEndpointer:",  [a3 decodeBoolForKey:@"CSEndpointerSettings:::disableEndpointer"]);
}

- (void)encodeWithCoder:(id)a3
{
  BOOL disableEndpointer = self->_disableEndpointer;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", disableEndpointer));
  [v4 encodeObject:v5 forKey:@"CSEndpointerSettings:::disableEndpointer"];
}

- (BOOL)disableEndpointer
{
  return self->_disableEndpointer;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end