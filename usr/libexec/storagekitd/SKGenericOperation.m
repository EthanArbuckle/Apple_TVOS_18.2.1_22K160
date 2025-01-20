@interface SKGenericOperation
- (BOOL)run;
- (id)completionBlock;
- (void)setCompletionBlock:(id)a3;
@end

@implementation SKGenericOperation

- (BOOL)run
{
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SKGenericOperation completionBlock](self, "completionBlock"));
  v3[2]();

  -[SKManagerOperation finished](self, "finished");
  return 1;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end