@interface ADSiriRequestSucceededResponseTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
@end

@implementation ADSiriRequestSucceededResponseTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v13,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ADSiriRequestSucceededResponseTransformer.m",  24,  @"Request succeeded response transformer expected response of type %@, but got %@ instead; request command: %@",
      objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse),
      v8,
      v9);
  }

  v11 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);

  return v11;
}

@end