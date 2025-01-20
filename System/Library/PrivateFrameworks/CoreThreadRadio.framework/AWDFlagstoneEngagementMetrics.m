@interface AWDFlagstoneEngagementMetrics
- (AWDCountersDiscoveryJoinS)sCntrsDiscoveryJoin;
- (AWDCountersEngagementS)sCntrsEngagement;
- (AWDCountersReachabilityS)sCntrsReachability;
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasSCntrsDiscoveryJoin;
- (BOOL)hasSCntrsEngagement;
- (BOOL)hasSCntrsReachability;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setSCntrsDiscoveryJoin:(id)a3;
- (void)setSCntrsEngagement:(id)a3;
- (void)setSCntrsReachability:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneEngagementMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0LL;
}

- (BOOL)hasSCntrsEngagement
{
  return self->_sCntrsEngagement != 0LL;
}

- (BOOL)hasSCntrsDiscoveryJoin
{
  return self->_sCntrsDiscoveryJoin != 0LL;
}

- (BOOL)hasSCntrsReachability
{
  return self->_sCntrsReachability != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDFlagstoneEngagementMetrics;
  id v3 = -[AWDFlagstoneEngagementMetrics description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDFlagstoneEngagementMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_timestamp));
    [v3 setObject:v4 forKey:@"timestamp"];
  }

  header = self->_header;
  if (header)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AWDHeaderInfoS dictionaryRepresentation](header, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"header"];
  }

  sCntrsEngagement = self->_sCntrsEngagement;
  if (sCntrsEngagement)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersEngagementS dictionaryRepresentation](sCntrsEngagement, "dictionaryRepresentation"));
    [v3 setObject:v8 forKey:@"s_cntrs_engagement"];
  }

  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  if (sCntrsDiscoveryJoin)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[AWDCountersDiscoveryJoinS dictionaryRepresentation]( sCntrsDiscoveryJoin,  "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"s_cntrs_discovery_join"];
  }

  sCntrsReachability = self->_sCntrsReachability;
  if (sCntrsReachability)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersReachabilityS dictionaryRepresentation](sCntrsReachability, "dictionaryRepresentation"));
    [v3 setObject:v12 forKey:@"s_cntrs_reachability"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return result;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1LL);
    id v4 = v9;
  }

  header = self->_header;
  if (header)
  {
    PBDataWriterWriteSubmessage(v9, header, 2LL);
    id v4 = v9;
  }

  sCntrsEngagement = self->_sCntrsEngagement;
  if (sCntrsEngagement)
  {
    PBDataWriterWriteSubmessage(v9, sCntrsEngagement, 3LL);
    id v4 = v9;
  }

  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  if (sCntrsDiscoveryJoin)
  {
    PBDataWriterWriteSubmessage(v9, sCntrsDiscoveryJoin, 4LL);
    id v4 = v9;
  }

  sCntrsReachability = self->_sCntrsReachability;
  if (sCntrsReachability)
  {
    PBDataWriterWriteSubmessage(v9, sCntrsReachability, 5LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }

  v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }

  if (self->_sCntrsEngagement)
  {
    objc_msgSend(v5, "setSCntrsEngagement:");
    id v4 = v5;
  }

  if (self->_sCntrsDiscoveryJoin)
  {
    objc_msgSend(v5, "setSCntrsDiscoveryJoin:");
    id v4 = v5;
  }

  if (self->_sCntrsReachability)
  {
    objc_msgSend(v5, "setSCntrsReachability:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 48) |= 1u;
  }

  id v7 = -[AWDHeaderInfoS copyWithZone:](self->_header, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[AWDCountersEngagementS copyWithZone:](self->_sCntrsEngagement, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = -[AWDCountersDiscoveryJoinS copyWithZone:](self->_sCntrsDiscoveryJoin, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = -[AWDCountersReachabilityS copyWithZone:](self->_sCntrsReachability, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_19:
    unsigned __int8 v10 = 0;
    goto LABEL_20;
  }

  header = self->_header;
  if ((header || *((void *)v4 + 2)) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:", *((void *)v4 + 2))) {
    goto LABEL_19;
  }
  sCntrsEngagement = self->_sCntrsEngagement;
  if ((sCntrsEngagement || *((void *)v4 + 4))
    && !-[AWDCountersEngagementS isEqual:](sCntrsEngagement, "isEqual:", *((void *)v4 + 4)))
  {
    goto LABEL_19;
  }

  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  if ((sCntrsDiscoveryJoin || *((void *)v4 + 3))
    && !-[AWDCountersDiscoveryJoinS isEqual:](sCntrsDiscoveryJoin, "isEqual:", *((void *)v4 + 3)))
  {
    goto LABEL_19;
  }

  sCntrsReachability = self->_sCntrsReachability;
  if (sCntrsReachability || *((void *)v4 + 5)) {
    unsigned __int8 v10 = -[AWDCountersReachabilityS isEqual:](sCntrsReachability, "isEqual:", *((void *)v4 + 5));
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  v2 = (id *)self;
  if ((*(_BYTE *)(self + 48) & 1) == 0)
  {
    uint64_t v3 = 0LL;
LABEL_5:
    unint64_t v5 = (unint64_t)[*(id *)(self + 16) hash];
    unint64_t v6 = (unint64_t)[v2[4] hash];
    unint64_t v7 = v5 ^ v3 ^ v6 ^ (unint64_t)[v2[3] hash];
    return v7 ^ (unint64_t)[v2[5] hash];
  }

  unint64_t v4 = *(void *)(self + 8);
  if (is_mul_ok(v4, 0x9E3779B1uLL))
  {
    uint64_t v3 = 2654435761u * v4;
    goto LABEL_5;
  }

  __break(0x550Cu);
  return self;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  header = self->_header;
  uint64_t v7 = v5[2];
  v14 = v5;
  if (header)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDHeaderInfoS mergeFrom:](header, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDFlagstoneEngagementMetrics setHeader:](self, "setHeader:");
  }

  unint64_t v5 = v14;
LABEL_9:
  sCntrsEngagement = self->_sCntrsEngagement;
  uint64_t v9 = v5[4];
  if (sCntrsEngagement)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDCountersEngagementS mergeFrom:](sCntrsEngagement, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDFlagstoneEngagementMetrics setSCntrsEngagement:](self, "setSCntrsEngagement:");
  }

  unint64_t v5 = v14;
LABEL_15:
  sCntrsDiscoveryJoin = self->_sCntrsDiscoveryJoin;
  uint64_t v11 = v5[3];
  if (sCntrsDiscoveryJoin)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDCountersDiscoveryJoinS mergeFrom:](sCntrsDiscoveryJoin, "mergeFrom:");
  }

  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDFlagstoneEngagementMetrics setSCntrsDiscoveryJoin:](self, "setSCntrsDiscoveryJoin:");
  }

  unint64_t v5 = v14;
LABEL_21:
  sCntrsReachability = self->_sCntrsReachability;
  uint64_t v13 = v5[5];
  if (sCntrsReachability)
  {
    if (v13)
    {
      -[AWDCountersReachabilityS mergeFrom:](sCntrsReachability, "mergeFrom:");
LABEL_26:
      unint64_t v5 = v14;
    }
  }

  else if (v13)
  {
    -[AWDFlagstoneEngagementMetrics setSCntrsReachability:](self, "setSCntrsReachability:");
    goto LABEL_26;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHeaderInfoS)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (AWDCountersEngagementS)sCntrsEngagement
{
  return self->_sCntrsEngagement;
}

- (void)setSCntrsEngagement:(id)a3
{
}

- (AWDCountersDiscoveryJoinS)sCntrsDiscoveryJoin
{
  return self->_sCntrsDiscoveryJoin;
}

- (void)setSCntrsDiscoveryJoin:(id)a3
{
}

- (AWDCountersReachabilityS)sCntrsReachability
{
  return self->_sCntrsReachability;
}

- (void)setSCntrsReachability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end