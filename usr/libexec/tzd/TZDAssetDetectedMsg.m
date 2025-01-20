@interface TZDAssetDetectedMsg
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)assetVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TZDAssetDetectedMsg

+ (id)options
{
  if (qword_100021A98[0] != -1) {
    dispatch_once(qword_100021A98, &stru_10001C968);
  }
  return (id)qword_100021A90;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TZDAssetDetectedMsg;
  id v3 = -[TZDAssetDetectedMsg description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TZDAssetDetectedMsg dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v3 setObject:assetVersion forKey:@"assetVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100005924((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_assetVersion) {
    sub_100016CD4();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_assetVersion, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    assetVersion = self->_assetVersion;
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_assetVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[TZDAssetDetectedMsg setAssetVersion:](self, "setAssetVersion:");
  }
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end