@interface MLDDatabaseIntegrityFault
- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4;
@end

@implementation MLDDatabaseIntegrityFault

- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4
{
  v4 = (objc_class *)objc_opt_class(self, a2);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%@ is abstract",  v6);

  return 0;
}

@end