@interface NWPBSendData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBSendData

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBSendData;
  v4 = -[NWPBSendData description](&v8, sel_description);
  v5 = -[NWPBSendData dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }
  messageData = self->_messageData;
  if (messageData) {
    [v4 setObject:messageData forKey:@"messageData"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_receiveWindow];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKey:@"receiveWindow"];
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
  v9 = (int *)MEMORY[0x189611CE0];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      v15 = (char *)a3 + *v9;
      if (*v15) {
        goto LABEL_88;
      }
      if (v6 >= v8) {
        break;
      }
      char v16 = *(_BYTE *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v17 = v16 & 0x7F;
      if ((v16 & 0x80) == 0) {
        goto LABEL_40;
      }
      uint64_t v18 = *v4;
      unint64_t v19 = *(void *)((char *)a3 + v18);
      unint64_t v20 = v19 + 1;
      int v21 = *(char *)(*(void *)((char *)a3 + *v11) + v19);
      *(void *)((char *)a3 + v18) = v20;
      v17 |= (unint64_t)(v21 & 0x7F) << 7;
      if ((v21 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v22 = *v4;
      unint64_t v23 = *(void *)((char *)a3 + v22);
      unint64_t v24 = v23 + 1;
      int v25 = *(char *)(*(void *)((char *)a3 + *v11) + v23);
      *(void *)((char *)a3 + v22) = v24;
      v17 |= (unint64_t)(v25 & 0x7F) << 14;
      if ((v25 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v26 = *v4;
      unint64_t v27 = *(void *)((char *)a3 + v26);
      unint64_t v28 = v27 + 1;
      int v29 = *(char *)(*(void *)((char *)a3 + *v11) + v27);
      *(void *)((char *)a3 + v26) = v28;
      v17 |= (unint64_t)(v29 & 0x7F) << 21;
      if ((v29 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v30 = *v4;
      unint64_t v31 = *(void *)((char *)a3 + v30);
      unint64_t v32 = v31 + 1;
      int v33 = *(char *)(*(void *)((char *)a3 + *v11) + v31);
      *(void *)((char *)a3 + v30) = v32;
      v17 |= (unint64_t)(v33 & 0x7F) << 28;
      if ((v33 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v34 = *v4;
      unint64_t v35 = *(void *)((char *)a3 + v34);
      unint64_t v36 = v35 + 1;
      int v37 = *(char *)(*(void *)((char *)a3 + *v11) + v35);
      *(void *)((char *)a3 + v34) = v36;
      if ((v37 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v38 = *v4;
      unint64_t v39 = *(void *)((char *)a3 + v38);
      unint64_t v40 = v39 + 1;
      int v41 = *(char *)(*(void *)((char *)a3 + *v11) + v39);
      *(void *)((char *)a3 + v38) = v40;
      if ((v41 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v42 = *v4;
      unint64_t v43 = *(void *)((char *)a3 + v42);
      unint64_t v44 = v43 + 1;
      int v45 = *(char *)(*(void *)((char *)a3 + *v11) + v43);
      *(void *)((char *)a3 + v42) = v44;
      if ((v45 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v46 = *v4;
      unint64_t v47 = *(void *)((char *)a3 + v46);
      unint64_t v48 = v47 + 1;
      int v49 = *(char *)(*(void *)((char *)a3 + *v11) + v47);
      *(void *)((char *)a3 + v46) = v48;
      if ((v49 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      uint64_t v50 = *v4;
      unint64_t v51 = *(void *)((char *)a3 + v50);
      if (v51 == -1LL || v51 >= *(void *)((char *)a3 + *v7))
      {
LABEL_38:
        v15 = (char *)a3 + *v9;
        goto LABEL_39;
      }

      unint64_t v52 = v51 + 1;
      int v53 = *(char *)(*(void *)((char *)a3 + *v11) + v51);
      *(void *)((char *)a3 + v50) = v52;
      if (v53 < 0)
      {
        unint64_t v17 = 0LL;
        int v54 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_receiveWindow;
    *(_BYTE *)(v5 + 28) |= 1u;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  clientUUID = self->_clientUUID;
  if ((unint64_t)clientUUID | *((void *)v4 + 1))
  {
  }

  messageData = self->_messageData;
  if ((unint64_t)messageData | *((void *)v4 + 2))
  {
  }

  BOOL v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_receiveWindow == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_clientUUID, "hash");
  uint64_t v4 = -[NSData hash](self->_messageData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v5 = 2654435761LL * self->_receiveWindow;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
}

@end