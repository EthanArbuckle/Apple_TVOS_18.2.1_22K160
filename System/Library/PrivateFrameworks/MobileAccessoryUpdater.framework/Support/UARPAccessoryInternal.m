@interface UARPAccessoryInternal
+ (BOOL)supportsSecureCoding;
+ (id)encodedClasses;
- (BOOL)isEqual:(id)a3;
- (NSString)dropboxFirmwarePath;
- (NSString)dropboxReleaseNotesPath;
- (NSString)identifier;
- (NSString)supplementalAssetName;
- (UARPAccessoryID)accessoryID;
- (UARPAccessoryInternal)initWithAccessoryID:(id)a3 assetID:(id)a4;
- (UARPAccessoryInternal)initWithCoder:(id)a3;
- (UARPAssetID)assetID;
- (id)analyticsUpdateStateForAssetID:(id)a3;
- (id)asset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createUpdateFirmwareEvent;
- (id)description;
- (id)query;
- (id)record;
- (unint64_t)hash;
- (void)analyticsSendUpdateFirmwareEventForAssetID:(id)a3 frameworkParams:(id)a4;
- (void)analyticsSetDownloadAvailableForAssetID:(id)a3;
- (void)analyticsSetDownloadCompleteForAssetID:(id)a3 status:(int64_t)a4;
- (void)analyticsSetDownloadConsentReceivedForAssetID:(id)a3 userIntent:(BOOL)a4;
- (void)analyticsSetDownloadConsentRequestedForAssetID:(id)a3;
- (void)checkDropbox;
- (void)dealloc;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeUpdateState:(id)a3;
- (void)sendUpdateFirmwareEventForState:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setDropboxFirmwarePath:(id)a3;
- (void)setDropboxReleaseNotesPath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRecord:(id)a3;
- (void)setSupplementalAssetName:(id)a3;
@end

@implementation UARPAccessoryInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)encodedClasses
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___NSString));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___UARPAccessoryID));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___UARPAssetID));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___UARPAnalyticsAUDUpdateFirmwareState));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___NSMutableArray));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___UARPAccessoryInternal));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___NSNumber));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___NSDate));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___NSURL));
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3052000000LL;
  v23 = sub_10003D504;
  v24 = sub_10003D514;
  uint64_t v3 = qword_10008E3F8;
  uint64_t v25 = qword_10008E3F8;
  if (!qword_10008E3F8)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_10003D520;
    v18 = &unk_100075AD0;
    v19 = &v20;
    sub_10003D520((uint64_t)&v15);
    uint64_t v3 = v21[5];
  }

  _Block_object_dispose(&v20, 8);
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(v3));
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3052000000LL;
  v23 = sub_10003D504;
  v24 = sub_10003D514;
  uint64_t v11 = qword_10008E408;
  uint64_t v25 = qword_10008E408;
  if (!qword_10008E408)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_10003D620;
    v18 = &unk_100075AD0;
    v19 = &v20;
    sub_10003D620((uint64_t)&v15, v4, v5, v6, v7, v8, v9, v10, v14);
    uint64_t v11 = v21[5];
  }

  _Block_object_dispose(&v20, 8);
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(v11));
  v12 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2);

  return v12;
}

- (UARPAccessoryInternal)initWithAccessoryID:(id)a3 assetID:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPAccessoryInternal;
  uint64_t v6 = -[UARPAccessoryInternal init](&v11, "init");
  if (v6)
  {
    v6->_accessoryID = (UARPAccessoryID *)[a3 copy];
    v6->_assetID = (UARPAssetID *)a4;
    if (-[UARPAccessoryID productGroup](v6->_accessoryID, "productGroup")
      && -[UARPAccessoryID productNumber](v6->_accessoryID, "productNumber"))
    {
      uint64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-%@",  -[UARPAccessoryID productGroup](v6->_accessoryID, "productGroup"),  -[UARPAccessoryID productNumber](v6->_accessoryID, "productNumber"));
    }

    else
    {
      if (!-[UARPAccessoryID modelNumber](v6->_accessoryID, "modelNumber"))
      {
LABEL_9:
        v6->_analyticsUpdateStates = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v6->_analyticsLog = os_log_create("com.apple.accessoryupdater.uarp", "analytics");
        v6->_assetManagerLog = os_log_create("com.apple.accessoryupdater.uarp", "assetManager");
        return v6;
      }

      uint64_t v8 = (NSString *)objc_msgSend(-[UARPAccessoryID modelNumber](v6->_accessoryID, "modelNumber"), "copy");
      v6->_identifier = v8;
      id v9 = +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v8);
      if (!v9) {
        return 0LL;
      }
      uint64_t v7 = (NSString *)objc_msgSend(objc_msgSend(v9, "mobileAssetAppleModelNumber"), "copy");
    }

    v6->_identifier = v7;
    goto LABEL_9;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPAccessoryInternal;
  -[UARPAccessoryInternal dealloc](&v3, "dealloc");
}

