@interface CKOperationConfiguration
- (BOOL)cplDiscretionary;
- (void)setCPLDiscretionary:(BOOL)a3;
@end

@implementation CKOperationConfiguration

- (BOOL)cplDiscretionary
{
  return -[CKOperationConfiguration discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior") != 0LL;
}

- (void)setCPLDiscretionary:(BOOL)a3
{
  if (a3) {
    -[CKOperationConfiguration setDiscretionaryNetworkBehavior:](self, "setDiscretionaryNetworkBehavior:", 2LL);
  }
  else {
    -[CKOperationConfiguration setDiscretionaryNetworkBehavior:](self, "setDiscretionaryNetworkBehavior:", 0LL);
  }
}

@end