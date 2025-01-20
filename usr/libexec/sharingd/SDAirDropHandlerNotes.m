@interface SDAirDropHandlerNotes
+ (id)extractNotesURLs:(id)a3;
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerNotes)initWithTransfer:(id)a3;
- (id)createDestination;
- (id)defaultOpenActionBundleID;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerNotes

- (SDAirDropHandlerNotes)initWithTransfer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerNotes;
  v3 = -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:]( &v9,  "initWithTransfer:bundleIdentifier:",  a3,  0LL);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v3, "bundleProxy"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v4, "bundleProxy"));
      v10 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
      -[SDAirDropHandlerGenericFiles setAvailableApplications:](v4, "setAvailableApplications:", v7);
    }
  }

  return v4;
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerNotes;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x100;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = @"NOTE";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v7));

  LODWORD(v6) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  uint64_t v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((_DWORD)v6) {
    v12 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v11, v4, v15);
  }
  else {
    v12 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v11, v3, v4);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (void)updatePossibleActions
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerNotes;
  -[SDAirDropHandlerGenericFiles updatePossibleActions](&v2, "updatePossibleActions");
}

- (id)createDestination
{
  objc_super v3 = NSHomeDirectory();
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL));
  id v13 = 0LL;
  id v6 = sub_100115134(v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v13;

  if (!v7)
  {
    uint64_t v10 = airdrop_log(v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008327C(self, (uint64_t)v8, v11);
    }
  }

  return v7;
}

+ (id)extractNotesURLs:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&__int128 v7 = 136315394LL;
    __int128 v23 = v7;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v23, (void)v24));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        unsigned int v14 = [v12 fileExistsAtPath:v13];

        if (v14)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 absoluteString]);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 pathExtension]);

          uint64_t v18 = SFIsNote(v17);
          if ((v18 & 1) != 0)
          {
            -[NSMutableArray addObject:](v4, "addObject:", v11);
          }

          else
          {
            uint64_t v20 = airdrop_log(v18);
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v29 = "+[SDAirDropHandlerNotes extractNotesURLs:]";
              __int16 v30 = 2112;
              v31 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "### %s - dropped URL:[%@]",  buf,  0x16u);
            }
          }
        }

        else
        {
          uint64_t v19 = airdrop_log(v15);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v23;
            v29 = "+[SDAirDropHandlerNotes extractNotesURLs:]";
            __int16 v30 = 2112;
            v31 = v11;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "### %s -- URL does not exist on filesystem:[%@]",  buf,  0x16u);
          }
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v8);
  }

  return v4;
}

- (id)defaultOpenActionBundleID
{
  return 0LL;
}

@end