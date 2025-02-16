@interface GTFileEntry
+ (BOOL)supportsSecureCoding;
- (GTFileEntry)initWithCoder:(id)a3;
- (GTFileEntry)initWithLink:(id)a3 destination:(id)a4;
- (GTFileEntry)initWithPath:(id)a3 fileSize:(unint64_t)a4;
- (NSString)destination;
- (NSString)path;
- (id)description;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTFileEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTFileEntry)initWithPath:(id)a3 fileSize:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTFileEntry;
  v8 = -[GTFileEntry init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    destination = v9->_destination;
    v9->_destination = 0LL;

    v9->_fileSize = a4;
  }

  return v9;
}

- (GTFileEntry)initWithLink:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTFileEntry;
  v9 = -[GTFileEntry init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
    v10->_fileSize = 0LL;
  }

  return v10;
}

- (GTFileEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTFileEntry;
  v5 = -[GTFileEntry init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"path"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    path = v5->_path;
    v5->_path = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"destination"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    destination = v5->_destination;
    v5->_destination = (NSString *)v10;

    v5->_fileSize = (unint64_t)[v4 decodeIntegerForKey:@"fileSize"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"path"];
  [v5 encodeObject:self->_destination forKey:@"destination"];
  [v5 encodeInteger:self->_fileSize forKey:@"fileSize"];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTFileEntry path](self, "path"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTFileEntry destination](self, "destination"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, Path: %@, Destination: %@, Size: %lu>",  v5,  self,  v6,  v7,  -[GTFileEntry fileSize](self, "fileSize")));

  return v8;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)destination
{
  return self->_destination;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
}

@end