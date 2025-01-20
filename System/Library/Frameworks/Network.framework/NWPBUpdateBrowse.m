@interface NWPBUpdateBrowse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBUpdateBrowse

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBUpdateBrowse;
  v4 = -[NWPBUpdateBrowse description](&v8, sel_description);
  v5 = -[NWPBUpdateBrowse dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }
  if (-[NSMutableArray count](self->_discoveredEndpoints, "count"))
  {
    v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_discoveredEndpoints, "count"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v7 = self->_discoveredEndpoints;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 addObject:v12];
        }

        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"discoveredEndpoints"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x189611CF0];
  uint64_t v5 = (int)*MEMORY[0x189611CF0];
  unint64_t v6 = *(void *)((char *)a3 + v5);
  v7 = (int *)MEMORY[0x189611CE8];
  unint64_t v8 = *(void *)((char *)a3 + (int)*MEMORY[0x189611CE8]);
  uint64_t v9 = (int *)MEMORY[0x189611CE0];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      __int128 v14 = (char *)a3 + *v9;
      if (*v14) {
        return *((_BYTE *)a3 + *v9) == 0;
      }
      if (v6 >= v8) {
        break;
      }
      char v15 = *(_BYTE *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0) {
        goto LABEL_40;
      }
      uint64_t v17 = *v4;
      unint64_t v18 = *(void *)((char *)a3 + v17);
      unint64_t v19 = v18 + 1;
      int v20 = *(char *)(*(void *)((char *)a3 + *v11) + v18);
      *(void *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v21 = *v4;
      unint64_t v22 = *(void *)((char *)a3 + v21);
      unint64_t v23 = v22 + 1;
      int v24 = *(char *)(*(void *)((char *)a3 + *v11) + v22);
      *(void *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v25 = *v4;
      unint64_t v26 = *(void *)((char *)a3 + v25);
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + *v11) + v26);
      *(void *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v29 = *v4;
      unint64_t v30 = *(void *)((char *)a3 + v29);
      unint64_t v31 = v30 + 1;
      int v32 = *(char *)(*(void *)((char *)a3 + *v11) + v30);
      *(void *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v33 = *v4;
      unint64_t v34 = *(void *)((char *)a3 + v33);
      unint64_t v35 = v34 + 1;
      int v36 = *(char *)(*(void *)((char *)a3 + *v11) + v34);
      *(void *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v37 = *v4;
      unint64_t v38 = *(void *)((char *)a3 + v37);
      unint64_t v39 = v38 + 1;
      int v40 = *(char *)(*(void *)((char *)a3 + *v11) + v38);
      *(void *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v41 = *v4;
      unint64_t v42 = *(void *)((char *)a3 + v41);
      unint64_t v43 = v42 + 1;
      int v44 = *(char *)(*(void *)((char *)a3 + *v11) + v42);
      *(void *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v45 = *v4;
      unint64_t v46 = *(void *)((char *)a3 + v45);
      unint64_t v47 = v46 + 1;
      int v48 = *(char *)(*(void *)((char *)a3 + *v11) + v46);
      *(void *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v49 = *v4;
      unint64_t v50 = *(void *)((char *)a3 + v49);
      if (v50 == -1LL || v50 >= *(void *)((char *)a3 + *v7))
      {
LABEL_38:
        __int128 v14 = (char *)a3 + *v9;
        goto LABEL_39;
      }

      unint64_t v51 = v50 + 1;
      int v52 = *(char *)(*(void *)((char *)a3 + *v11) + v50);
      *(void *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        unint64_t v16 = 0LL;
        int v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_clientUUID) {
    PBDataWriterWriteStringField();
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v5 = self->_discoveredEndpoints;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v8 = self->_discoveredEndpoints;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "copyWithZone:", a3, (void)v18);
        __int128 v14 = (void *)v5[2];
        if (!v14)
        {
          id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
          unint64_t v16 = (void *)v5[2];
          v5[2] = v15;

          __int128 v14 = (void *)v5[2];
        }

        [v14 addObject:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientUUID = self->_clientUUID, !((unint64_t)clientUUID | v4[1]))
     || -[NSString isEqual:](clientUUID, "isEqual:")))
  {
    discoveredEndpoints = self->_discoveredEndpoints;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_clientUUID, "hash");
  return -[NSMutableArray hash](self->_discoveredEndpoints, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

@end