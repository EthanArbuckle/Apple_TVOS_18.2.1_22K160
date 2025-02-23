@interface InAppBindingRequest
+ (BOOL)supportsSecureCoding;
- (InAppBindingRequest)initWithCoder:(id)a3;
- (InAppBindingRequest)initWithPinningID:(id)a3;
- (NSString)pinningID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InAppBindingRequest

- (InAppBindingRequest)initWithPinningID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___InAppBindingRequest;
  v6 = -[InAppBindingRequest init](&v9, "init");
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
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[InAppBindingRequest pinningID](self, "pinningID"));
  [v4 encodeObject:v5 forKey:@"pinningId"];
}

- (InAppBindingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"pinningId"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[InAppBindingRequest initWithPinningID:](self, "initWithPinningID:", v6);
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