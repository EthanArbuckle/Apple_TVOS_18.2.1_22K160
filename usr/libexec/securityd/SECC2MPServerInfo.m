@interface SECC2MPServerInfo
- (BOOL)hasPartition;
- (BOOL)hasServiceBuild;
- (BOOL)hasServiceInstance;
- (BOOL)hasServiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)partition;
- (NSString)serviceBuild;
- (NSString)serviceInstance;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPartition:(id)a3;
- (void)setServiceBuild:(id)a3;
- (void)setServiceInstance:(id)a3;
- (void)setServiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPServerInfo

- (BOOL)hasServiceName
{
  return self->_serviceName != 0LL;
}

- (BOOL)hasPartition
{
  return self->_partition != 0LL;
}

- (BOOL)hasServiceBuild
{
  return self->_serviceBuild != 0LL;
}

- (BOOL)hasServiceInstance
{
  return self->_serviceInstance != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPServerInfo;
  id v3 = -[SECC2MPServerInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPServerInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"service_name"];
  }
  partition = self->_partition;
  if (partition) {
    [v4 setObject:partition forKey:@"partition"];
  }
  serviceBuild = self->_serviceBuild;
  if (serviceBuild) {
    [v4 setObject:serviceBuild forKey:@"service_build"];
  }
  serviceInstance = self->_serviceInstance;
  if (serviceInstance) {
    [v4 setObject:serviceInstance forKey:@"service_instance"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001863E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  serviceName = self->_serviceName;
  id v9 = v4;
  if (serviceName)
  {
    PBDataWriterWriteStringField(v4, serviceName, 102LL);
    id v4 = v9;
  }

  partition = self->_partition;
  if (partition)
  {
    PBDataWriterWriteStringField(v9, partition, 103LL);
    id v4 = v9;
  }

  serviceBuild = self->_serviceBuild;
  if (serviceBuild)
  {
    PBDataWriterWriteStringField(v9, serviceBuild, 104LL);
    id v4 = v9;
  }

  serviceInstance = self->_serviceInstance;
  if (serviceInstance)
  {
    PBDataWriterWriteStringField(v9, serviceInstance, 105LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceName)
  {
    objc_msgSend(v4, "setServiceName:");
    id v4 = v5;
  }

  if (self->_partition)
  {
    objc_msgSend(v5, "setPartition:");
    id v4 = v5;
  }

  if (self->_serviceBuild)
  {
    objc_msgSend(v5, "setServiceBuild:");
    id v4 = v5;
  }

  if (self->_serviceInstance)
  {
    objc_msgSend(v5, "setServiceInstance:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = -[NSString copyWithZone:](self->_partition, "copyWithZone:", a3);
  id v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = -[NSString copyWithZone:](self->_serviceBuild, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = -[NSString copyWithZone:](self->_serviceInstance, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[4]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((partition = self->_partition, !((unint64_t)partition | v4[1]))
     || -[NSString isEqual:](partition, "isEqual:"))
    && ((serviceBuild = self->_serviceBuild, !((unint64_t)serviceBuild | v4[2]))
     || -[NSString isEqual:](serviceBuild, "isEqual:")))
  {
    serviceInstance = self->_serviceInstance;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_serviceName, "hash");
  unint64_t v4 = -[NSString hash](self->_partition, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_serviceBuild, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_serviceInstance, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[4]) {
    -[SECC2MPServerInfo setServiceName:](self, "setServiceName:");
  }
  if (v4[1]) {
    -[SECC2MPServerInfo setPartition:](self, "setPartition:");
  }
  if (v4[2]) {
    -[SECC2MPServerInfo setServiceBuild:](self, "setServiceBuild:");
  }
  if (v4[3]) {
    -[SECC2MPServerInfo setServiceInstance:](self, "setServiceInstance:");
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
}

- (NSString)serviceBuild
{
  return self->_serviceBuild;
}

- (void)setServiceBuild:(id)a3
{
}

- (NSString)serviceInstance
{
  return self->_serviceInstance;
}

- (void)setServiceInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end