- (void)analyticsSetDownloadAvailableForAssetID:(id)a3
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPAccessoryInternal analyticsSetDownloadAvailableForAssetID:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = -[UARPAccessoryInternal analyticsUpdateStateForAssetID:](self, "analyticsUpdateStateForAssetID:", a3);
  if (!v6)
  {
    uint64_t v6 = -[UARPAnalyticsAUDUpdateFirmwareState initWithAccessoryID:assetID:]( objc_alloc(&OBJC_CLASS___UARPAnalyticsAUDUpdateFirmwareState),  "initWithAccessoryID:assetID:",  self->_accessoryID,  self->_assetID);
    -[NSMutableArray addObject:](self->_analyticsUpdateStates, "addObject:", v6);
  }

  -[UARPAnalyticsAUDUpdateFirmwareState setAssetAvailableForDownload](v6, "setAssetAvailableForDownload");
}

- (void)analyticsSetDownloadConsentRequestedForAssetID:(id)a3
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPAccessoryInternal analyticsSetDownloadConsentRequestedForAssetID:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = -[UARPAccessoryInternal analyticsUpdateStateForAssetID:](self, "analyticsUpdateStateForAssetID:", a3);
  if (v6)
  {
    [v6 setDownloadConsentRequested];
  }

  else if (os_log_type_enabled(self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_10004B580();
  }

- (void)analyticsSetDownloadConsentReceivedForAssetID:(id)a3 userIntent:(BOOL)a4
{
  BOOL v4 = a4;
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = "NO";
    *(void *)&v10[4] = "-[UARPAccessoryInternal analyticsSetDownloadConsentReceivedForAssetID:userIntent:]";
    *(_DWORD *)id v10 = 136315650;
    if (v4) {
      uint64_t v8 = "YES";
    }
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = a3;
    __int16 v11 = 2080;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@ userIntent=%s", v10, 0x20u);
  }

  id v9 = -[UARPAccessoryInternal analyticsUpdateStateForAssetID:]( self,  "analyticsUpdateStateForAssetID:",  a3,  *(_OWORD *)v10);
  if (v9)
  {
    [v9 setDownloadConsentReceived:v4];
  }

  else if (os_log_type_enabled(self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_10004B5F0();
  }

- (void)analyticsSetDownloadCompleteForAssetID:(id)a3 status:(int64_t)a4
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    __int16 v11 = "-[UARPAccessoryInternal analyticsSetDownloadCompleteForAssetID:status:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2080;
    v15 = sub_100013C04(a4);
    _os_log_impl( (void *)&_mh_execute_header,  analyticsLog,  OS_LOG_TYPE_INFO,  "%s: %@ status=%s",  (uint8_t *)&v10,  0x20u);
  }

  id v8 = -[UARPAccessoryInternal analyticsUpdateStateForAssetID:](self, "analyticsUpdateStateForAssetID:", a3);
  if (v8)
  {
    id v9 = v8;
    [v8 setDownloadComplete:a4];
    if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      -[UARPAccessoryInternal sendUpdateFirmwareEventForState:](self, "sendUpdateFirmwareEventForState:", v9);
      -[UARPAccessoryInternal removeUpdateState:](self, "removeUpdateState:", v9);
    }
  }

  else if (os_log_type_enabled(self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_10004B660();
  }

- (void)analyticsSendUpdateFirmwareEventForAssetID:(id)a3 frameworkParams:(id)a4
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    __int16 v12 = "-[UARPAccessoryInternal analyticsSendUpdateFirmwareEventForAssetID:frameworkParams:]";
    __int16 v13 = 2112;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v11, 0x16u);
  }

  id v8 = -[UARPAccessoryInternal analyticsUpdateStateForAssetID:](self, "analyticsUpdateStateForAssetID:", a3);
  if (v8)
  {
    id v9 = v8;
    id v10 = -[UARPAccessoryInternal createUpdateFirmwareEvent](self, "createUpdateFirmwareEvent");
    objc_msgSend( v10,  "setDownloadConsentDuration:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v9, "downloadConsentDuration")));
    objc_msgSend( v10,  "setDownloadUserInitiated:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "downloadUserIntent")));
    objc_msgSend(v10, "setDownloadStatus:", objc_msgSend(v9, "downloadStatus"));
    [v10 updateWithFrameworkParams:a4];
    [v10 send];

    -[UARPAccessoryInternal removeUpdateState:](self, "removeUpdateState:", v9);
  }

  else if (os_log_type_enabled(self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_10004B6D0();
  }

- (id)analyticsUpdateStateForAssetID:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  analyticsUpdateStates = self->_analyticsUpdateStates;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( analyticsUpdateStates,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(analyticsUpdateStates);
    }
    id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    id v10 = objc_msgSend(objc_msgSend(v9, "assetID"), "type");
    if (v10 == [a3 type]
      && objc_msgSend( objc_msgSend(objc_msgSend(v9, "assetID"), "remoteURL"),  "isEqual:",  objc_msgSend(a3, "remoteURL"))
      && (objc_msgSend( objc_msgSend(objc_msgSend(v9, "assetID"), "assetVersion"),  "isEqual:",  objc_msgSend(a3, "assetVersion")) & 1) != 0)
    {
      return v9;
    }

    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( analyticsUpdateStates,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)sendUpdateFirmwareEventForState:(id)a3
{
  id v4 = -[UARPAccessoryInternal createUpdateFirmwareEvent](self, "createUpdateFirmwareEvent");
  objc_msgSend( v4,  "setDownloadConsentDuration:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(a3, "downloadConsentDuration")));
  objc_msgSend( v4,  "setDownloadUserInitiated:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "downloadUserIntent")));
  objc_msgSend(v4, "setDownloadStatus:", objc_msgSend(a3, "downloadStatus"));
  [v4 send];
}

- (id)createUpdateFirmwareEvent
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UARPUpdateFirmwareAnalyticsEvent);
  -[UARPUpdateFirmwareAnalyticsEvent updateWithAccessoryID:assetID:]( v3,  "updateWithAccessoryID:assetID:",  self->_accessoryID,  self->_assetID);
  return v3;
}

- (void)removeUpdateState:(id)a3
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  analyticsLog,  OS_LOG_TYPE_INFO,  "%@ tracking complete",  (uint8_t *)&v6,  0xCu);
  }

  -[NSMutableArray removeObject:](self->_analyticsUpdateStates, "removeObject:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[UARPAccessoryInternal initWithAccessoryID:assetID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryInternal),  "initWithAccessoryID:assetID:",  self->_accessoryID,  self->_assetID);
  v4->_record = [self->_record copy];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (UARPAccessoryInternal)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class(UARPAccessoryID) forKey:@"accessoryID"];
  int v6 = -[UARPAccessoryInternal initWithAccessoryID:assetID:]( self,  "initWithAccessoryID:assetID:",  v5,  [a3 decodeObjectOfClass:objc_opt_class(UARPAssetID) forKey:@"assetID"]);
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 decodeObjectForKey:@"identifier"];
    v6->_dropboxFirmwarePath = (NSString *)[a3 decodeObjectForKey:@"dropboxFirmwarePath"];
    v6->_dropboxReleaseNotesPath = (NSString *) [a3 decodeObjectForKey:@"dropboxReleaseNotesPath"];
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___UARPAnalyticsAUDUpdateFirmwareState);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___UARPAssetID);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___UARPAccessoryID);
    id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 5LL);
    uint64_t v8 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7, v11, v12, v13, v14);
    analyticsUpdateStates = v6->_analyticsUpdateStates;
    if (analyticsUpdateStates)
    {

      v6->_analyticsUpdateStates = 0LL;
    }

    v6->_analyticsUpdateStates = (NSMutableArray *)objc_msgSend( objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  v8,  @"analyticsUpdateStates"),  "mutableCopy");
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](-[UARPAccessoryInternal identifier](self, "identifier"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UARPAccessoryInternal);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    if (self == a3)
    {
      LOBYTE(v6) = 1;
    }

    else
    {
      unsigned int v6 = sub_100025010( -[UARPAccessoryInternal identifier](self, "identifier"),  (uint64_t)[a3 identifier]);
      if (v6)
      {
        unsigned int v6 = sub_100025010( -[UARPAccessoryInternal accessoryID](self, "accessoryID"),  (uint64_t)[a3 accessoryID]);
        if (v6)
        {
          unsigned int v6 = sub_100025010( -[UARPAccessoryInternal assetID](self, "assetID"),  (uint64_t)[a3 assetID]);
          if (v6)
          {
            unsigned int v6 = sub_100025010( -[UARPAccessoryInternal dropboxFirmwarePath](self, "dropboxFirmwarePath"),  (uint64_t)[a3 dropboxFirmwarePath]);
            if (v6) {
              LOBYTE(v6) = sub_100025010( -[UARPAccessoryInternal dropboxReleaseNotesPath]( self,  "dropboxReleaseNotesPath"),  (uint64_t)[a3 dropboxReleaseNotesPath]);
            }
          }
        }
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)checkDropbox
{
  assetManagerLog = self->_assetManagerLog;
  if (os_log_type_enabled(assetManagerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[UARPAccessoryInternal checkDropbox]";
    _os_log_impl((void *)&_mh_execute_header, assetManagerLog, OS_LOG_TYPE_INFO, "%s:", buf, 0xCu);
  }

  identifier = self->_identifier;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003D1C0;
  v9[3] = &unk_100075E48;
  v9[4] = self;
  sub_10003B860((uint64_t)identifier, (uint64_t)v9);
  dropboxFirmwarePath = self->_dropboxFirmwarePath;
  if (dropboxFirmwarePath)
  {
    unsigned int v6 = self->_assetManagerLog;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dropboxReleaseNotesPath = self->_dropboxReleaseNotesPath;
      uint64_t v8 = self->_identifier;
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = (const char *)dropboxFirmwarePath;
      __int16 v12 = 2112;
      uint64_t v13 = dropboxReleaseNotesPath;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Found superbinary %@, release notes %@ in dropbox for %@",  buf,  0x20u);
    }
  }

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  unint64_t v7 = a3 + 1;
  if (self->_identifier) {
    [a4 appendWithTabDepth:a3 + 1, @"Identifier: %@\n", self->_identifier format];
  }
  -[UARPAssetID dumpWithTabDepth:dumpString:](self->_assetID, "dumpWithTabDepth:dumpString:", a3 + 1, a4);
  if (self->_dropboxFirmwarePath) {
    [a4 appendWithTabDepth:a3 + 1, @"Dropbox Firmware Path: %@\n", self->_dropboxFirmwarePath format];
  }
  objc_msgSend( a4,  "appendWithTabDepth:format:",  a3 + 1,  @"Remote Check Status: %s\n",  -[UARPAccessoryInternal remoteCheckStatusString](self, "remoteCheckStatusString"));
  if (self->_dropboxReleaseNotesPath) {
    [a4 appendWithTabDepth:a3 + 1, @"Dropbox Release Notes Path: %@\n", self->_dropboxReleaseNotesPath format];
  }
  if (-[NSMutableArray count](self->_analyticsUpdateStates, "count"))
  {
    [a4 appendWithTabDepth:a3 + 1 format:@"Analytics Firmware Update States:\n"];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    analyticsUpdateStates = self->_analyticsUpdateStates;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( analyticsUpdateStates,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      unint64_t v12 = a3 + 2;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(analyticsUpdateStates);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)i) dumpWithTabDepth:v12 dumpString:a4];
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( analyticsUpdateStates,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v10);
    }
  }

  if ((objc_opt_respondsToSelector(self->_record, "dumpWithTabDepth:dumpString:") & 1) != 0) {
    [self->_record dumpWithTabDepth:v7 dumpString:a4];
  }
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: accessoryID=%@, assetID=%@, record=%@>",  NSStringFromClass(v3),  self->_accessoryID,  self->_assetID,  self->_record);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (UARPAccessoryID)accessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAccessoryID:(id)a3
{
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSString)supplementalAssetName
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSupplementalAssetName:(id)a3
{
}

- (NSString)dropboxFirmwarePath
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDropboxFirmwarePath:(id)a3
{
}

- (NSString)dropboxReleaseNotesPath
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDropboxReleaseNotesPath:(id)a3
{
}

- (id)asset
{
  return objc_getProperty(self, a2, 80LL, 1);
}

- (void)setAsset:(id)a3
{
}

- (id)query
{
  return objc_getProperty(self, a2, 88LL, 1);
}

- (void)setQuery:(id)a3
{
}

- (id)record
{
  return objc_getProperty(self, a2, 96LL, 1);
}

- (void)setRecord:(id)a3
{
}

@end