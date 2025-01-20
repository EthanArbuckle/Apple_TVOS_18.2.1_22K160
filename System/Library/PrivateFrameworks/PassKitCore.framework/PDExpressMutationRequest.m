@interface PDExpressMutationRequest
- (PDExpressMutationRequest)init;
@end

@implementation PDExpressMutationRequest

- (PDExpressMutationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDExpressMutationRequest;
  result = -[PDExpressMutationRequest init](&v3, "init");
  if (result) {
    result->_userInitiated = 1;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end