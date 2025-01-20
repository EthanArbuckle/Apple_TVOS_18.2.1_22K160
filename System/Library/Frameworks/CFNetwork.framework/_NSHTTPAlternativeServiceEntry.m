@interface _NSHTTPAlternativeServiceEntry
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (NSString)alternateHost;
- (NSString)host;
- (NSString)partition;
- (_NSHTTPAlternativeServiceEntry)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)alternatePort;
- (int64_t)port;
- (int64_t)serviceType;
- (unint64_t)hash;
- (void)setAlternateHost:(id)a3;
- (void)setAlternatePort:(int64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHost:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setServiceType:(int64_t)a3;
@end

@implementation _NSHTTPAlternativeServiceEntry

- (_NSHTTPAlternativeServiceEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSHTTPAlternativeServiceEntry;
  v2 = -[_NSHTTPAlternativeServiceEntry init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    partition = v2->_partition;
    v2->_partition = (NSString *)@"none";

    uint64_t v5 = [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:86400.0];
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v5;
  }

  return v3;
}

- (void)setPartition:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = @"none";
  }
  partition = self->_partition;
  self->_partition = &v5->isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS____NSHTTPAlternativeServiceEntry);
  -[_NSHTTPAlternativeServiceEntry alternateHost](self, "alternateHost");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setAlternateHost:](v4, "setAlternateHost:", v5);

  -[_NSHTTPAlternativeServiceEntry setAlternatePort:]( v4,  "setAlternatePort:",  -[_NSHTTPAlternativeServiceEntry alternatePort](self, "alternatePort"));
  v6 = -[_NSHTTPAlternativeServiceEntry host](self, "host");
  -[_NSHTTPAlternativeServiceEntry setHost:](v4, "setHost:", v6);

  -[_NSHTTPAlternativeServiceEntry setPort:](v4, "setPort:", -[_NSHTTPAlternativeServiceEntry port](self, "port"));
  -[_NSHTTPAlternativeServiceEntry partition](self, "partition");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setPartition:](v4, "setPartition:", v7);

  -[_NSHTTPAlternativeServiceEntry expirationDate](self, "expirationDate");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setExpirationDate:](v4, "setExpirationDate:", v8);

  -[_NSHTTPAlternativeServiceEntry setServiceType:]( v4,  "setServiceType:",  -[_NSHTTPAlternativeServiceEntry serviceType](self, "serviceType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_NSHTTPAlternativeServiceEntry *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v5 = v4;
      v6 = -[_NSHTTPAlternativeServiceEntry host](self, "host");
      -[_NSHTTPAlternativeServiceEntry host](v5, "host");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 isEqual:v7])
      {
        -[_NSHTTPAlternativeServiceEntry partition](self, "partition");
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_NSHTTPAlternativeServiceEntry partition](v5, "partition");
        if ([v8 isEqual:v9]
          && (int64_t v10 = -[_NSHTTPAlternativeServiceEntry port](self, "port"),
              v10 == -[_NSHTTPAlternativeServiceEntry port](v5, "port")))
        {
          int64_t v11 = -[_NSHTTPAlternativeServiceEntry serviceType](self, "serviceType");
          BOOL v12 = v11 == -[_NSHTTPAlternativeServiceEntry serviceType](v5, "serviceType");
        }

        else
        {
          BOOL v12 = 0;
        }
      }

      else
      {
        BOOL v12 = 0;
      }
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  int64_t v5 = -[_NSHTTPAlternativeServiceEntry port](self, "port");
  v6 = -[_NSHTTPAlternativeServiceEntry partition](self, "partition");
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v4 ^ v7 ^ -[_NSHTTPAlternativeServiceEntry serviceType](self, "serviceType");

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_NSHTTPAlternativeServiceEntry> {\n \t\t\tHost = %@ \n \t\t\tPort = %ld \n \t\t\tPartition = %@ \n \t\t\tAlternate-Host = %@ \n \t\t\tAlternate-Port = %ld \n \t\t\tExpiration = %@ \n} ", self->_host, self->_port, self->_partition, self->_alternateHost, self->_alternatePort, self->_expirationDate];
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)alternateHost
{
  return self->_alternateHost;
}

- (void)setAlternateHost:(id)a3
{
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (int64_t)alternatePort
{
  return self->_alternatePort;
}

- (void)setAlternatePort:(int64_t)a3
{
  self->_alternatePort = a3;
}

- (NSString)partition
{
  return self->_partition;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (void).cxx_destruct
{
}

@end