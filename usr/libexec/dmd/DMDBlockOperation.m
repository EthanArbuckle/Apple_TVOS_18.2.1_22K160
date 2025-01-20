@interface DMDBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (id)block;
- (void)main;
- (void)setBlock:(id)a3;
@end

@implementation DMDBlockOperation

+ (id)blockOperationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___DMDBlockOperation);
  -[DMDBlockOperation setBlock:](v4, "setBlock:", v3);

  return v4;
}

- (void)main
{
  id v3 = objc_autoreleasePoolPush();
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DMDBlockOperation block](self, "block"));
  v4[2]();

  objc_autoreleasePoolPop(v3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end