@interface MPIdentifierSet
+ (BOOL)tvm_isIdentifierUniversalCloudLibraryID:(id)a3;
+ (id)_activeAccountDSID;
+ (id)tvm_identiferSetForAlbumWithCloudAlbumID:(id)a3;
+ (id)tvm_identiferSetForAlbumWithStoreID:(int64_t)a3 subscriptionID:(int64_t)a4;
+ (id)tvm_identiferSetForRadioStationStringID:(id)a3;
+ (id)tvm_identiferSetForSongWithCloudID:(unint64_t)a3;
+ (id)tvm_identiferSetForSongWithPersistentID:(int64_t)a3;
+ (id)tvm_identiferSetForSongWithStoreID:(int64_t)a3 subscriptionID:(int64_t)a4;
+ (id)tvm_identifierSetForModelKind:(id)a3 withPersistentID:(int64_t)a4;
+ (id)tvm_identifierSetForModelKind:(id)a3 withStoreID:(int64_t)a4 subscriptionID:(int64_t)a5;
+ (id)tvm_identifierSetForPlaylistWithCloudID:(unint64_t)a3;
+ (id)tvm_identifierSetForPlaylistWithGlobalID:(id)a3;
+ (id)tvm_identifierSetForPlaylistWithPersistentID:(int64_t)a3;
+ (id)tvm_identifierSetForPlaylistWithUniversalCloudLibraryID:(id)a3;
+ (id)tvm_identifierSetForSongWithCloudAlbumID:(id)a3;
+ (id)tvm_identifierSetForSongWithPersistentID:(int64_t)a3 cloudID:(int64_t)a4 storeID:(int64_t)a5 subscriptionID:(int64_t)a6;
+ (id)tvm_identifierSetForSongWithUniversalCloudLibraryID:(id)a3;
+ (void)_setActiveUserIDForMutableIdentifierSet:(id)a3;
- (id)tvm_dictionaryRepresentation;
@end

@implementation MPIdentifierSet

+ (BOOL)tvm_isIdentifierUniversalCloudLibraryID:(id)a3
{
  id v3 = a3;
  BOOL v4 = (unint64_t)[v3 length] >= 3
    && [v3 characterAtIndex:1] == 46;

  return v4;
}

- (id)tvm_dictionaryRepresentation
{
  unsigned int outCount = 0;
  id v3 = (objc_class *)objc_opt_class(self, a2);
  BOOL v4 = class_copyPropertyList(v3, &outCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  outCount));
  if (outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      v7 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  property_getName(v4[i]),  4LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (![v8 length]
        || ([v8 isEqualToString:@"humanDescription"] & 1) != 0)
      {
        goto LABEL_17;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPIdentifierSet valueForKey:](self, "valueForKey:", v8));
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        if ([v9 length]) {
          goto LABEL_10;
        }
      }

      else
      {
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v12);
        if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
        {
          if ([v9 count])
          {
LABEL_10:
            id v15 = v9;
            goto LABEL_11;
          }
        }

        else
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
          if ((objc_opt_isKindOfClass(v9, v17) & 1) != 0 && [v9 longLongValue])
          {
            id v15 = (id)objc_claimAutoreleasedReturnValue([v9 stringValue]);
LABEL_11:
            v16 = v15;
            if (v15)
            {
              [v5 setObject:v15 forKeyedSubscript:v8];
            }
          }
        }
      }

LABEL_17:
    }
  }

  free(v4);
  return v5;
}

+ (id)tvm_identiferSetForSongWithPersistentID:(int64_t)a3
{
  return objc_msgSend(a1, "tvm_identifierSetForSongWithPersistentID:cloudID:storeID:subscriptionID:", a3, 0, 0, 0);
}

+ (id)tvm_identiferSetForSongWithCloudID:(unint64_t)a3
{
  return objc_msgSend(a1, "tvm_identifierSetForSongWithPersistentID:cloudID:storeID:subscriptionID:", 0, a3, 0, 0);
}

+ (id)tvm_identifierSetForSongWithUniversalCloudLibraryID:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSongKind identityKind](&OBJC_CLASS___MPModelSongKind, "identityKind"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100019CC4;
  v9[3] = &unk_1002697E8;
  id v10 = v3;
  id v6 = v3;
  v7 = -[MPIdentifierSet initWithModelKind:block:](v4, "initWithModelKind:block:", v5, v9);

  return v7;
}

+ (id)tvm_identifierSetForSongWithCloudAlbumID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSongKind identityKind](&OBJC_CLASS___MPModelSongKind, "identityKind"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100019D90;
  v10[3] = &unk_100269838;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  v8 = -[MPIdentifierSet initWithModelKind:block:](v5, "initWithModelKind:block:", v6, v10);

  return v8;
}

+ (id)tvm_identiferSetForSongWithStoreID:(int64_t)a3 subscriptionID:(int64_t)a4
{
  return objc_msgSend(a1, "tvm_identifierSetForSongWithPersistentID:cloudID:storeID:subscriptionID:", 0, 0, a3, a4);
}

