@interface ICSDKAddToPlaylistRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6 containerID:(unsigned int)a7;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4;
@end

@implementation ICSDKAddToPlaylistRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6 containerID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/containers/%u/cloud-add",  v10,  v7));
  id v16 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v15)),  "initWithAction:databaseID:databaseRevision:opaqueID:bundleID:",  v14,  v10,  v9,  v13,  v12);

  return v16;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001189E0;
  v8[3] = &unk_1001A70E0;
  unsigned int v10 = a3;
  id v9 = a4;
  id v4 = v9;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634353985LL, 2LL, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v6;
}

@end