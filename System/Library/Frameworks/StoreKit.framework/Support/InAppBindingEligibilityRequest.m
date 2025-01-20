@interface InAppBindingEligibilityRequest
+ (BOOL)supportsSecureCoding;
- (InAppBindingEligibilityRequest)initWithCoder:(id)a3;
- (InAppBindingEligibilityRequest)initWithPinningID:(id)a3;
- (NSString)pinningID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InAppBindingEligibilityRequest

- (InAppBindingEligibilityRequest)initWithPinningID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___InAppBindingEligibilityRequest;
  v6 = -[InAppBindingEligibilityRequest init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pinningID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[InAppBindingEligibilityRequest pinningID](self, "pinningID"));
  [v4 encodeObject:v5 forKey:@"pinningId"];
}

- (InAppBindingEligibilityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"pinningId"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[InAppBindingEligibilityRequest initWithPinningID:](self, "initWithPinningID:", v6);
  return v7;
}

- (NSString)pinningID
{
  return self->_pinningID;
}

- (void).cxx_destruct
{
}

@end