+ (id)tvm_identifierSetForSongWithPersistentID:(int64_t)a3 cloudID:(int64_t)a4 storeID:(int64_t)a5 subscriptionID:(int64_t)a6
{
  id v11 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSongKind identityKind](&OBJC_CLASS___MPModelSongKind, "identityKind"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100019F0C;
  v15[3] = &unk_1002698B8;
  v15[4] = a3;
  v15[5] = a1;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  uint64_t v13 = -[MPIdentifierSet initWithModelKind:block:](v11, "initWithModelKind:block:", v12, v15);

  return v13;
}

+ (id)tvm_identifierSetForPlaylistWithPersistentID:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistKind identityKind](&OBJC_CLASS___MPModelPlaylistKind, "identityKind"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvm_identifierSetForModelKind:withPersistentID:", v5, a3));

  return v6;
}

+ (id)tvm_identifierSetForPlaylistWithCloudID:(unint64_t)a3
{
  v5 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistKind identityKind](&OBJC_CLASS___MPModelPlaylistKind, "identityKind"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001A1BC;
  v9[3] = &unk_1002698D8;
  void v9[4] = a1;
  v9[5] = a3;
  id v7 = -[MPIdentifierSet initWithModelKind:block:](v5, "initWithModelKind:block:", v6, v9);

  return v7;
}

+ (id)tvm_identifierSetForPlaylistWithUniversalCloudLibraryID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistKind identityKind](&OBJC_CLASS___MPModelPlaylistKind, "identityKind"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001A308;
  v9[3] = &unk_1002697E8;
  id v10 = v3;
  id v6 = v3;
  id v7 = -[MPIdentifierSet initWithModelKind:block:](v4, "initWithModelKind:block:", v5, v9);

  return v7;
}

+ (id)tvm_identifierSetForPlaylistWithGlobalID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistKind identityKind](&OBJC_CLASS___MPModelPlaylistKind, "identityKind"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001A438;
  v10[3] = &unk_100269838;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  v8 = -[MPIdentifierSet initWithModelKind:block:](v5, "initWithModelKind:block:", v6, v10);

  return v8;
}

+ (id)tvm_identiferSetForAlbumWithStoreID:(int64_t)a3 subscriptionID:(int64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbumKind identityKind](&OBJC_CLASS___MPModelAlbumKind, "identityKind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvm_identifierSetForModelKind:withStoreID:subscriptionID:", v7, a3, a4));

  return v8;
}

+ (id)tvm_identiferSetForAlbumWithCloudAlbumID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbumKind identityKind](&OBJC_CLASS___MPModelAlbumKind, "identityKind"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001A5E4;
  v10[3] = &unk_100269838;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  v8 = -[MPIdentifierSet initWithModelKind:block:](v5, "initWithModelKind:block:", v6, v10);

  return v8;
}

+ (id)tvm_identiferSetForRadioStationStringID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___MPIdentifierSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelRadioStationKind identityKind](&OBJC_CLASS___MPModelRadioStationKind, "identityKind"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001A740;
  v10[3] = &unk_100269838;
  id v11 = v4;
  id v12 = a1;
  id v7 = v4;
  v8 = -[MPIdentifierSet initWithModelKind:block:](v5, "initWithModelKind:block:", v6, v10);

  return v8;
}

+ (id)tvm_identifierSetForModelKind:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001A860;
  v9[3] = &unk_1002698D8;
  void v9[4] = a4;
  v9[5] = a1;
  id v7 = -[MPIdentifierSet initWithModelKind:block:]( objc_alloc(&OBJC_CLASS___MPIdentifierSet),  "initWithModelKind:block:",  v6,  v9);

  return v7;
}

+ (id)tvm_identifierSetForModelKind:(id)a3 withStoreID:(int64_t)a4 subscriptionID:(int64_t)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001A9C0;
  v11[3] = &unk_100269948;
  v11[4] = a4;
  v11[5] = a5;
  v11[6] = a1;
  v9 = -[MPIdentifierSet initWithModelKind:block:]( objc_alloc(&OBJC_CLASS___MPIdentifierSet),  "initWithModelKind:block:",  v8,  v11);

  return v9;
}

+ (id)_activeAccountDSID
{
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 activeAccountIdentifier]);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentityStore defaultIdentityStore]( &OBJC_CLASS___ICUserIdentityStore,  "defaultIdentityStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    v2 = (void *)objc_claimAutoreleasedReturnValue([v4 DSIDForUserIdentity:v5 outError:0]);

    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 stringValue]);
  }

  id v6 = (void *)v3;

  return v6;
}

+ (void)_setActiveUserIDForMutableIdentifierSet:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeAccountDSID]);
  if (v4) {
    [v5 setPersonalStoreIdentifiersWithPersonID:v4 block:&stru_100269988];
  }
}

@end