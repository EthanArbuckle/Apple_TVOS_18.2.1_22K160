@interface MSUDataAccessorDiagnostics
- (id)copyPathForPersistentData:(int)a3 error:(id *)a4;
- (id)returnDirectoryIfExistsForPath:(id)a3;
- (id)specialCaseFDRPathForDiagnostics;
@end

@implementation MSUDataAccessorDiagnostics

- (id)returnDirectoryIfExistsForPath:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v6 = 0;
  id v4 = (id)[MEMORY[0x1896078A8] defaultManager];
  char v5 = [v4 fileExistsAtPath:location[0] isDirectory:&v6] & 1;

  if ((v5 & 1) != 0 && (v6 & 1) != 0) {
    id v8 = location[0];
  }
  else {
    id v8 = 0LL;
  }
  objc_storeStrong(location, 0LL);
  return v8;
}

- (id)specialCaseFDRPathForDiagnostics
{
  char v5 = self;
  v4[1] = (id)a2;
  v4[0] = 0LL;
  v4[0] = @"/private/var/hardware/FactoryData/System/Library/Caches/Repair";
  id v3 = -[MSUDataAccessorDiagnostics returnDirectoryIfExistsForPath:](v5, "returnDirectoryIfExistsForPath:", v4[0]);
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (id)copyPathForPersistentData:(int)a3 error:(id *)a4
{
  v15 = self;
  SEL v14 = a2;
  unsigned int v13 = a3;
  v12 = a4;
  id v11 = 0LL;
  if (a3 == 100)
  {
    id v4 = -[MSUDataAccessorDiagnostics specialCaseFDRPathForDiagnostics](v15, "specialCaseFDRPathForDiagnostics");
    id v5 = v11;
    id v11 = v4;
  }

  if (!v11)
  {
    v10.receiver = v15;
    v10.super_class = (Class)&OBJC_CLASS___MSUDataAccessorDiagnostics;
    id v6 = -[MSUDataAccessor copyPathForPersistentData:error:](&v10, sel_copyPathForPersistentData_error_, v13, v12);
    id v7 = v11;
    id v11 = v6;
  }

  id v9 = v11;
  objc_storeStrong(&v11, 0LL);
  return v9;
}

@end