@interface NWPBPath
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBPath

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBPath;
  v4 = -[NWPBPath description](&v8, sel_description);
  v5 = -[NWPBPath dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  endpoint = self->_endpoint;
  if (endpoint)
  {
    v5 = -[NWPBEndpoint dictionaryRepresentation](endpoint, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"endpoint"];
  }

  parameters = self->_parameters;
  if (parameters)
  {
    v7 = -[NWPBParameters dictionaryRepresentation](parameters, "dictionaryRepresentation");
    [v3 setObject:v7 forKey:@"parameters"];
  }

  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v10 = off_189BC56C0[status];
    }

    [v3 setObject:v10 forKey:@"status"];
  }

  directInterface = self->_directInterface;
  if (directInterface)
  {
    v12 = -[NWPBInterface dictionaryRepresentation](directInterface, "dictionaryRepresentation");
    [v3 setObject:v12 forKey:@"directInterface"];
  }

  delegateInterface = self->_delegateInterface;
  if (delegateInterface)
  {
    v14 = -[NWPBInterface dictionaryRepresentation](delegateInterface, "dictionaryRepresentation");
    [v3 setObject:v14 forKey:@"delegateInterface"];
  }

  if (-[NSMutableArray count](self->_agents, "count"))
  {
    v15 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_agents, "count"));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v16 = self->_agents;
    uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 addObject:v21];
        }

        uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v18);
    }

    [v3 setObject:v15 forKey:@"agents"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_ipv4];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v25 forKey:@"ipv4"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_27:
      if ((has & 0x10) == 0) {
        goto LABEL_28;
      }
LABEL_33:
      [MEMORY[0x189607968] numberWithBool:self->_local];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v27 forKey:@"local"];

      if ((*(_BYTE *)&self->_has & 2) == 0) {
        return v3;
      }
      goto LABEL_29;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_27;
  }

  [MEMORY[0x189607968] numberWithBool:self->_ipv6];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v26 forKey:@"ipv6"];

  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_33;
  }
LABEL_28:
  if ((has & 2) != 0)
  {
LABEL_29:
    [MEMORY[0x189607968] numberWithBool:self->_direct];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v23 forKey:@"direct"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_parameters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_clientUUID) {
    PBDataWriterWriteStringField();
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_directInterface) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_delegateInterface) {
    PBDataWriterWriteSubmessage();
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v5 = self->_agents;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }

      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 0x10) == 0) {
        goto LABEL_23;
      }
LABEL_28:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }

  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_28;
  }
LABEL_23:
  if ((has & 2) != 0) {
LABEL_24:
  }
    PBDataWriterWriteBOOLField();
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[NWPBEndpoint copyWithZone:](self->_endpoint, "copyWithZone:", a3);
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = -[NWPBParameters copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  __int128 v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_status;
    *(_BYTE *)(v5 + 64) |= 1u;
  }

  id v12 = -[NWPBInterface copyWithZone:](self->_directInterface, "copyWithZone:", a3);
  __int128 v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  id v14 = -[NWPBInterface copyWithZone:](self->_delegateInterface, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v16 = self->_agents;
  uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = (id)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        v22 = *(void **)(v5 + 8);
        if (!v22)
        {
          id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
          v24 = *(void **)(v5 + 8);
          *(void *)(v5 + 8) = v23;

          v22 = *(void **)(v5 + 8);
        }

        [v22 addObject:v21];
      }

      uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    }

    while (v18);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 61) = self->_ipv4;
    *(_BYTE *)(v5 + 64) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0) {
        goto LABEL_15;
      }
LABEL_20:
      *(_BYTE *)(v5 + 63) = self->_local;
      *(_BYTE *)(v5 + 64) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 2) == 0) {
        return (id)v5;
      }
      goto LABEL_16;
    }
  }

  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }

  *(_BYTE *)(v5 + 62) = self->_ipv6;
  *(_BYTE *)(v5 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_15:
  if ((has & 2) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 60) = self->_direct;
    *(_BYTE *)(v5 + 64) |= 2u;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  endpoint = self->_endpoint;
  if ((unint64_t)endpoint | *((void *)v4 + 5))
  {
  }

  parameters = self->_parameters;
  if ((unint64_t)parameters | *((void *)v4 + 6))
  {
    if (!-[NWPBParameters isEqual:](parameters, "isEqual:")) {
      goto LABEL_45;
    }
  }

  clientUUID = self->_clientUUID;
  if ((unint64_t)clientUUID | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_status != *((_DWORD *)v4 + 14)) {
      goto LABEL_45;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_45;
  }

  directInterface = self->_directInterface;
  if ((unint64_t)directInterface | *((void *)v4 + 4)
    && !-[NWPBInterface isEqual:](directInterface, "isEqual:"))
  {
    goto LABEL_45;
  }

  delegateInterface = self->_delegateInterface;
  if ((unint64_t)delegateInterface | *((void *)v4 + 3))
  {
    if (!-[NWPBInterface isEqual:](delegateInterface, "isEqual:")) {
      goto LABEL_45;
    }
  }

  agents = self->_agents;
  if ((unint64_t)agents | *((void *)v4 + 1))
  {
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0) {
      goto LABEL_45;
    }
    if (self->_ipv4)
    {
      if (!*((_BYTE *)v4 + 61)) {
        goto LABEL_45;
      }
    }

    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_45;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_45;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0) {
      goto LABEL_45;
    }
    if (self->_ipv6)
    {
      if (!*((_BYTE *)v4 + 62)) {
        goto LABEL_45;
      }
    }

    else if (*((_BYTE *)v4 + 62))
    {
      goto LABEL_45;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_45;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0) {
      goto LABEL_45;
    }
    if (self->_local)
    {
      if (!*((_BYTE *)v4 + 63)) {
        goto LABEL_45;
      }
    }

    else if (*((_BYTE *)v4 + 63))
    {
      goto LABEL_45;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_45;
  }

  BOOL v11 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) != 0)
    {
      if (self->_direct)
      {
        if (!*((_BYTE *)v4 + 60)) {
          goto LABEL_45;
        }
      }

      else if (*((_BYTE *)v4 + 60))
      {
        goto LABEL_45;
      }

      BOOL v11 = 1;
      goto LABEL_46;
    }

- (unint64_t)hash
{
  unint64_t v3 = -[NWPBEndpoint hash](self->_endpoint, "hash");
  unint64_t v4 = -[NWPBParameters hash](self->_parameters, "hash");
  NSUInteger v5 = -[NSString hash](self->_clientUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v6 = 2654435761LL * self->_status;
  }
  else {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = -[NWPBInterface hash](self->_directInterface, "hash");
  unint64_t v8 = -[NWPBInterface hash](self->_delegateInterface, "hash");
  uint64_t v9 = -[NSMutableArray hash](self->_agents, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761LL * self->_ipv4;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v11 = 2654435761LL * self->_ipv6;
      if ((*(_BYTE *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v12 = 0LL;
      if ((*(_BYTE *)&self->_has & 2) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v13 = 0LL;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }

  uint64_t v11 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v12 = 2654435761LL * self->_local;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v13 = 2654435761LL * self->_direct;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void).cxx_destruct
{
}

@end