@interface NWPBCloseConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBCloseConnection

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWPBCloseConnection;
  v4 = -[NWPBCloseConnection description](&v8, sel_description);
  v5 = -[NWPBCloseConnection dictionaryRepresentation](self, "dictionaryRepresentation");
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
      v14 = (char *)a3 + *v9;
      if (*v14) {
        goto LABEL_48;
      }
      if (v6 >= v8) {
        break;
      }
      char v15 = *(_BYTE *)(*(void *)((char *)a3 + *v11) + v6);
      *(void *)((char *)a3 + (int)v5) = v6 + 1;
      unint64_t v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0) {
        goto LABEL_39;
      }
      uint64_t v17 = *v4;
      unint64_t v18 = *(void *)((char *)a3 + v17);
      unint64_t v19 = v18 + 1;
      int v20 = *(char *)(*(void *)((char *)a3 + *v11) + v18);
      *(void *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v21 = *v4;
      unint64_t v22 = *(void *)((char *)a3 + v21);
      unint64_t v23 = v22 + 1;
      int v24 = *(char *)(*(void *)((char *)a3 + *v11) + v22);
      *(void *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v25 = *v4;
      unint64_t v26 = *(void *)((char *)a3 + v25);
      unint64_t v27 = v26 + 1;
      int v28 = *(char *)(*(void *)((char *)a3 + *v11) + v26);
      *(void *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v29 = *v4;
      unint64_t v30 = *(void *)((char *)a3 + v29);
      unint64_t v31 = v30 + 1;
      int v32 = *(char *)(*(void *)((char *)a3 + *v11) + v30);
      *(void *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v33 = *v4;
      unint64_t v34 = *(void *)((char *)a3 + v33);
      unint64_t v35 = v34 + 1;
      int v36 = *(char *)(*(void *)((char *)a3 + *v11) + v34);
      *(void *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v37 = *v4;
      unint64_t v38 = *(void *)((char *)a3 + v37);
      unint64_t v39 = v38 + 1;
      int v40 = *(char *)(*(void *)((char *)a3 + *v11) + v38);
      *(void *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v41 = *v4;
      unint64_t v42 = *(void *)((char *)a3 + v41);
      unint64_t v43 = v42 + 1;
      int v44 = *(char *)(*(void *)((char *)a3 + *v11) + v42);
      *(void *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v45 = *v4;
      unint64_t v46 = *(void *)((char *)a3 + v45);
      unint64_t v47 = v46 + 1;
      int v48 = *(char *)(*(void *)((char *)a3 + *v11) + v46);
      *(void *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0) {
        goto LABEL_39;
      }
      uint64_t v49 = *v4;
      unint64_t v50 = *(void *)((char *)a3 + v49);
      if (v50 == -1LL || v50 >= *(void *)((char *)a3 + *v7))
      {
LABEL_37:
        v14 = (char *)a3 + *v9;
        goto LABEL_38;
      }

      unint64_t v51 = v50 + 1;
      int v52 = *(char *)(*(void *)((char *)a3 + *v11) + v50);
      *(void *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        unint64_t v16 = 0LL;
        int v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_41;
      }

- (void)writeTo:(id)a3
{
  if (self->_clientUUID) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    clientUUID = self->_clientUUID;
    else {
      char v6 = 1;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_clientUUID, "hash");
}

- (void).cxx_destruct
{
}

@end