@interface _NSHTTPAlternativeServicesFilter
+ (id)emptyFilter;
- (NSString)host;
- (NSString)partition;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)port;
- (void)setHost:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPort:(int64_t)a3;
@end

@implementation _NSHTTPAlternativeServicesFilter

- (void)setHost:(id)a3
{
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void)setPartition:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"none";
  }
  partition = self->_partition;
  self->_partition = &v5->isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS____NSHTTPAlternativeServicesFilter);
  v5 = -[_NSHTTPAlternativeServicesFilter host](self, "host");
  -[_NSHTTPAlternativeServicesFilter setHost:](v4, "setHost:", v5);

  -[_NSHTTPAlternativeServicesFilter setPort:](v4, "setPort:", -[_NSHTTPAlternativeServicesFilter port](self, "port"));
  v6 = -[_NSHTTPAlternativeServicesFilter partition](self, "partition");
  -[_NSHTTPAlternativeServicesFilter setPartition:](v4, "setPartition:", v6);

  return v4;
}

- (NSString)host
{
  return self->_host;
}

- (int64_t)port
{
  return self->_port;
}

- (NSString)partition
{
  return self->_partition;
}

- (void).cxx_destruct
{
}

+ (id)emptyFilter
{
  return objc_alloc_init(&OBJC_CLASS____NSHTTPAlternativeServicesFilter);
}

@end