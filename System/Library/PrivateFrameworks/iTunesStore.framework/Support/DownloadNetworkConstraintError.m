@interface DownloadNetworkConstraintError
- (BOOL)canCoalesceWithError:(id)a3;
- (BOOL)canDownloadInITunes;
- (BOOL)isValidError;
- (id)_genericStringWithLocalizedKeyBase:(id)a3;
- (id)_specificStringWithLocalizedKeyBase:(id)a3;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)constrainedSizeLimit;
- (void)setCanDownloadInITunes:(BOOL)a3;
- (void)setConstrainedSizeLimit:(int64_t)a3;
@end

@implementation DownloadNetworkConstraintError

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 != objc_opt_class(a3)) {
    return 0;
  }
  id v6 = -[DownloadNetworkConstraintError constrainedSizeLimit](self, "constrainedSizeLimit");
  if (v6 != [a3 constrainedSizeLimit]) {
    return 0;
  }
  unsigned int v7 = -[DownloadNetworkConstraintError canDownloadInITunes](self, "canDownloadInITunes");
  v9 = -[DownloadError downloadKind](self, "downloadKind");
  id v10 = [a3 downloadKind];
  else {
    return 1;
  }
}

- (id)_genericStringWithLocalizedKeyBase:(id)a3
{
  if (-[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count") != (id)1) {
    a3 = [a3 stringByAppendingString:@"_PLURAL"];
  }
  return -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem)),  "localizedStringForKey:value:table:",  a3,  &stru_10035EB18,  0LL);
}

- (id)_specificStringWithLocalizedKeyBase:(id)a3
{
  id v5 = -[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
  if (v5 == (id)2)
  {
    id v6 = @"_PLUS_ONE_%@";
    return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(SSItem)),  "localizedStringForKey:value:table:",  [a3 stringByAppendingString:v6],  &stru_10035EB18,  0),  @"%@",  0,  self->super._downloadTitle,  v8);
  }

  if (v5 == (id)1)
  {
    id v6 = @"_%@";
    return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(SSItem)),  "localizedStringForKey:value:table:",  [a3 stringByAppendingString:v6],  &stru_10035EB18,  0),  @"%@",  0,  self->super._downloadTitle,  v8);
  }

  return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(SSItem)),  "localizedStringForKey:value:table:",  [a3 stringByAppendingString:@"_PLURAL_%@_%d"],  &stru_10035EB18,  0),  @"%@%d",  0,  self->super._downloadTitle,  ((_DWORD)v5 - 1));
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v4 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"OK",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v4);
  unsigned int v5 = -[DownloadNetworkConstraintError canDownloadInITunes](self, "canDownloadInITunes");
  unsigned int v6 = objc_msgSend( +[SSDevice currentDevice](SSDevice, "currentDevice"),  "supportsDeviceCapability:",  0);
  int IsSoftwareKind = SSDownloadKindIsSoftwareKind(-[DownloadError downloadKind](self, "downloadKind"));
  NSUInteger v8 = -[NSString length](self->super._downloadTitle, "length");
  int v9 = v6 & v5;
  if (v8)
  {
    if (((v6 | v5) & 1) != 0)
    {
      if (v9) {
        id v10 = @"TOO_BIG_FOR_NETWORK_SPECIFIC";
      }
      else {
        id v10 = @"TOO_BIG_FOR_NETWORK_SPECIFIC_NO_ITUNES";
      }
      if (v6) {
        v11 = v10;
      }
      else {
        v11 = @"TOO_BIG_FOR_NETWORK_SPECIFIC_NO_WIFI";
      }
      v12 = -[DownloadNetworkConstraintError _specificStringWithLocalizedKeyBase:]( self,  "_specificStringWithLocalizedKeyBase:",  v11);
    }

    else
    {
      v12 = 0LL;
    }

    id v15 = -[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
    if (!IsSoftwareKind)
    {
LABEL_37:
      v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      if (v15 == (id)1) {
        v19 = @"ITEM_TOO_BIG_FOR_NETWORK_TITLE";
      }
      else {
        v19 = @"ITEM_TOO_BIG_FOR_NETWORK_TITLE_PLURAL";
      }
      goto LABEL_40;
    }
  }

  else
  {
    if (!IsSoftwareKind)
    {
      if (((v6 | v5) & 1) != 0)
      {
        if (v9) {
          v16 = @"ITEM_TOO_BIG_FOR_NETWORK_BODY";
        }
        else {
          v16 = @"ITEM_TOO_BIG_FOR_NETWORK_BODY_NO_ITUNES";
        }
        if (v6) {
          v17 = v16;
        }
        else {
          v17 = @"ITEM_TOO_BIG_FOR_NETWORK_BODY_NO_WIFI";
        }
        v12 = -[DownloadNetworkConstraintError _genericStringWithLocalizedKeyBase:]( self,  "_genericStringWithLocalizedKeyBase:",  v17);
      }

      else
      {
        v12 = 0LL;
      }

      id v15 = -[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
      goto LABEL_37;
    }

    if (((v6 | v5) & 1) != 0)
    {
      if (v9) {
        v13 = @"TOO_BIG_FOR_NETWORK_BODY";
      }
      else {
        v13 = @"TOO_BIG_FOR_NETWORK_BODY_NO_ITUNES";
      }
      if (v6) {
        v14 = v13;
      }
      else {
        v14 = @"TOO_BIG_FOR_NETWORK_BODY_NO_WIFI";
      }
      v12 = -[DownloadNetworkConstraintError _genericStringWithLocalizedKeyBase:]( self,  "_genericStringWithLocalizedKeyBase:",  v14);
    }

    else
    {
      v12 = 0LL;
    }

    id v15 = -[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
  }

  v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
  if (v15 == (id)1) {
    v19 = @"TOO_BIG_FOR_NETWORK_TITLE";
  }
  else {
    v19 = @"TOO_BIG_FOR_NETWORK_TITLE_PLURAL";
  }
LABEL_40:
  v20 = -[NSBundle localizedStringForKey:value:table:]( v18,  "localizedStringForKey:value:table:",  v19,  &stru_10035EB18,  0LL);
  if (-[DownloadNetworkConstraintError constrainedSizeLimit](self, "constrainedSizeLimit") < 2)
  {
    v21 = v12;
    v12 = 0LL;
    if (!v21) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

  v21 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v20,  @"%@",  0LL,  CPFSSizeStringsWithStyle( 1LL,  (float)-[DownloadNetworkConstraintError constrainedSizeLimit](self, "constrainedSizeLimit")));
  if (v21) {
LABEL_44:
  }
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v21);
LABEL_45:
  if (v12) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v12);
  }
  id v22 = [[ISUserNotification alloc] initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v22;
}

- (BOOL)isValidError
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DownloadNetworkConstraintError;
  id result = -[DownloadError copyWithZone:](&v5, "copyWithZone:", a3);
  *((_BYTE *)result + 40) = self->_canDownloadInITunes;
  *((void *)result + 6) = self->_sizeLimit;
  return result;
}

- (BOOL)canDownloadInITunes
{
  return self->_canDownloadInITunes;
}

- (void)setCanDownloadInITunes:(BOOL)a3
{
  self->_canDownloadInITunes = a3;
}

- (int64_t)constrainedSizeLimit
{
  return self->_sizeLimit;
}

- (void)setConstrainedSizeLimit:(int64_t)a3
{
  self->_sizeLimit = a3;
}

@end