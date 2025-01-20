@interface SKPartitionDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithVolume:(id)a3;
+ (id)descriptorWithVolume:(id)a3 size:(unint64_t)a4;
- (NSString)name;
- (SKFilesystem)filesystem;
- (SKPartitionDescriptor)initWithCoder:(id)a3;
- (SKPartitionDescriptor)initWithVolume:(id)a3 size:(unint64_t)a4;
- (SKVolumeDescriptor)innerDescriptor;
- (id)description;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setInnerDescriptor:(id)a3;
@end

@implementation SKPartitionDescriptor

- (SKPartitionDescriptor)initWithVolume:(id)a3 size:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKPartitionDescriptor;
  v8 = -[SKPartitionDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_innerDescriptor, a3);
    v9->_size = a4;
  }

  return v9;
}

+ (id)descriptorWithVolume:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVolume:v3 size:0];

  return v4;
}

+ (id)descriptorWithVolume:(id)a3 size:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVolume:v5 size:a4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 name];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SKFilesystem)filesystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 filesystem];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKFilesystem *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"descriptor"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[SKPartitionDescriptor size](self, "size"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"size"];
}

- (SKPartitionDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKPartitionDescriptor;
  id v5 = -[SKPartitionDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x189604010], "setWithObjects:", objc_opt_class(), 0);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"descriptor"];
    innerDescriptor = v5->_innerDescriptor;
    v5->_innerDescriptor = (SKVolumeDescriptor *)v7;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_size = [v9 unsignedLongLongValue];
  }

  return v5;
}

- (id)description
{
  id v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = -[SKPartitionDescriptor size](self, "size");
  -[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { size: %lu, innerDescriptor: %@}>", v5, v6, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)size
{
  return self->_size;
}

- (SKVolumeDescriptor)innerDescriptor
{
  return self->_innerDescriptor;
}

- (void)setInnerDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end