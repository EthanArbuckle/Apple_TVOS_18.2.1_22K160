@interface NWPBParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation NWPBParameters

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWPBParameters;
  -[NWPBParameters dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBParameters;
  v4 = -[NWPBParameters description](&v8, sel_description);
  v5 = -[NWPBParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  account = self->_account;
  if (account) {
    [v3 setObject:account forKey:@"account"];
  }
  effectiveBundleID = self->_effectiveBundleID;
  if (effectiveBundleID) {
    [v4 setObject:effectiveBundleID forKey:@"effectiveBundleID"];
  }
  effectiveProcessUUID = self->_effectiveProcessUUID;
  if (effectiveProcessUUID) {
    [v4 setObject:effectiveProcessUUID forKey:@"effectiveProcessUUID"];
  }
  realProcessUUID = self->_realProcessUUID;
  if (realProcessUUID) {
    [v4 setObject:realProcessUUID forKey:@"realProcessUUID"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_ipProtocol];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v57 forKey:@"ipProtocol"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_88;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_addressFamily];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v58 forKey:@"addressFamily"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_89;
  }

- (BOOL)readFrom:(id)a3
{
  return NWPBParametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_account) {
    PBDataWriterWriteStringField();
  }
  if (self->_effectiveBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_effectiveProcessUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_realProcessUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_70;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }

  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_71;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_account, "copyWithZone:", a3);
  unint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_effectiveBundleID, "copyWithZone:", a3);
  uint64_t v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_effectiveProcessUUID, "copyWithZone:", a3);
  uint64_t v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  uint64_t v12 = -[NSString copyWithZone:](self->_realProcessUUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v12;

  uint64_t v14 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  uint64_t v15 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v14;

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_ipProtocol;
    *(_WORD *)(v5 + 196) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }

  *(_DWORD *)(v5 + 64) = self->_addressFamily;
  *(_WORD *)(v5 + 196) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  account = self->_account;
  if ((unint64_t)account | *((void *)v4 + 7))
  {
  }

  effectiveBundleID = self->_effectiveBundleID;
  if ((unint64_t)effectiveBundleID | *((void *)v4 + 9))
  {
  }

  effectiveProcessUUID = self->_effectiveProcessUUID;
  if ((unint64_t)effectiveProcessUUID | *((void *)v4 + 10))
  {
  }

  realProcessUUID = self->_realProcessUUID;
  if ((unint64_t)realProcessUUID | *((void *)v4 + 18))
  {
  }

  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 22))
  {
  }

  __int16 has = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 98);
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_ipProtocol != *((_DWORD *)v4 + 22)) {
      goto LABEL_130;
    }
  }

  else if ((v11 & 4) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_addressFamily != *((_DWORD *)v4 + 16)) {
      goto LABEL_130;
    }
  }

  else if ((v11 & 1) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_trafficClass != *((_DWORD *)v4 + 43)) {
      goto LABEL_130;
    }
  }

  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_dataMode != *((_DWORD *)v4 + 17)) {
      goto LABEL_130;
    }
  }

  else if ((v11 & 2) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_requiredInterfaceType != *((_DWORD *)v4 + 42)) {
      goto LABEL_130;
    }
  }

  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x400) == 0) {
      goto LABEL_130;
    }
    if (self->_prohibitExpensive)
    {
      if (!*((_BYTE *)v4 + 188)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 188))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x400) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0) {
      goto LABEL_130;
    }
    if (self->_fastOpen)
    {
      if (!*((_BYTE *)v4 + 184)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 184))
    {
      goto LABEL_130;
    }
  }

  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x800) == 0) {
      goto LABEL_130;
    }
    if (self->_reduceBuffering)
    {
      if (!*((_BYTE *)v4 + 189)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 189))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x800) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x100) == 0) {
      goto LABEL_130;
    }
    if (self->_longOutstandingQueries)
    {
      if (!*((_BYTE *)v4 + 186)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 186))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x100) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x2000) == 0) {
      goto LABEL_130;
    }
    if (self->_useAWDL)
    {
      if (!*((_BYTE *)v4 + 191)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 191))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x2000) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x4000) == 0) {
      goto LABEL_130;
    }
    if (self->_useP2P)
    {
      if (!*((_BYTE *)v4 + 192)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 192))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x4000) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x1000) == 0) {
      goto LABEL_130;
    }
    if (self->_reuseLocalAddress)
    {
      if (!*((_BYTE *)v4 + 190)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 190))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
    goto LABEL_130;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x200) == 0) {
      goto LABEL_130;
    }
    if (self->_noFallback)
    {
      if (!*((_BYTE *)v4 + 187)) {
        goto LABEL_130;
      }
    }

    else if (*((_BYTE *)v4 + 187))
    {
      goto LABEL_130;
    }
  }

  else if ((*((_WORD *)v4 + 98) & 0x200) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_multipathService != *((_DWORD *)v4 + 28)) {
      goto LABEL_130;
    }
  }

  else if ((v11 & 8) != 0)
  {
    goto LABEL_130;
  }

  if ((has & 0x80) == 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_114;
    }
LABEL_130:
    char v19 = 0;
    goto LABEL_131;
  }

  if ((v11 & 0x80) == 0) {
    goto LABEL_130;
  }
  if (!self->_keepalive)
  {
    if (!*((_BYTE *)v4 + 185)) {
      goto LABEL_114;
    }
    goto LABEL_130;
  }

  if (!*((_BYTE *)v4 + 185)) {
    goto LABEL_130;
  }
LABEL_114:
  localEndpoint = self->_localEndpoint;
  requiredInterface = self->_requiredInterface;
  if ((unint64_t)requiredInterface | *((void *)v4 + 20))
  {
    if (!-[NWPBInterface isEqual:](requiredInterface, "isEqual:")) {
      goto LABEL_130;
    }
  }

  prohibitedInterfaces = self->_prohibitedInterfaces;
  if ((unint64_t)prohibitedInterfaces | *((void *)v4 + 17))
  {
  }

  prohibitedAgents = self->_prohibitedAgents;
  if ((unint64_t)prohibitedAgents | *((void *)v4 + 16))
  {
  }

  requiredAgents = self->_requiredAgents;
  if ((unint64_t)requiredAgents | *((void *)v4 + 19))
  {
  }

  preferredAgents = self->_preferredAgents;
  if ((unint64_t)preferredAgents | *((void *)v4 + 15))
  {
  }

  metadata = self->_metadata;
  else {
    char v19 = 1;
  }
LABEL_131:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_account, "hash");
  NSUInteger v4 = -[NSString hash](self->_effectiveBundleID, "hash");
  NSUInteger v5 = -[NSString hash](self->_effectiveProcessUUID, "hash");
  NSUInteger v6 = -[NSString hash](self->_realProcessUUID, "hash");
  NSUInteger v7 = -[NSString hash](self->_url, "hash");
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v9 = 2654435761LL * self->_ipProtocol;
    if ((has & 1) != 0)
    {
LABEL_3:
      uint64_t v10 = 2654435761LL * self->_addressFamily;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    if ((has & 1) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v10 = 0LL;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v11 = 2654435761LL * self->_trafficClass;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }

- (void).cxx_destruct
{
}

@end