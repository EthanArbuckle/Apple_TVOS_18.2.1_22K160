@interface ICSetFavoriteSongAddToLibraryBehaviorRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5;
- (ICSetFavoriteSongAddToLibraryBehaviorRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 addToLibraryBehavior:(unsigned __int8)a4;
@end

@implementation ICSetFavoriteSongAddToLibraryBehaviorRequest

- (ICSetFavoriteSongAddToLibraryBehaviorRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  *(void *)&a3));
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICSetFavoriteSongAddToLibraryBehaviorRequest;
  v9 = -[ICDRequest initWithAction:](&v12, "initWithAction:", v8);

  if (v9)
  {
    -[ICDRequest setMethod:](v9, "setMethod:", 1LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[ICSetFavoriteSongAddToLibraryBehaviorRequest _bodyDataForDatabaseRevision:addToLibraryBehavior:]( v9,  "_bodyDataForDatabaseRevision:addToLibraryBehavior:",  v6,  v5));
    -[ICDRequest setBodyData:](v9, "setBodyData:", v10);
  }

  return v9;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 addToLibraryBehavior:(unsigned __int8)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B70B0;
  v6[3] = &unk_1001A6240;
  unsigned int v7 = a3;
  unsigned __int8 v8 = a4;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360883LL, 1LL, v6);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5
{
  return  objc_msgSend( objc_alloc((Class)objc_opt_class(a1, a2)),  "initWithDatabaseID:databaseRevision:addToLibraryBehavior:",  *(void *)&a3,  *(void *)&a4,  a5);
}

@end