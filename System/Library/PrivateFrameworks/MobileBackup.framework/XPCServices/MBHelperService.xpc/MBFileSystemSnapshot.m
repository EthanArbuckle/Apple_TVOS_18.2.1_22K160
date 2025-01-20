@interface MBFileSystemSnapshot
- (MBFileSystemSnapshot)initWithName:(id)a3 uuid:(id)a4 creationDate:(id)a5;
- (NSDate)creationDate;
- (NSString)name;
- (NSString)uuid;
- (id)description;
- (void)setCreationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation MBFileSystemSnapshot

- (MBFileSystemSnapshot)initWithName:(id)a3 uuid:(id)a4 creationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MBFileSystemSnapshot;
  v11 = -[MBFileSystemSnapshot init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[MBFileSystemSnapshot setName:](v11, "setName:", v8);
    -[MBFileSystemSnapshot setUuid:](v12, "setUuid:", v9);
    -[MBFileSystemSnapshot setCreationDate:](v12, "setCreationDate:", v10);
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileSystemSnapshot name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileSystemSnapshot uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileSystemSnapshot creationDate](self, "creationDate"));
  id v7 = MBStringWithDate(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileSystemSnapshot creationDate](self, "creationDate"));
  [v9 timeIntervalSince1970];
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: name=%@, uuid=%@, creationDate=%@(%.3f)>",  v3,  v4,  v5,  v8,  v10));

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end