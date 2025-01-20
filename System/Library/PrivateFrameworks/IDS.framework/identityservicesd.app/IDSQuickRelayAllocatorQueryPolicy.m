@interface IDSQuickRelayAllocatorQueryPolicy
- (BOOL)_serverBagBoolForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)shouldPreventDuplicateTokensInAllocationForServiceIdentifier:(id)a3;
- (BOOL)shouldQueryOnEveryQRAllocationForServiceIdentifier:(id)a3;
- (IDSQuickRelayAllocatorQueryPolicy)initWithServerBag:(id)a3;
- (IDSServerBag)serverBag;
@end

@implementation IDSQuickRelayAllocatorQueryPolicy

- (IDSQuickRelayAllocatorQueryPolicy)initWithServerBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocatorQueryPolicy;
  v6 = -[IDSQuickRelayAllocatorQueryPolicy init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverBag, a3);
  }

  return v7;
}

- (BOOL)shouldQueryOnEveryQRAllocationForServiceIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"com.apple.private.alloy.ids.cloudmessaging"])
  {
    if (sub_10011E4CC(v4))
    {
      id v5 = @"ids-query-qr-allocate-groupfacetime";
    }

    else
    {
      id v8 = v4;
      if ([v8 isEqualToString:@"com.apple.private.alloy.facetime.video"])
      {
      }

      else
      {
        unsigned int v9 = [v8 isEqualToString:@"com.apple.private.alloy.facetime.audio"];

        if (!v9)
        {
          if ([v8 isEqualToString:@"com.apple.private.alloy.willow.stream"])
          {
            id v5 = @"ids-query-qr-allocate-homekit";
          }

          else
          {
            if (![v8 isEqualToString:@"com.apple.private.alloy.terminus"])
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ids-query-qr-allocate-%@",  v8));
              id v13 = v8;
              v14 = -[IDSServiceProperties initWithServiceIdentifier:]( objc_alloc(&OBJC_CLASS___IDSServiceProperties),  "initWithServiceIdentifier:",  v13);

              id v15 = -[IDSServiceProperties isUserDrivenRealTime](v14, "isUserDrivenRealTime");
              unsigned __int8 v10 = -[IDSQuickRelayAllocatorQueryPolicy _serverBagBoolForKey:withDefaultValue:]( self,  "_serverBagBoolForKey:withDefaultValue:",  v12,  v15);

              goto LABEL_12;
            }

            id v5 = @"ids-query-qr-allocate-terminus";
          }

          goto LABEL_3;
        }
      }

      id v5 = @"ids-query-qr-allocate-facetime";
    }

    v6 = self;
    uint64_t v7 = 1LL;
    goto LABEL_11;
  }

  id v5 = @"ids-query-qr-allocate-cloudmessaging";
LABEL_3:
  v6 = self;
  uint64_t v7 = 0LL;
LABEL_11:
  unsigned __int8 v10 = -[IDSQuickRelayAllocatorQueryPolicy _serverBagBoolForKey:withDefaultValue:]( v6,  "_serverBagBoolForKey:withDefaultValue:",  v5,  v7);
LABEL_12:

  return v10;
}

- (BOOL)shouldPreventDuplicateTokensInAllocationForServiceIdentifier:(id)a3
{
  if (sub_10011E4CC(a3)) {
    return -[IDSQuickRelayAllocatorQueryPolicy _serverBagBoolForKey:withDefaultValue:]( self,  "_serverBagBoolForKey:withDefaultValue:",  @"ids-qr-allocate-prevent-duplicate-tokens",  0LL);
  }
  else {
    return 1;
  }
}

- (BOOL)_serverBagBoolForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocatorQueryPolicy serverBag](self, "serverBag"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  if (v8)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
      a4 = [v8 BOOLValue];
    }
  }

  return a4;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void).cxx_destruct
{
}

@end