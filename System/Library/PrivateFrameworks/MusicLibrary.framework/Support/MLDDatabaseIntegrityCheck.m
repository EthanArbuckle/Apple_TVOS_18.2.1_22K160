@interface MLDDatabaseIntegrityCheck
- (NSArray)faults;
- (NSString)databasePath;
- (void)setDatabasePath:(id)a3;
- (void)setFaults:(id)a3;
@end

@implementation MLDDatabaseIntegrityCheck

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
}

- (NSArray)faults
{
  return self->_faults;
}

- (void)setFaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end