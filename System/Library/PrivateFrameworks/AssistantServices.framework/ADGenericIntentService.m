@interface ADGenericIntentService
- (ADGenericIntentService)init;
@end

@implementation ADGenericIntentService

- (ADGenericIntentService)init
{
  v3 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v4 = -[ADServiceCommandType initWithDomainName:className:]( v3,  "initWithDomainName:className:",  SAIntentGroupGroupIdentifier,  SAIntentGroupSupportedIntentResponseClassIdentifier);
  v5 = objc_alloc_init(&OBJC_CLASS___ADGenericIntentRequestTransformer);
  v6 = objc_alloc_init(&OBJC_CLASS___ADGenericIntentResponseTransformer);
  v7 = objc_alloc_init(&OBJC_CLASS___ADGenericIntentRequestHandler);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADGenericIntentService;
  v8 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( &v10,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v4,  v5,  v6,  v7);

  return v8;
}

@end