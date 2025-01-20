@interface AWDCountersReachabilityS
- (BOOL)hasLinkLossNbrChildCount;
- (BOOL)hasLinkLossNbrRouterCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)linkLossNbrChildCount;
- (unsigned)linkLossNbrRouterCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLinkLossNbrChildCount:(BOOL)a3;
- (void)setHasLinkLossNbrRouterCount:(BOOL)a3;
- (void)setLinkLossNbrChildCount:(unsigned int)a3;
- (void)setLinkLossNbrRouterCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersReachabilityS

- (void)setLinkLossNbrRouterCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_linkLossNbrRouterCount = a3;
}

- (void)setHasLinkLossNbrRouterCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkLossNbrRouterCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLinkLossNbrChildCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_linkLossNbrChildCount = a3;
}

- (void)setHasLinkLossNbrChildCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLinkLossNbrChildCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersReachabilityS;
  id v3 = -[AWDCountersReachabilityS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersReachabilityS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_linkLossNbrRouterCount));
    [v3 setObject:v5 forKey:@"link_loss_nbr_router_count"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_linkLossNbrChildCount));
    [v3 setObject:v6 forKey:@"link_loss_nbr_child_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100105888((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_linkLossNbrRouterCount, 1LL);
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_linkLossNbrChildCount, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_linkLossNbrRouterCount;
    *((_BYTE *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[2] = self->_linkLossNbrChildCount;
    *((_BYTE *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_linkLossNbrRouterCount;
    *((_BYTE *)result + 16) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_linkLossNbrChildCount;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_linkLossNbrRouterCount != *((_DWORD *)v4 + 3)) {
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
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_linkLossNbrChildCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761LL * self->_linkLossNbrRouterCount;
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
  uint64_t v3 = 2654435761LL * self->_linkLossNbrChildCount;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_linkLossNbrRouterCount = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 16);
  }

  if ((v5 & 1) != 0)
  {
    self->_linkLossNbrChildCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)linkLossNbrRouterCount
{
  return self->_linkLossNbrRouterCount;
}

- (unsigned)linkLossNbrChildCount
{
  return self->_linkLossNbrChildCount;
}

@end