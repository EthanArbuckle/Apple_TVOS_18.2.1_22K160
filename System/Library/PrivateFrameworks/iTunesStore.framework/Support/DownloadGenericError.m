@interface DownloadGenericError
- (BOOL)_isInstallError:(id)a3;
- (BOOL)canCoalesceWithError:(id)a3;
- (DownloadGenericError)initWithError:(id)a3;
- (NSError)error;
- (id)_notificationBody;
- (id)_notificationTitle;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)performActionForResponseFlags:(unint64_t)a3;
@end

@implementation DownloadGenericError

- (DownloadGenericError)initWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadGenericError;
  v4 = -[DownloadGenericError init](&v6, "init");
  if (v4) {
    v4->_error = (NSError *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadGenericError;
  -[DownloadError dealloc](&v3, "dealloc");
}

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(a3))
  {
    v7 = -[DownloadError downloadKind](self, "downloadKind");
    if (v7 == [a3 downloadKind]
      || (unsigned int v6 = -[NSString isEqual:]( -[DownloadError downloadKind](self, "downloadKind"),  "isEqual:",  [a3 downloadKind])) != 0)
    {
      unsigned __int8 v8 = -[DownloadGenericError _isInstallError:]( self,  "_isInstallError:",  -[DownloadGenericError error](self, "error"));
      LOBYTE(v6) = v8 ^ -[DownloadGenericError _isInstallError:](self, "_isInstallError:", [a3 error]) ^ 1;
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v4 = -[DownloadGenericError _notificationTitle](self, "_notificationTitle");
  if ([v4 length]) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v4);
  }
  id v5 = -[DownloadGenericError _notificationBody](self, "_notificationBody");
  if ([v5 length]) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v5);
  }
  unsigned int v6 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"DOWNLOAD_FAILED_DONE",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v6);
  v7 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"DOWNLOAD_FAILED_RETRY",  &stru_10035EB18,  0LL);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v7);
  CFDictionarySetValue( Mutable,  SBUserNotificationDefaultButtonTag,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  id v8 = [[ISUserNotification alloc] initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v8;
}

- (void)performActionForResponseFlags:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    v17 = (os_log_s *)[v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      int v25 = 138412290;
      uint64_t v26 = objc_opt_class(self);
      uint64_t v19 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Cancel downloads from error alert",  &v25,  12);
      if (v19)
      {
        v20 = (void *)v19;
        v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
        free(v20);
        v22 = v21;
        *(void *)&double v18 = SSFileLog(v14, @"%@").n128_u64[0];
      }
    }

    id v12 = +[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase", v18, v22);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000DC6B8;
    v23[3] = &unk_10034D7F0;
    v23[4] = self;
    v13 = v23;
  }

  else
  {
    if (a3) {
      return;
    }
    id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v5 = [v4 shouldLog];
    else {
      LODWORD(v6) = v5;
    }
    v7 = (os_log_s *)[v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      uint64_t v6 = v6;
    }
    else {
      v6 &= 2u;
    }
    if ((_DWORD)v6)
    {
      int v25 = 138412290;
      uint64_t v26 = objc_opt_class(self);
      uint64_t v9 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Retry downloads from error alert",  &v25,  12);
      if (v9)
      {
        v10 = (void *)v9;
        v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
        free(v10);
        v22 = v11;
        *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
      }
    }

    id v12 = +[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase", v8, v22);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000DC6A8;
    v24[3] = &unk_10034D7F0;
    v24[4] = self;
    v13 = v24;
  }

  [v12 modifyUsingTransactionBlock:v13];
}

- (BOOL)_isInstallError:(id)a3
{
  id v4 = [a3 domain];
  else {
    return ISErrorIsEqual(a3, SSErrorDomain, 10LL);
  }
}

- (id)_notificationBody
{
  if (self->super._downloadTitle)
  {
    unsigned int v3 = -[DownloadGenericError _isInstallError:](self, "_isInstallError:", self->_error);
    id v4 = (char *)-[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
    if (v3)
    {
      if (v4 == (char *)2)
      {
        uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
        v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
        double v8 = @"INSTALL_FAILED_BODY_FORMAT_ONE_%@";
        goto LABEL_15;
      }

      unsigned int v5 = v4 - 1;
      if (v4 == (char *)1)
      {
        uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
        v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
        double v8 = @"INSTALL_FAILED_BODY_FORMAT_%@";
LABEL_15:
        uint64_t v16 = -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  v8,  &stru_10035EB18,  0LL);
        downloadTitle = self->super._downloadTitle;
LABEL_18:
        v10 = -[NSString initWithFormat:](v6, "initWithFormat:", v16, downloadTitle, v19);
        goto LABEL_19;
      }

      uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
      id v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
      unsigned int v15 = @"INSTALL_FAILED_BODY_FORMAT_PLURAL_%@_%ld";
    }

    else
    {
      if (v4 == (char *)2)
      {
        uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
        v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
        double v8 = @"DOWNLOAD_FAILED_BODY_FORMAT_ONE_%@";
        goto LABEL_15;
      }

      unsigned int v5 = v4 - 1;
      if (v4 == (char *)1)
      {
        uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
        v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
        double v8 = @"DOWNLOAD_FAILED_BODY_FORMAT_%@";
        goto LABEL_15;
      }

      uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
      id v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification));
      unsigned int v15 = @"DOWNLOAD_FAILED_BODY_FORMAT_PLURAL_%@_%ld";
    }

    uint64_t v16 = -[NSBundle localizedStringForKey:value:table:]( v14,  "localizedStringForKey:value:table:",  v15,  &stru_10035EB18,  0LL);
    downloadTitle = self->super._downloadTitle;
    uint64_t v19 = v5;
    goto LABEL_18;
  }

  id v9 = -[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
  if (v9 == (id)1)
  {
    v10 =  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"DOWNLOAD_FAILED_BODY_GENERIC",  &stru_10035EB18,  0LL);
LABEL_19:
    v13 = v10;
    return v13;
  }

  id v11 = v9;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v12, "setNumberStyle:", 1LL);
  v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISUserNotification)),  "localizedStringForKey:value:table:",  @"DOWNLOAD_FAILED_BODY_GENERIC_PLURAL_%@",  &stru_10035EB18,  0LL),  -[NSNumberFormatter stringFromNumber:]( v12,  "stringFromNumber:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11)));

  return v13;
}

