@interface ExternalDownloadState
- (ExternalDownloadState)init;
- (id)_copyValueForEntity:(int64_t)a3 property:(id)a4 dictionary:(id)a5;
- (id)externalValuesForAssetID:(int64_t)a3;
- (id)externalValuesForDownloadID:(int64_t)a3;
- (id)valueForExternalProperty:(id)a3 ofAssetID:(int64_t)a4;
- (id)valueForExternalProperty:(id)a3 ofDownloadID:(int64_t)a4;
- (void)_setValue:(id)a3 forEntity:(int64_t)a4 property:(id)a5 dictionary:(id)a6;
- (void)_setValues:(id)a3 forEntity:(int64_t)a4 dictionary:(id)a5;
- (void)dealloc;
- (void)removeExternalValuesForAssetID:(int64_t)a3;
- (void)removeExternalValuesForDownloadID:(int64_t)a3;
- (void)setBytesDownloaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5;
- (void)setBytesUploaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5;
- (void)setExternalValuesWithDictionary:(id)a3 forAssetID:(int64_t)a4;
- (void)setExternalValuesWithDictionary:(id)a3 forDownloadID:(int64_t)a4;
- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofAssetID:(int64_t)a5;
- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5;
@end

@implementation ExternalDownloadState

- (ExternalDownloadState)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ExternalDownloadState;
  v2 = -[ExternalDownloadState init](&v4, "init");
  if (v2)
  {
    v2->_externalAssetValues = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_externalDownloadValues = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ExternalDownloadState;
  -[ExternalDownloadState dealloc](&v3, "dealloc");
}

- (id)externalValuesForAssetID:(int64_t)a3
{
  objc_super v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_externalAssetValues, "objectForKey:", v4), "copy");

  return v5;
}

- (id)externalValuesForDownloadID:(int64_t)a3
{
  objc_super v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v5 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_externalDownloadValues, "objectForKey:", v4), "copy");

  return v5;
}

- (void)removeExternalValuesForAssetID:(int64_t)a3
{
  objc_super v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->_externalAssetValues, "removeObjectForKey:", v4);
}

- (void)removeExternalValuesForDownloadID:(int64_t)a3
{
  objc_super v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->_externalDownloadValues, "removeObjectForKey:", v4);
}

- (void)setBytesDownloaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5
{
  uint64_t v9 = SSDownloadAssetExternalPropertyBytesDownloaded;
  id v16 = -[ExternalDownloadState _copyValueForEntity:property:dictionary:]( self,  "_copyValueForEntity:property:dictionary:",  a4,  SSDownloadAssetExternalPropertyBytesDownloaded,  self->_externalAssetValues);
  uint64_t v10 = SSDownloadExternalPropertyBytesDownloaded;
  id v11 = -[ExternalDownloadState _copyValueForEntity:property:dictionary:]( self,  "_copyValueForEntity:property:dictionary:",  a5,  SSDownloadExternalPropertyBytesDownloaded,  self->_externalDownloadValues);
  v12 = v11;
  if (v11) {
    v13 = (char *)[v11 longLongValue];
  }
  else {
    v13 = 0LL;
  }
  int64_t v14 = a3;
  if (v16) {
    int64_t v14 = a3 - (void)[v16 longLongValue];
  }
  v15 = &v13[v14];
  -[ExternalDownloadState _setValue:forEntity:property:dictionary:]( self,  "_setValue:forEntity:property:dictionary:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3),  a4,  v9,  self->_externalAssetValues);
  -[ExternalDownloadState _setValue:forEntity:property:dictionary:]( self,  "_setValue:forEntity:property:dictionary:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15),  a5,  v10,  self->_externalDownloadValues);
}

- (void)setBytesUploaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5
{
  uint64_t v9 = SSDownloadAssetExternalPropertyBytesUploaded;
  id v16 = -[ExternalDownloadState _copyValueForEntity:property:dictionary:]( self,  "_copyValueForEntity:property:dictionary:",  a4,  SSDownloadAssetExternalPropertyBytesUploaded,  self->_externalAssetValues);
  uint64_t v10 = SSDownloadExternalPropertyBytesUploaded;
  id v11 = -[ExternalDownloadState _copyValueForEntity:property:dictionary:]( self,  "_copyValueForEntity:property:dictionary:",  a5,  SSDownloadExternalPropertyBytesUploaded,  self->_externalDownloadValues);
  v12 = v11;
  if (v11) {
    v13 = (char *)[v11 longLongValue];
  }
  else {
    v13 = 0LL;
  }
  int64_t v14 = a3;
  if (v16) {
    int64_t v14 = a3 - (void)[v16 longLongValue];
  }
  v15 = &v13[v14];
  -[ExternalDownloadState _setValue:forEntity:property:dictionary:]( self,  "_setValue:forEntity:property:dictionary:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3),  a4,  v9,  self->_externalAssetValues);
  -[ExternalDownloadState _setValue:forEntity:property:dictionary:]( self,  "_setValue:forEntity:property:dictionary:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15),  a5,  v10,  self->_externalDownloadValues);
}

- (void)setExternalValuesWithDictionary:(id)a3 forAssetID:(int64_t)a4
{
}

- (void)setExternalValuesWithDictionary:(id)a3 forDownloadID:(int64_t)a4
{
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofAssetID:(int64_t)a5
{
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5
{
}

- (id)valueForExternalProperty:(id)a3 ofAssetID:(int64_t)a4
{
  return  -[ExternalDownloadState _copyValueForEntity:property:dictionary:]( self,  "_copyValueForEntity:property:dictionary:",  a4,  a3,  self->_externalAssetValues);
}

- (id)valueForExternalProperty:(id)a3 ofDownloadID:(int64_t)a4
{
  return  -[ExternalDownloadState _copyValueForEntity:property:dictionary:]( self,  "_copyValueForEntity:property:dictionary:",  a4,  a3,  self->_externalDownloadValues);
}

- (id)_copyValueForEntity:(int64_t)a3 property:(id)a4 dictionary:(id)a5
{
  v7 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v8 = objc_msgSend(objc_msgSend(a5, "objectForKey:", v7), "objectForKey:", a4);

  return v8;
}

- (void)_setValue:(id)a3 forEntity:(int64_t)a4 property:(id)a5 dictionary:(id)a6
{
  id v11 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
  id v9 = objc_msgSend(a6, "objectForKey:");
  if (v9)
  {
    if (a3) {
      [v9 setObject:a3 forKey:a5];
    }
    else {
      [v9 removeObjectForKey:a5];
    }
  }

  else if (a3)
  {
    uint64_t v10 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  a5,  0LL);
    [a6 setObject:v10 forKey:v11];
  }
}

- (void)_setValues:(id)a3 forEntity:(int64_t)a4 dictionary:(id)a5
{
  id v9 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
  id v7 = objc_msgSend(a5, "objectForKey:");
  if (v7)
  {
    [v7 addEntriesFromDictionary:a3];
  }

  else if (a3)
  {
    id v8 = [a3 mutableCopy];
    [a5 setObject:v8 forKey:v9];
  }
}

@end