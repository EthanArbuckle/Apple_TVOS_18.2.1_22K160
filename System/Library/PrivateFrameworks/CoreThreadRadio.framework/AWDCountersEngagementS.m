@interface AWDCountersEngagementS
- (BOOL)hasChildNodesCount;
- (BOOL)hasRouterNodesCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)childNodesCount;
- (unsigned)routerNodesCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChildNodesCount:(unsigned int)a3;
- (void)setHasChildNodesCount:(BOOL)a3;
- (void)setHasRouterNodesCount:(BOOL)a3;
- (void)setRouterNodesCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersEngagementS

- (void)setRouterNodesCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_routerNodesCount = a3;
}

- (void)setHasRouterNodesCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRouterNodesCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setChildNodesCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_childNodesCount = a3;
}

- (void)setHasChildNodesCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChildNodesCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersEngagementS;
  id v3 = -[AWDCountersEngagementS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersEngagementS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_routerNodesCount));
    [v3 setObject:v5 forKey:@"router_nodes_count"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_childNodesCount));
    [v3 setObject:v6 forKey:@"child_nodes_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012D58C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_routerNodesCount, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_childNodesCount, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_routerNodesCount;
    *((_BYTE *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[2] = self->_childNodesCount;
    *((_BYTE *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_routerNodesCount;
    *((_BYTE *)result + 16) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_childNodesCount;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_routerNodesCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }

  BOOL v6 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_childNodesCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_routerNodesCount;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  uint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761LL * self->_childNodesCount;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_routerNodesCount = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 16);
  }

  if ((v5 & 1) != 0)
  {
    self->_childNodesCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)routerNodesCount
{
  return self->_routerNodesCount;
}

- (unsigned)childNodesCount
{
  return self->_childNodesCount;
}

@end