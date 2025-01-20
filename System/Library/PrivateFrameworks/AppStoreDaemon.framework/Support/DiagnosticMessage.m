@interface DiagnosticMessage
+ (BOOL)supportsSecureCoding;
- (DiagnosticMessage)init;
- (DiagnosticMessage)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setValuesForKeysWithDictionary:(id)a3;
@end

@implementation DiagnosticMessage

- (DiagnosticMessage)init
{
  return (DiagnosticMessage *)sub_100286794(self, 0LL);
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(CODE = %ld) %@",  self->_code,  self->_dictionary);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t code = self->_code;
  id v5 = a3;
  [v5 encodeInteger:code forKey:@"code"];
  [v5 encodeObject:self->_dictionary forKey:@"dictionary"];
}

- (DiagnosticMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DiagnosticMessage;
  id v5 = -[DiagnosticMessage init](&v23, "init");
  if (v5)
  {
    v5->_int64_t code = (int64_t)[v4 decodeIntegerForKey:@"code"];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData, v8);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
    v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  v11,  v13,  v15,  objc_opt_class(&OBJC_CLASS___NSURL, v16),  0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"dictionary"]);
    v20 = (NSMutableDictionary *)[v19 mutableCopy];
    dictionary = v5->_dictionary;
    v5->_dictionary = v20;
  }

  return v5;
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end