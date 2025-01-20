@interface TVPMyPhotoStream
+ (id)collectionWithDataClient:(id)a3 accessObject:(id)a4;
+ (id)idForAppleAccount:(id)a3;
- (ACAccount)appleAccount;
- (TVPMyPhotoStream)initWithDataClient:(id)a3;
- (TVPMyPhotoStream)initWithDataClient:(id)a3 appleAccount:(id)a4;
- (id)concreteValueForProperty:(id)a3;
- (void)setAppleAccount:(id)a3;
@end

@implementation TVPMyPhotoStream

+ (id)idForAppleAccount:(id)a3
{
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "aa_personID"));
  v4 = v3;
  if (!v3) {
    v3 = @"invalid_id";
  }
  v5 = v3;

  return v5;
}

+ (id)collectionWithDataClient:(id)a3 accessObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 appleAccount]);
  id v10 = [v8 initWithDataClient:v7 appleAccount:v9];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 assets]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 count]));

  [v10 setObject:v12 forKey:TVCKDataPropertyCollectionItemCount];
  [v10 setObject:v12 forKey:TVCKDataPropertyCollectionCount];

  return v10;
}

- (TVPMyPhotoStream)initWithDataClient:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[TVPMyPhotoStream initWithDataClient:]", "TVPStream.m", 56, "NO");
}

- (TVPMyPhotoStream)initWithDataClient:(id)a3 appleAccount:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPMyPhotoStream;
  id v8 = -[TVPMyPhotoStream initWithDataClient:](&v11, "initWithDataClient:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_appleAccount, a4);
  }

  return v9;
}

- (id)concreteValueForProperty:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:TVCKDataPropertyName])
  {
    if ([v4 isEqualToString:TVCKDataPropertyID])
    {
      v9 = (void *)objc_opt_class(self, v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStream appleAccount](self, "appleAccount"));
      id v7 = (id)objc_claimAutoreleasedReturnValue([v9 idForAppleAccount:v10]);
      goto LABEL_6;
    }

    if ([v4 isEqualToString:TVCKDataPropertyCollectionType])
    {
      objc_super v11 = (id *)&TVCKDataPropertyCollectionTypePhotoAlbum;
    }

    else if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamCollectionType])
    {
      objc_super v11 = (id *)&TVCKDataPropertyPhotoStreamLegacyCollectionType;
    }

    else
    {
      if (![v4 isEqualToString:TVCKDataPropertyMediaType])
      {
        if ([v4 isEqualToString:TVCKDataPropertyEmail])
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStream appleAccount](self, "appleAccount"));
          uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryEmail"));
          goto LABEL_3;
        }

        if (![v4 isEqualToString:TVCKDataPropertyFullName])
        {
          id v7 = 0LL;
          goto LABEL_14;
        }

        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStream appleAccount](self, "appleAccount"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aa_firstName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStream appleAccount](self, "appleAccount"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aa_lastName"));
        id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v13, v15));

LABEL_6:
        goto LABEL_14;
      }

      objc_super v11 = (id *)&TVCKDataTypePhoto;
    }

    id v7 = *v11;
    goto LABEL_14;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"PhotoStreamMyPhotoStreamMenuItemTitle" value:&stru_1000CC6C8 table:0]);
LABEL_3:
  id v7 = (id)v6;

LABEL_14:
  return v7;
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