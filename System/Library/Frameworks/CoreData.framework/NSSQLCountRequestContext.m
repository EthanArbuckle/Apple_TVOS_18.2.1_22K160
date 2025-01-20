@interface NSSQLCountRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (id)_createStatement;
@end

@implementation NSSQLCountRequestContext

- (id)_createStatement
{
  v2 = self;
  if (self) {
    self = (NSSQLCountRequestContext *)self->super.super._sqlCore;
  }
  return -[NSSQLiteAdapter newCountStatementWithFetchRequestContext:]( -[NSSQLCountRequestContext adapter](self, "adapter"),  v2);
}

- (BOOL)executeRequestCore:(id *)a3
{
  if (a3 && *a3)
  {
    if (!self) {
      return -[NSSQLStoreRequestContext result](self, "result") != 0;
    }
    objc_setProperty_nonatomic(self, v5, *a3, 40LL);
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