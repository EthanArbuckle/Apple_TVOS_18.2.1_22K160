@interface BSTransaction
- (BOOL)pb_isAborted;
@end

@implementation BSTransaction

- (BOOL)pb_isAborted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSTransaction error](self, "error"));
  BOOL v3 = [v2 code] == (id)3;

  return v3;
}

@end