- (id)_notificationTitle
{
  id v3 = -[NSMutableOrderedSet count](self->super._downloadIdentifiers, "count");
  if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindAudiobook))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_AUDIOBOOK";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_AUDIOBOOK_PLURAL";
    goto LABEL_8;
  }

  if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindMovie))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_MOVIE";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_MOVIE_PLURAL";
    goto LABEL_8;
  }

  if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindMusic)
    || -[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindCoachedAudio))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_SONG";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_SONG_PLURAL";
    goto LABEL_8;
  }

  if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindMusicVideo))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_MUSIC_VIDEO";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_MUSIC_VIDEO_PLURAL";
    goto LABEL_8;
  }

  if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindPodcast)) {
    goto LABEL_15;
  }
  if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindRingtone))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_RINGTONE";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_RINGTONE_PLURAL";
  }

  else if (-[NSString isEqualToString:]( self->super._downloadKind,  "isEqualToString:",  SSDownloadKindSoftwareApplication))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_APPLICATION";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_APPLICATION_PLURAL";
  }

  else if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindTelevisionEpisode))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_TV";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_TV_PLURAL";
  }

  else if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindTone))
  {
    id v4 = @"DOWNLOAD_FAILED_TITLE_TONE";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_TONE_PLURAL";
  }

  else
  {
    if (-[NSString isEqualToString:](self->super._downloadKind, "isEqualToString:", SSDownloadKindVideoPodcast))
    {
LABEL_15:
      id v4 = @"DOWNLOAD_FAILED_TITLE_PODCAST";
      unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_PODCAST_PLURAL";
      goto LABEL_8;
    }

    id v4 = @"DOWNLOAD_FAILED_TITLE_GENERIC";
    unsigned int v5 = @"DOWNLOAD_FAILED_TITLE_GENERIC_PLURAL";
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DownloadGenericError;
  unsigned int v5 = -[DownloadError copyWithZone:](&v7, "copyWithZone:");
  v5[5] = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  return v5;
}

- (NSError)error
{
  return self->_error;
}

@end