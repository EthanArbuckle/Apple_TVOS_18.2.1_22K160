@interface CPLCloudKitResourceInfo
- (BOOL)hasFileSize;
- (BOOL)hasFileUTI;
- (BOOL)hasImageDimensions;
- (BOOL)hasStableHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CPLCloudKitResourceInfoImageDimensions)imageDimensions;
- (NSString)fileUTI;
- (NSString)stableHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileUTI:(id)a3;
- (void)setHasFileSize:(BOOL)a3;
- (void)setImageDimensions:(id)a3;
- (void)setStableHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitResourceInfo

- (void)setFileSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasImageDimensions
{
  return self->_imageDimensions != 0LL;
}

- (BOOL)hasFileUTI
{
  return self->_fileUTI != 0LL;
}

- (BOOL)hasStableHash
{
  return self->_stableHash != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLCloudKitResourceInfo;
  id v3 = -[CPLCloudKitResourceInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitResourceInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_fileSize));
    [v3 setObject:v4 forKey:@"fileSize"];
  }

  imageDimensions = self->_imageDimensions;
  if (imageDimensions)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitResourceInfoImageDimensions dictionaryRepresentation]( imageDimensions,  "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"imageDimensions"];
  }

  fileUTI = self->_fileUTI;
  if (fileUTI) {
    [v3 setObject:fileUTI forKey:@"fileUTI"];
  }
  stableHash = self->_stableHash;
  if (stableHash) {
    [v3 setObject:stableHash forKey:@"stableHash"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitResourceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_fileSize, 1LL);
    id v4 = v8;
  }

  imageDimensions = self->_imageDimensions;
  if (imageDimensions)
  {
    PBDataWriterWriteSubmessage(v8, imageDimensions, 2LL);
    id v4 = v8;
  }

  fileUTI = self->_fileUTI;
  if (fileUTI)
  {
    PBDataWriterWriteStringField(v8, fileUTI, 3LL);
    id v4 = v8;
  }

  stableHash = self->_stableHash;
  if (stableHash)
  {
    PBDataWriterWriteStringField(v8, stableHash, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_fileSize;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  v5 = v4;
  if (self->_imageDimensions)
  {
    objc_msgSend(v4, "setImageDimensions:");
    id v4 = v5;
  }

  if (self->_fileUTI)
  {
    objc_msgSend(v5, "setFileUTI:");
    id v4 = v5;
  }

  if (self->_stableHash)
  {
    objc_msgSend(v5, "setStableHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_fileSize;
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v7 = -[CPLCloudKitResourceInfoImageDimensions copyWithZone:](self->_imageDimensions, "copyWithZone:", a3);
  id v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = -[NSString copyWithZone:](self->_fileUTI, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = -[NSString copyWithZone:](self->_stableHash, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_fileSize != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }

  imageDimensions = self->_imageDimensions;
  if ((unint64_t)imageDimensions | *((void *)v4 + 3)
    && !-[CPLCloudKitResourceInfoImageDimensions isEqual:](imageDimensions, "isEqual:"))
  {
    goto LABEL_13;
  }

  fileUTI = self->_fileUTI;
  if ((unint64_t)fileUTI | *((void *)v4 + 2))
  {
  }

  stableHash = self->_stableHash;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v3 = 2654435761u * self->_fileSize;
  }
  else {
    unint64_t v3 = 0LL;
  }
  unint64_t v4 = -[CPLCloudKitResourceInfoImageDimensions hash](self->_imageDimensions, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_fileUTI, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_stableHash, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  NSUInteger v5 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_fileSize = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  imageDimensions = self->_imageDimensions;
  uint64_t v7 = v5[3];
  unsigned __int8 v8 = v5;
  if (imageDimensions)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CPLCloudKitResourceInfoImageDimensions mergeFrom:](imageDimensions, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CPLCloudKitResourceInfo setImageDimensions:](self, "setImageDimensions:");
  }

  NSUInteger v5 = v8;
LABEL_9:
  if (v5[2])
  {
    -[CPLCloudKitResourceInfo setFileUTI:](self, "setFileUTI:");
    NSUInteger v5 = v8;
  }

  if (v5[4])
  {
    -[CPLCloudKitResourceInfo setStableHash:](self, "setStableHash:");
    NSUInteger v5 = v8;
  }
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (CPLCloudKitResourceInfoImageDimensions)imageDimensions
{
  return self->_imageDimensions;
}

- (void)setImageDimensions:(id)a3
{
}

- (NSString)fileUTI
{
  return self->_fileUTI;
}

- (void)setFileUTI:(id)a3
{
}

- (NSString)stableHash
{
  return self->_stableHash;
}

- (void)setStableHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end