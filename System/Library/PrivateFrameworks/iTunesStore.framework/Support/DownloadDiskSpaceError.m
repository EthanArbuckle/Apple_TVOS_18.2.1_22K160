@interface DownloadDiskSpaceError
- (BOOL)canCoalesceWithError:(id)a3;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (void)performActionForResponseFlags:(unint64_t)a3;
@end

@implementation DownloadDiskSpaceError

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v4 = objc_opt_class(self);
  return v4 == objc_opt_class(a3);
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v4 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  @"NOT_ENOUGH_SPACE_TITLE",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v4);
  v5 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"OK",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v5);
  v6 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  @"NOT_ENOUGH_SPACE_SETTINGS",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v6);
  CFDictionarySetValue( Mutable,  SBUserNotificationDefaultButtonTag,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  v7 = (char *)-[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
  if (-[NSString length](self->super._downloadTitle, "length"))
  {
    if (v7 == (char *)2)
    {
      v9 = objc_alloc(&OBJC_CLASS___NSString);
      v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      v11 = @"NOT_ENOUGH_SPACE_SPECIFIC_PLUS_ONE_%@";
    }

    else
    {
      v8 = v7 - 1;
      if (v7 != (char *)1)
      {
        v9 = objc_alloc(&OBJC_CLASS___NSString);
        v14 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  @"NOT_ENOUGH_SPACE_SPECIFIC_PLURAL_%@_%ld",  &stru_10035EB18,  0LL);
        downloadTitle = self->super._downloadTitle;
        v19 = v8;
        goto LABEL_10;
      }

      v9 = objc_alloc(&OBJC_CLASS___NSString);
      v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      v11 = @"NOT_ENOUGH_SPACE_SPECIFIC_%@";
    }

    v14 = -[NSBundle localizedStringForKey:value:table:]( v10,  "localizedStringForKey:value:table:",  v11,  &stru_10035EB18,  0LL);
    downloadTitle = self->super._downloadTitle;
LABEL_10:
    v16 = -[NSString initWithFormat:](v9, "initWithFormat:", v14, downloadTitle, v19);
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v16);

    goto LABEL_13;
  }

  v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
  else {
    v13 = @"NOT_ENOUGH_SPACE_PLURAL";
  }
  CFDictionarySetValue( Mutable,  kCFUserNotificationAlertMessageKey,  -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_10035EB18, 0LL));
LABEL_13:
  id v17 = [[ISUserNotification alloc] initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v17;
}

- (void)performActionForResponseFlags:(unint64_t)a3
{
  if (!a3)
  {
    id v4 = objc_msgSend( [ISOpenURLRequest alloc],  "initWithURL:",  +[NSURL URLWithString:](NSURL, "URLWithString:", @"prefs:root=General&path=USAGE"));
    [v4 setITunesStoreURL:0];
    id v3 = [[ISOpenURLOperation alloc] initWithOpenURLRequest:v4];
    objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", v3);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadDiskSpaceError;
  return -[DownloadError copyWithZone:](&v4, "copyWithZone:", a3);
}

@end