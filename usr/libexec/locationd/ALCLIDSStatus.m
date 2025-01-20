@interface ALCLIDSStatus
- (BOOL)hasPairedModelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pairedModelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)connectionStatus;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionStatus:(unsigned int)a3;
- (void)setPairedModelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLIDSStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLIDSStatus;
  -[ALCLIDSStatus dealloc](&v3, "dealloc");
}

- (BOOL)hasPairedModelId
{
  return self->_pairedModelId != 0LL;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALCLIDSStatus;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALCLIDSStatus description](&v3, "description"),  -[ALCLIDSStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_connectionStatus),  @"connectionStatus");
  pairedModelId = self->_pairedModelId;
  if (pairedModelId) {
    [v3 setObject:pairedModelId forKey:@"pairedModelId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10074FEB8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  pairedModelId = self->_pairedModelId;
  if (pairedModelId) {
    PBDataWriterWriteStringField(a3, pairedModelId, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_connectionStatus;
  pairedModelId = self->_pairedModelId;
  if (pairedModelId) {
    [a3 setPairedModelId:pairedModelId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)v5 + 2) = self->_connectionStatus;

  *((void *)v5 + 2) = -[NSString copyWithZone:](self->_pairedModelId, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_connectionStatus == *((_DWORD *)a3 + 2))
    {
      pairedModelId = self->_pairedModelId;
      else {
        LOBYTE(v5) = 1;
      }
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761LL * self->_connectionStatus;
  return -[NSString hash](self->_pairedModelId, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_connectionStatus = *((_DWORD *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[ALCLIDSStatus setPairedModelId:](self, "setPairedModelId:");
  }
}

- (unsigned)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(unsigned int)a3
{
  self->_connectionStatus = a3;
}

- (NSString)pairedModelId
{
  return self->_pairedModelId;
}

- (void)setPairedModelId:(id)a3
{
}

@end