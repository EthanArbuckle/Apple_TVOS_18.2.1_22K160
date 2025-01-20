@interface MLDDatabaseFileDiagnostic
- (MLDDatabaseFileDiagnostic)initWithDatabasePath:(id)a3;
- (NSDictionary)fileAttributes;
- (NSString)databasePath;
- (id)description;
@end

@implementation MLDDatabaseFileDiagnostic

- (MLDDatabaseFileDiagnostic)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MLDDatabaseFileDiagnostic;
  v5 = -[MLDDatabaseFileDiagnostic init](&v12, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 attributesOfItemAtPath:v5->_databasePath error:0]);
    fileAttributes = v5->_fileAttributes;
    v5->_fileAttributes = (NSDictionary *)v9;
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p {\n  path: %@\n  file attributes: %@\n}",  v5,  self,  self->_databasePath,  self->_fileAttributes));

  return v6;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (void).cxx_destruct
{
}

@end