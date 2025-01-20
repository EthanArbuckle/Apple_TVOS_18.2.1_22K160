@interface IXDataPromiseSeed
+ (BOOL)supportsSecureCoding;
- (IXDataPromiseSeed)initWithCoder:(id)a3;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)creatorIdentifier;
- (unint64_t)totalBytesNeededOnDisk;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatorIdentifier:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setTotalBytesNeededOnDisk:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation IXDataPromiseSeed

- (IXDataPromiseSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IXDataPromiseSeed;
  v5 = -[IXDataPromiseSeed init](&v17, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"name"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"creatorIdentifier"];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v5->_creatorIdentifier = (unint64_t)[v10 unsignedIntegerValue];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"uniqueIdentifier"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"totalBytesNeededOnDisk"];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v5->_totalBytesNeededOnDisk = (unint64_t)[v15 unsignedLongLongValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataPromiseSeed name](self, "name"));
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXDataPromiseSeed creatorIdentifier](self, "creatorIdentifier")));
  [v4 encodeObject:v6 forKey:@"creatorIdentifier"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataPromiseSeed uniqueIdentifier](self, "uniqueIdentifier"));
  [v4 encodeObject:v7 forKey:@"uniqueIdentifier"];

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXDataPromiseSeed totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk")));
  [v4 encodeObject:v8 forKey:@"totalBytesNeededOnDisk"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataPromiseSeed name](self, "name"));
  [v4 setName:v5];

  objc_msgSend(v4, "setCreatorIdentifier:", -[IXDataPromiseSeed creatorIdentifier](self, "creatorIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataPromiseSeed uniqueIdentifier](self, "uniqueIdentifier"));
  [v4 setUniqueIdentifier:v6];

  objc_msgSend( v4,  "setTotalBytesNeededOnDisk:",  -[IXDataPromiseSeed totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk"));
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)creatorIdentifier
{
  return self->_creatorIdentifier;
}

- (void)setCreatorIdentifier:(unint64_t)a3
{
  self->_creatorIdentifier = a3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)totalBytesNeededOnDisk
{
  return self->_totalBytesNeededOnDisk;
}

- (void)setTotalBytesNeededOnDisk:(unint64_t)a3
{
  self->_totalBytesNeededOnDisk = a3;
}

- (void).cxx_destruct
{
}

@end