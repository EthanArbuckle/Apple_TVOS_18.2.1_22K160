@interface MicroPaymentDownload
+ (id)downloadEntityFromContext:(id)a3;
+ (id)propertiesForDownloadEntities;
- (id)copySKDownload;
- (void)awakeFromInsert;
- (void)setValuesWithAssetDictionary:(id)a3;
@end

@implementation MicroPaymentDownload

+ (id)downloadEntityFromContext:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  @"MicroPaymentDownload");
}

+ (id)propertiesForDownloadEntities
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"contentLength",  @"downloadID",  @"downloadKey",  @"hashArrayData",  @"hashChunkSize",  @"remoteURL",  @"sinfs",  @"state",  0LL);
}

- (id)copySKDownload
{
  id v3 = objc_alloc_init((Class)sub_100146894());
  objc_msgSend(v3, "_setDownloadID:", -[MicroPaymentDownload downloadID](self, "downloadID"));
  v4 = (char *)objc_msgSend(-[MicroPaymentDownload state](self, "state"), "integerValue");
  else {
    uint64_t v5 = 6LL - (void)v4;
  }
  [v3 _setDownloadState:v5];
  objc_msgSend(v3, "_setVersion:", -[MicroPaymentDownload version](self, "version"));
  objc_msgSend(v3, "_setContentLength:", -[MicroPaymentDownload contentLength](self, "contentLength"));
  v6 = (NSURL *)-[MicroPaymentDownload localURL](self, "localURL");
  if (v6) {
    v6 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6);
  }
  [v3 _setContentURL:v6];
  id v7 = -[MicroPaymentDownload error](self, "error");
  if (v7) {
    id v8 = sub_10014687C((uint64_t)v7);
  }
  else {
    id v8 = 0LL;
  }
  [v3 _setError:v8];
  return v3;
}

- (void)setValuesWithAssetDictionary:(id)a3
{
  id v5 = [a3 objectForKey:@"downloadKey"];
  if (!v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v5, v6) & 1) != 0)) {
    -[MicroPaymentDownload setDownloadKey:](self, "setDownloadKey:", v5);
  }
  id v7 = [a3 objectForKey:@"file-size"];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    -[MicroPaymentDownload setContentLength:](self, "setContentLength:", v7);
  }
  id v9 = [a3 objectForKey:@"chunks"];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    id v17 = [a3 objectForKey:@"md5"];
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
      v12 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v17);
    }
    else {
      v12 = 0LL;
    }
    id v11 = 0LL;
LABEL_16:
    -[MicroPaymentDownload setHashChunkSize:](self, "setHashChunkSize:", v11);
    if (v12) {
      goto LABEL_10;
    }
LABEL_17:
    v16 = self;
    v15 = 0LL;
    goto LABEL_18;
  }

  id v11 = [v9 objectForKey:@"chunkSize"];
  v12 = (NSArray *)[v9 objectForKey:@"hashes"];
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
    goto LABEL_16;
  }
  if (!v12) {
    goto LABEL_17;
  }
LABEL_10:
  v14 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v12,  200LL,  0LL,  0LL);
  if (!v14) {
    goto LABEL_19;
  }
  v15 = v14;
  v16 = self;
LABEL_18:
  -[MicroPaymentDownload setHashArrayData:](v16, "setHashArrayData:", v15);
LABEL_19:
  id v19 = [a3 objectForKey:@"sinfs"];
  if (!v19)
  {
    v24 = self;
    v23 = 0LL;
    goto LABEL_24;
  }

  id v20 = v19;
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    v22 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v20,  200LL,  0LL,  0LL);
    if (v22)
    {
      v23 = v22;
      v24 = self;
LABEL_24:
      -[MicroPaymentDownload setSinfs:](v24, "setSinfs:", v23);
    }
  }

  id v25 = [a3 objectForKey:@"URL"];
  if (!v25 || (uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v25, v26) & 1) != 0)) {
    -[MicroPaymentDownload setRemoteURL:](self, "setRemoteURL:", v25);
  }
  id v27 = [a3 objectForKey:@"version"];
  if (!v27 || (uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v27, v28) & 1) != 0)) {
    -[MicroPaymentDownload setVersion:](self, "setVersion:", v27);
  }
}

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MicroPaymentDownload;
  -[MicroPaymentDownload awakeFromInsert](&v5, "awakeFromInsert");
  id v3 = CFUUIDCreate(0LL);
  v4 = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  (unint64_t)*(_OWORD *)&CFUUIDGetUUIDBytes(v3));
  -[MicroPaymentDownload setDownloadID:](self, "setDownloadID:", v4);

  CFRelease(v3);
}

@end