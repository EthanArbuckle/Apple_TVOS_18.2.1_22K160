@interface AppLedgerItem
- (AppLedgerItem)initWithBundleID:(id)a3 itemID:(id)a4;
- (AppLedgerItem)initWithDictionary:(id)a3;
- (NSArray)installs;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)itemID;
- (NSString)bundleIdentifier;
- (id)lastUserInitiatedInstall;
- (void)addInstall:(id)a3;
@end

@implementation AppLedgerItem

- (AppLedgerItem)initWithBundleID:(id)a3 itemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AppLedgerItem;
  v9 = -[AppLedgerItem init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    if (!v10->_bundleIdentifier)
    {
      v13 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong((id *)&v10->_itemID, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    installs = v10->_installs;
    v10->_installs = (NSMutableArray *)v11;
  }

  v13 = v10;
LABEL_6:

  return v13;
}

- (AppLedgerItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___AppLedgerItem;
  v5 = -[AppLedgerItem init](&v53, "init");
  if (!v5) {
    goto LABEL_25;
  }
  id v6 = sub_1001DF594(v4, @"bundleIdentifier");
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v7;

  if (!v5->_bundleIdentifier)
  {
    v47 = 0LL;
    goto LABEL_27;
  }

  id v9 = sub_1001DEDF8(v4, @"itemID");
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v10;

  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"installs"]);
  v51 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (!v12) {
    goto LABEL_24;
  }
  v50 = v5;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v49 = v12;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v13) {
    goto LABEL_23;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v55;
  do
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v55 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
      v18 = objc_alloc(&OBJC_CLASS___AppLedgerInstallItem);
      id v19 = v17;
      if (!v18)
      {
        v21 = 0LL;
LABEL_19:

        goto LABEL_20;
      }

      v58.receiver = v18;
      v58.super_class = (Class)&OBJC_CLASS___AppLedgerInstallItem;
      v20 = -[AppLedgerItem init](&v58, "init");
      if (v20)
      {
        v21 = v20;
        id v22 = sub_1001DF594(v19, @"bundleVersion");
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
        Class isa = v21[1].super.isa;
        v21[1].super.Class isa = (Class)v23;

        id v25 = sub_1001DEDF8(v19, @"externalVersionID");
        uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
        v27 = v21->_itemID;
        v21->_itemID = (NSNumber *)v26;

        id v28 = sub_1001DF17C(v19, @"installDate");
        uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
        installs = v21->_installs;
        v21->_installs = (NSMutableArray *)v29;

        id v31 = sub_1001DEDF8(v19, @"installType");
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        objc_opt_class(&OBJC_CLASS___NSNumber, v33);
        id v34 = sub_1001B2BD8(v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

        if (v35) {
          v21->_bundleIdentifier = (NSString *)[v32 integerValue];
        }
        id v36 = sub_1001DEDF8(v19, @"packageType");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        objc_opt_class(&OBJC_CLASS___NSNumber, v38);
        id v39 = sub_1001B2BD8(v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        if (v40) {
          v21[1]._bundleIdentifier = (NSString *)[v37 integerValue];
        }
        id v41 = sub_1001DF594(v19, @"originator");
        uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
        v43 = v21[1]._installs;
        v21[1]._installs = (NSMutableArray *)v42;

        v44 = v21->_installs;
        if (v44)
        {
          v45 = v21;

          -[NSMutableArray addObject:](v51, "addObject:", v45);
          goto LABEL_21;
        }

        goto LABEL_19;
      }

LABEL_20:
      v45 = 0LL;
LABEL_21:
    }

    id v14 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  }

  while (v14);
LABEL_23:

  v5 = v50;
  id v12 = v49;
LABEL_24:

  v46 = v5->_installs;
  v5->_installs = v51;

LABEL_25:
  v47 = v5;
LABEL_27:

  return v47;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppLedgerItem bundleIdentifier](self, "bundleIdentifier"));
  [v3 setObject:v4 forKeyedSubscript:@"bundleIdentifier"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppLedgerItem itemID](self, "itemID"));
  v17 = v3;
  [v3 setObject:v5 forKeyedSubscript:@"itemID"];

  if (self)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = self->_installs;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v10);
          if (v11)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            [v12 setObject:v11[4] forKeyedSubscript:@"bundleVersion"];
            [v12 setObject:v11[3] forKeyedSubscript:@"externalVersionID"];
            [v12 setObject:v11[1] forKeyedSubscript:@"installDate"];
            id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11[2]));
            [v12 setObject:v13 forKeyedSubscript:@"installType"];

            id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11[6]));
            [v12 setObject:v14 forKeyedSubscript:@"packageType"];

            [v12 setObject:v11[5] forKeyedSubscript:@"originator"];
          }

          else
          {
            id v12 = 0LL;
          }

          [v6 addObject:v12];

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        id v8 = v15;
      }

      while (v15);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  [v17 setObject:v6 forKeyedSubscript:@"installs"];

  return (NSDictionary *)v17;
}

- (void)addInstall:(id)a3
{
}

- (NSArray)installs
{
  return (NSArray *)-[NSMutableArray copy](self->_installs, "copy");
}

- (id)lastUserInitiatedInstall
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_installs, "reverseObjectEnumerator", 0LL));
  v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (v6)
        {
          unint64_t v7 = v6[2];
          BOOL v8 = v7 > 0x21;
          uint64_t v9 = (1LL << v7) & 0x340088000LL;
          if (!v8 && v9 != 0) {
            continue;
          }
        }

        v3 = v6;
        goto LABEL_15;
      }

      v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
}

@end