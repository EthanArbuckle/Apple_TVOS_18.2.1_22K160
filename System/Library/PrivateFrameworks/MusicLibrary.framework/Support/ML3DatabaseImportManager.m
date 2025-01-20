@interface ML3DatabaseImportManager
- (void)collectDiagnostic:(id)a3;
@end

@implementation ML3DatabaseImportManager

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseImportManager lastImportError](self, "lastImportError"));
  [v4 setLastImportError:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ML3DatabaseImportManager _importOperations](self, "_importOperations"));
  [v4 setActiveImportOperations:v6];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ML3DatabaseImportManager _suspendedImportOperations](self, "_suspendedImportOperations"));
  [v4 setSuspendedImportOperations:v7];
}

@end