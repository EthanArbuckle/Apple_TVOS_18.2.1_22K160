@interface NSSQLXPCFetchRequestContext
- (BOOL)executeRequestCore:(id *)a3;
@end

@implementation NSSQLXPCFetchRequestContext

- (BOOL)executeRequestCore:(id *)a3
{
  id v5 = _rawRowDataForXPCRequest((uint64_t)self);
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", v5);

  if (a3 && *a3)
  {
    if (!self) {
      return -[NSSQLStoreRequestContext result](self, "result") != 0;
    }
    objc_setProperty_nonatomic(self, v6, *a3, 40LL);
  }

  else if (!self)
  {
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  }

  if (self->super.super._exception || self->super.super._error) {
    return 0;
  }
  return -[NSSQLStoreRequestContext result](self, "result") != 0;
}

@end