@interface SDAutoUnlockIconTransferStore
- (BOOL)imageCachedForHash:(id)a3 device:(id)a4;
- (SDAutoUnlockIconTransferStore)init;
- (void)_loadTransferStore;
- (void)storeCachedImageForHash:(id)a3 device:(id)a4 appName:(id)a5;
@end

@implementation SDAutoUnlockIconTransferStore

- (SDAutoUnlockIconTransferStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAutoUnlockIconTransferStore;
  v2 = -[SDAutoUnlockIconTransferStore init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[SDAutoUnlockIconTransferStore _loadTransferStore](v2, "_loadTransferStore");
    v4 = v3;
  }

  return v3;
}

- (void)storeCachedImageForHash:(id)a3 device:(id)a4 appName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SFHexStringForData(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferStore, "objectForKeyedSubscript:", v9));
  v14 = (NSMutableDictionary *)[v13 mutableCopy];

  if (!v14 || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15), (objc_opt_isKindOfClass(v14, v16) & 1) == 0))
  {
    v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);

    v14 = v17;
  }

  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_1000971A0;
  v29 = sub_1000971B0;
  id v30 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000971B8;
  v22[3] = &unk_1005CD058;
  id v18 = v10;
  id v23 = v18;
  v24 = &v25;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v22);
  if (v26[5]) {
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, v12);
  id v19 = -[NSMutableDictionary copy](v14, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transferStore, "setObject:forKeyedSubscript:", v19, v9);

  if (dword_100642660 <= 50 && (dword_100642660 != -1 || _LogCategory_Initialize(&dword_100642660, 50LL))) {
    LogPrintF( &dword_100642660,  "-[SDAutoUnlockIconTransferStore storeCachedImageForHash:device:appName:]",  50LL,  "Storing cached image state: %@, device: %@, hash: %@",  v18,  v9,  v12);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v21 = -[NSMutableDictionary copy](self->_transferStore, "copy");
  [v20 setObject:v21 forKey:@"AUIconTransferStore"];

  [v20 synchronize];
  _Block_object_dispose(&v25, 8);
}

- (BOOL)imageCachedForHash:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferStore, "objectForKeyedSubscript:", v7));
  id v9 = [v8 mutableCopy];

  if (!v9)
  {
    if (dword_100642660 <= 50
      && (dword_100642660 != -1 || _LogCategory_Initialize(&dword_100642660, 50LL)))
    {
      LogPrintF( &dword_100642660,  "-[SDAutoUnlockIconTransferStore imageCachedForHash:device:]",  50LL,  "Nothing stored in device store yet");
    }

    goto LABEL_18;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    if (dword_100642660 <= 90
      && (dword_100642660 != -1 || _LogCategory_Initialize(&dword_100642660, 90LL)))
    {
      LogPrintF( &dword_100642660,  "-[SDAutoUnlockIconTransferStore imageCachedForHash:device:]",  90LL,  "### Device store isn't a dictionary");
    }

- (void)_loadTransferStore
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AUIconTransferStore"]);
  v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0))
  {
    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);

    v4 = v7;
  }

  transferStore = self->_transferStore;
  self->_transferStore = v4;
}

- (void).cxx_destruct
{
}

@end