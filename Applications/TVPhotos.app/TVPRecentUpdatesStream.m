@interface TVPRecentUpdatesStream
+ (id)collectionWithDataClient:(id)a3 accessObject:(id)a4;
+ (id)idForAppleAccount:(id)a3;
- (ACAccount)appleAccount;
- (TVPRecentUpdatesStream)initWithDataClient:(id)a3;
- (TVPRecentUpdatesStream)initWithDataClient:(id)a3 appleAccount:(id)a4;
- (id)concreteValueForProperty:(id)a3;
- (void)setAppleAccount:(id)a3;
@end

@implementation TVPRecentUpdatesStream

+ (id)idForAppleAccount:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "aa_personID"));
  v4 = (void *)v3;
  if (v3) {
    v5 = (const __CFString *)v3;
  }
  else {
    v5 = @"invalid_id";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([@"Recents_" stringByAppendingString:v5]);

  return v6;
}

+ (id)collectionWithDataClient:(id)a3 accessObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 appleAccount]);
  id v10 = [v8 initWithDataClient:v6 appleAccount:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 albumIDs]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 nextObject]);
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = 0LL;
    do
    {
      v14 += (uint64_t)[v7 numberOfAssetsForAlbumID:v13];
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 nextObject]);

      v13 = (void *)v15;
    }

    while (v15);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
  [v10 setObject:v16 forKey:TVCKDataPropertyCollectionItemCount];
  [v10 setObject:v16 forKey:TVCKDataPropertyCollectionCount];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 albums]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nextObject]);
  BOOL v19 = v18 != 0LL;
  if (v18)
  {
    while (1)
    {
      if ([v18 isViewable])
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 GUID]);
        unsigned __int8 v21 = [v7 isAlbumUnviewedForAlbumID:v20];

        if ((v21 & 1) != 0) {
          break;
        }
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 nextObject]);

      BOOL v19 = v22 != 0LL;
      v18 = v22;
      if (!v22) {
        goto LABEL_12;
      }
    }
  }

  v22 = v18;
LABEL_12:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  [v10 setObject:v23 forKey:TVCKDataPropertyHasNewContent];

  return v10;
}

- (TVPRecentUpdatesStream)initWithDataClient:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[TVPRecentUpdatesStream initWithDataClient:]", "TVPStream.m", 280, "NO");
}

- (TVPRecentUpdatesStream)initWithDataClient:(id)a3 appleAccount:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPRecentUpdatesStream;
  id v8 = -[TVPRecentUpdatesStream initWithDataClient:](&v11, "initWithDataClient:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_appleAccount, a4);
  }

  return v9;
}

- (id)concreteValueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:TVCKDataPropertyName])
  {
    v5 = @"PhotoStreamRecentUpdatesMenuItemTitle";
    goto LABEL_13;
  }

  if ([v4 isEqualToString:TVCKDataPropertyID])
  {
    id v7 = (void *)objc_opt_class(self, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRecentUpdatesStream appleAccount](self, "appleAccount"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 idForAppleAccount:v8]);
LABEL_5:

    goto LABEL_13;
  }

  if ([v4 isEqualToString:TVCKDataPropertyCollectionType])
  {
    v9 = (id *)&TVCKDataPropertyCollectionTypePhotoAlbum;
LABEL_12:
    v5 = (__CFString *)*v9;
    goto LABEL_13;
  }

  if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamCollectionType])
  {
    v9 = (id *)&TVCKDataPropertyPhotoStreamRecentsCollectionType;
    goto LABEL_12;
  }

  if ([v4 isEqualToString:TVCKDataPropertyMediaType])
  {
    v9 = (id *)&TVCKDataTypePhoto;
    goto LABEL_12;
  }

  if ([v4 isEqualToString:TVCKDataPropertyEmail])
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRecentUpdatesStream appleAccount](self, "appleAccount"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_primaryEmail"));

    goto LABEL_13;
  }

  if ([v4 isEqualToString:TVCKDataPropertyFullName])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRecentUpdatesStream appleAccount](self, "appleAccount"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_firstName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPRecentUpdatesStream appleAccount](self, "appleAccount"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_lastName"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v12,  v14));

    goto LABEL_5;
  }

  else {
    v5 = 0LL;
  }
LABEL_13:

  return v5;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end