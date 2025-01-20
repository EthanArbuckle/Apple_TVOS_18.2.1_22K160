@interface NSObtainingEndpointState
- (void)addError:(int64_t)a3 description:(const char *)a4 forListenerNamed:(id)a5 fromServiceNamed:(id)a6;
- (void)whileHoldingLock:(id)a3;
@end

@implementation NSObtainingEndpointState

- (void)whileHoldingLock:(id)a3
{
}

- (void)addError:(int64_t)a3 description:(const char *)a4 forListenerNamed:(id)a5 fromServiceNamed:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4));
  id v12 = sub_100001E94(a3, v17, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  errors = self->errors;
  if (!errors)
  {
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  2LL));
    v16 = self->errors;
    self->errors = v15;

    errors = self->errors;
  }

  -[NSMutableArray addObject:](errors, "addObject:", v13);
}

- (void).cxx_destruct
{
}

@end