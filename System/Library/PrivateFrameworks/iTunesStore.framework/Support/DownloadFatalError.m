@interface DownloadFatalError
- (BOOL)canCoalesceWithError:(id)a3;
- (id)copyUserNotification;
@end

@implementation DownloadFatalError

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v4 = objc_opt_class(self);
  return v4 == objc_opt_class(a3);
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v4 = (uint64_t)-[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
  v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
  if (v4 <= 1) {
    v6 = @"DOWNLOAD_FAILED_TITLE_GENERIC";
  }
  else {
    v6 = @"DOWNLOAD_FAILED_TITLE_GENERIC_PLURAL";
  }
  CFDictionarySetValue( Mutable,  kCFUserNotificationAlertHeaderKey,  -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_10035EB18, 0LL));
  if (self->super._downloadTitle)
  {
    if (v4 == 2)
    {
      v8 = objc_alloc(&OBJC_CLASS___NSString);
      v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
      v10 = @"DOWNLOAD_FATAL_MESSAGE_ONE_%@";
    }

    else
    {
      uint64_t v7 = v4 - 1;
      if (v4 != 1)
      {
        v8 = objc_alloc(&OBJC_CLASS___NSString);
        v11 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"DOWNLOAD_FATAL_MESSAGE_PLURAL_%@_%ld",  &stru_10035EB18,  0LL);
        downloadTitle = self->super._downloadTitle;
        uint64_t v17 = v7;
        goto LABEL_11;
      }

      v8 = objc_alloc(&OBJC_CLASS___NSString);
      v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
      v10 = @"DOWNLOAD_FATAL_MESSAGE_%@";
    }

    v11 = -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  v10,  &stru_10035EB18,  0LL);
    downloadTitle = self->super._downloadTitle;
LABEL_11:
    v13 = -[NSString initWithFormat:](v8, "initWithFormat:", v11, downloadTitle, v17);
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v13);
  }

  v14 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"DOWNLOAD_FAILED_DONE",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v14);
  CFDictionarySetValue( Mutable,  SBUserNotificationDefaultButtonTag,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  id v15 = [[ISUserNotification alloc] initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v15;
}

@end