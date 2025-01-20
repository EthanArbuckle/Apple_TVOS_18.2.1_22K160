@interface _PFTempNestedSnapshot
- (_PFTempNestedSnapshot)initWithOwnedKKsD:(id)a3 andVersion:(unint64_t)a4;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)valueForKey:(id)a3;
- (unsigned)_versionNumber;
- (void)dealloc;
@end

@implementation _PFTempNestedSnapshot

- (_PFTempNestedSnapshot)initWithOwnedKKsD:(id)a3 andVersion:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PFTempNestedSnapshot;
  result = -[_PFTempNestedSnapshot init](&v7, sel_init);
  if (result)
  {
    result->_snapshot = (NSKnownKeysDictionary *)a3;
    result->_version = a4;
  }

  return result;
}

- (const)knownKeyValuesPointer
{
  return -[NSKnownKeysDictionary values](self->_snapshot, "values");
}

- (id)_snapshot_
{
  return 0LL;
}

- (unsigned)_versionNumber
{
  return self->_version;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFTempNestedSnapshot;
  -[_PFTempNestedSnapshot dealloc](&v3, sel_dealloc);
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSKnownKeysDictionary valueForKey:](self->_snapshot, "valueForKey:", a3);
}

@end