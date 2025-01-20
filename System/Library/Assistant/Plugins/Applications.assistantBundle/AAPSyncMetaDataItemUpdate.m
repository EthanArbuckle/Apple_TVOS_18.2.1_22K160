@interface AAPSyncMetaDataItemUpdate
- (AAPSyncAnchor)anchor;
- (AAPSyncMetaDataItemUpdate)init;
- (AAPSyncMetaDataItemUpdate)initWithAppId:(id)a3 appProxy:(id)a4 anchor:(id)a5 configuration:(id)a6;
- (BOOL)isMetaDataItemUpdate;
- (NSString)appId;
- (NSString)description;
- (id)scrapeAppInfo;
- (id)valueForGenericParser:(id)a3 withDefaultGenerator:(id)a4 withErrorKeyDescriptor:(id)a5;
- (id)valueForPlistEntry:(id *)a3 inBundle:(__CFBundle *)a4 withInfo:(id)a5 entitlements:(id)a6;
- (id)valuesForEntries:(id *)a3 inPlistAtURL:(id)a4;
- (id)valuesForInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 forLocalization:(id)a6 ignoringDefaultValues:(id)a7;
- (id)valuesForLocalInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 ignoringDefaultValues:(id)a6;
- (void)_validate;
- (void)dealloc;
@end

@implementation AAPSyncMetaDataItemUpdate

- (AAPSyncMetaDataItemUpdate)initWithAppId:(id)a3 appProxy:(id)a4 anchor:(id)a5 configuration:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataItemUpdate;
  v9 = -[AAPSyncMetaDataItemUpdate init](&v11, "init", a3, a4, a5, a6);
  if (v9)
  {
    v9->_appId = (NSString *)[a3 copy];
    v9->_appProxy = (LSApplicationProxy *)a4;
    v9->_anchor = (AAPSyncAnchor *)[a5 copy];
    -[AAPSyncMetaDataItemUpdate _validate](v9, "_validate");
  }

  return v9;
}

- (AAPSyncMetaDataItemUpdate)init
{
  return -[AAPSyncMetaDataItemUpdate initWithAppId:appProxy:anchor:configuration:]( self,  "initWithAppId:appProxy:anchor:configuration:",  0LL,  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataItemUpdate;
  -[AAPSyncMetaDataItemUpdate dealloc](&v3, "dealloc");
}

- (void)_validate
{
  if (!self->_appId) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  87LL,  @"appId cannot be nil");
  }
  if (!self->_appProxy) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  88LL,  @"appProxy cannot be nil");
  }
  if (!self->_anchor) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  89LL,  @"anchor cannot be nil");
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___LSApplicationProxy);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AAPSyncAnchor);
  if ((objc_opt_isKindOfClass(self->_appId, v4) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  95LL,  @"appId must be a %@",  v4);
  }
  if ((objc_opt_isKindOfClass(self->_appProxy, v5) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  96LL,  @"appProxy must be a %@",  v5);
  }
  if ((objc_opt_isKindOfClass(self->_anchor, v6) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  97LL,  @"anchor must be a %@",  v6);
  }
}

- (id)valueForGenericParser:(id)a3 withDefaultGenerator:(id)a4 withErrorKeyDescriptor:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  105LL,  @"Invalid parameter not satisfying: %@",  @"genericParser");
    if (a5) {
      goto LABEL_3;
    }
  }

  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemUpdate.m",  106LL,  @"Invalid parameter not satisfying: %@",  @"errorKeyDescriptor");
LABEL_3:
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3052000000LL;
  v30 = sub_A0A8;
  v31 = sub_A0B8;
  uint64_t v32 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_A0C4;
  v26[3] = &unk_1C938;
  v26[4] = &v27;
  v10 = (void *)(*((uint64_t (**)(id, void *))a3 + 2))(a3, v26);
  uint64_t v11 = v28[5];
  if (v10)
  {
    if (v11)
    {
      v12 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = (*((uint64_t (**)(id))a5 + 2))(a5);
        appId = self->_appId;
        v15 = (void *)v28[5];
        *(_DWORD *)buf = 136316162;
        v34 = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
        __int16 v35 = 2114;
        uint64_t v36 = v13;
        __int16 v37 = 2112;
        v38 = appId;
        __int16 v39 = 2114;
        v40 = v15;
        __int16 v41 = 2112;
        v42 = v10;
        _os_log_error_impl( &dword_0,  v12,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: parsing encountered errors for %{public}@ (%@) but managed to recover - > errors=%{public}@ parsed=%@",  buf,  0x34u);
      }
    }

    goto LABEL_16;
  }

  if (!v11
    || (v16 = (os_log_s *)AFSiriLogContextPlugin, !os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)))
  {
    if (a4) {
      goto LABEL_10;
    }
LABEL_15:
    v10 = 0LL;
    goto LABEL_16;
  }

  uint64_t v23 = (*((uint64_t (**)(id))a5 + 2))(a5);
  v24 = self->_appId;
  v25 = (void *)v28[5];
  *(_DWORD *)buf = 136315906;
  v34 = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
  __int16 v35 = 2114;
  uint64_t v36 = v23;
  __int16 v37 = 2112;
  v38 = v24;
  __int16 v39 = 2114;
  v40 = v25;
  _os_log_error_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: parsing failed for %{public}@ (%@) -> %{public}@",  buf,  0x2Au);
  if (!a4) {
    goto LABEL_15;
  }
LABEL_10:
  v10 = (void *)(*((uint64_t (**)(id))a4 + 2))(a4);
  v17 = (os_log_s *)AFSiriLogContextPlugin;
  BOOL v18 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (!v10)
  {
    if (v18)
    {
      uint64_t v21 = (*((uint64_t (**)(id))a5 + 2))(a5);
      sub_11DD8(v21, (uint64_t)self, (uint64_t)buf, v17);
    }

    goto LABEL_15;
  }

  if (v18)
  {
    uint64_t v19 = (*((uint64_t (**)(id))a5 + 2))(a5);
    v20 = self->_appId;
    *(_DWORD *)buf = 136315906;
    v34 = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
    __int16 v35 = 2114;
    uint64_t v36 = v19;
    __int16 v37 = 2112;
    v38 = v20;
    __int16 v39 = 2112;
    v40 = v10;
    _os_log_debug_impl( &dword_0,  v17,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: falling back to defaultGenerator value for %{public}@ (%@) -> %@",  buf,  0x2Au);
  }

- (id)valueForPlistEntry:(id *)a3 inBundle:(__CFBundle *)a4 withInfo:(id)a5 entitlements:(id)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_A1D8;
  v9[3] = &unk_1C960;
  v9[5] = a6;
  v9[6] = a3;
  v9[4] = a5;
  id var4 = a3->var4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_A238;
  v8[3] = &unk_1C980;
  v8[4] = a3;
  return -[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]( self,  "valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:",  v9,  var4,  v8);
}

- (id)valuesForInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 forLocalization:(id)a6 ignoringDefaultValues:(id)a7
{
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (a3->var0)
  {
    v14 = a3 + 1;
    do
    {
      -[NSMutableSet addObject:](v13, "addObject:");
      id var0 = v14->var0;
      ++v14;
    }

    while (var0);
  }

  if (!-[NSMutableSet count](v13, "count")) {
    goto LABEL_25;
  }
  if (a6)
  {
    FilteredLocalizedInfoPlist = (void *)_CFBundleCreateFilteredLocalizedInfoPlist(a4, v13, a6, 0LL);
    if (!FilteredLocalizedInfoPlist)
    {
      v17 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_11EA8((uint64_t)a6, (uint64_t)self, v17);
      }
LABEL_25:
      uint64_t v19 = 0LL;
      goto LABEL_26;
    }
  }

  else
  {
    FilteredLocalizedInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist(a4, v13, 0LL);
    if (!FilteredLocalizedInfoPlist)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_11E3C();
      }
      goto LABEL_25;
    }
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(FilteredLocalizedInfoPlist, v18) & 1) != 0)
  {
    uint64_t v19 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableSet count](v13, "count"));
    if (a3->var0)
    {
      id v31 = a6;
      *(void *)&__int128 v20 = 136316162LL;
      __int128 v30 = v20;
      do
      {
        id v21 = -[AAPSyncMetaDataItemUpdate valueForPlistEntry:inBundle:withInfo:entitlements:]( self,  "valueForPlistEntry:inBundle:withInfo:entitlements:",  a3,  a4,  FilteredLocalizedInfoPlist,  a5,  v30);
        if (v21)
        {
          id v22 = v21;
          if (objc_msgSend(v21, "isEqual:", objc_msgSend(a7, "objectForKey:", a3->var0)))
          {
            uint64_t v23 = (os_log_s *)AFSiriLogContextPlugin;
            if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
            {
              v24 = (const __CFString *)a3->var0;
              appId = self->_appId;
              *(_DWORD *)buf = v30;
              v33 = "-[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:igno"
                    "ringDefaultValues:]";
              __int16 v34 = 2114;
              __int16 v35 = v24;
              __int16 v36 = 2112;
              __int16 v37 = (AAPSyncMetaDataItemUpdate *)appId;
              __int16 v38 = 2114;
              id v39 = v31;
              __int16 v40 = 2112;
              id v41 = v22;
              _os_log_debug_impl( &dword_0,  v23,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: not setting value for key=%{public}@ (%@) for localization (%{public}@) because it is the same as the default -> %@",  buf,  0x34u);
            }
          }

          else
          {
            -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v22, a3->var0);
          }
        }

        id v26 = a3[1].var0;
        ++a3;
      }

      while (v26);
    }
  }

  else
  {
    uint64_t v27 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
    {
      v33 = "-[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:]";
      __int16 v34 = 2114;
      uint64_t v29 = &stru_1CF80;
      *(_DWORD *)buf = 136315906;
      if (a6) {
        uint64_t v29 = (const __CFString *)a6;
      }
      __int16 v35 = v29;
      __int16 v36 = 2112;
      __int16 v37 = self;
      __int16 v38 = 2112;
      id v39 = FilteredLocalizedInfoPlist;
      _os_log_error_impl( &dword_0,  v27,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: could not understand %{public}@ info file data for metaDataItem=%@ -> %@",  buf,  0x2Au);
    }

    uint64_t v19 = 0LL;
  }

LABEL_26:
  return v19;
}

- (id)valuesForLocalInfoPlistEntries:(id *)a3 inBundle:(__CFBundle *)a4 withEntitlements:(id)a5 ignoringDefaultValues:(id)a6
{
  uint64_t v6 = -1LL;
  v7 = a3;
  do
  {
    id var0 = v7->var0;
    ++v7;
    ++v6;
  }

  while (var0);
  if (v6 && (CFArrayRef v9 = CFBundleCopyBundleLocalizations(a4)) != 0LL)
  {
    CFArrayRef v10 = v9;
    uint64_t v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v6);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v29 = -[__CFArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    if (v29)
    {
      uint64_t v23 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(__CFString **)(*((void *)&v35 + 1) + 8LL * (void)i);
          id v14 = -[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:]( self,  "valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:",  a3,  a4,  a5,  v13,  a6,  v23);
          if ([v14 count])
          {
            __int128 v30 = i;
            CanonicalLocaleIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString( 0LL,  v13);
            if (!CanonicalLocaleIdentifierFromString) {
              CanonicalLocaleIdentifierFromString = v13;
            }
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v32;
              do
              {
                for (j = 0LL; j != v17; j = (char *)j + 1)
                {
                  if (*(void *)v32 != v18) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
                  id v21 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v20);
                  if (!v21)
                  {
                    id v21 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[__CFArray count](v10, "count"));
                    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v21, v20);
                  }

                  -[NSMutableDictionary setObject:forKey:]( v21,  "setObject:forKey:",  [v14 objectForKey:v20],  CanonicalLocaleIdentifierFromString);
                }

                id v17 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }

              while (v17);
            }

            i = v30;
          }
        }

        id v29 = -[__CFArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      }

      while (v29);
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)valuesForEntries:(id *)a3 inPlistAtURL:(id)a4
{
  if (a4)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (a3->var0)
    {
      v8 = a3 + 1;
      do
      {
        -[NSMutableSet addObject:](v7, "addObject:");
        id var0 = v8->var0;
        ++v8;
      }

      while (var0);
    }

    if (-[NSMutableSet count](v7, "count"))
    {
      id v39 = 0LL;
      CFArrayRef v10 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  a4,  1LL,  &v39);
      if (v10)
      {
        uint64_t v11 = v10;
        CFErrorRef err = 0LL;
        __int128 v38 = 0LL;
        _CFPropertyListCreateFiltered(0LL, v10, 0LL, v7, &v38, &err);
        v12 = v38;
        if (v38)
        {
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            id v14 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableSet count](v7, "count"));
            if (a3->var0)
            {
              do
              {
                id v15 = -[AAPSyncMetaDataItemUpdate valueForPlistEntry:inBundle:withInfo:entitlements:]( self,  "valueForPlistEntry:inBundle:withInfo:entitlements:",  a3,  0LL,  v38,  0LL);
                if (v15) {
                  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, a3->var0);
                }
                id v16 = a3[1].var0;
                ++a3;
              }

              while (v16);
            }
          }

          else
          {
            v28 = (os_log_s *)AFSiriLogContextPlugin;
            if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
            {
              appId = self->_appId;
              *(_DWORD *)buf = 136315906;
              id v41 = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
              __int16 v42 = 2112;
              id v43 = a4;
              __int16 v44 = 2112;
              v45 = appId;
              __int16 v46 = 2112;
              CFErrorDomain v47 = v38;
              _os_log_error_impl( &dword_0,  v28,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: could not understand plist file data at url='%@' (%@) -> %@",  buf,  0x2Au);
            }

            id v14 = 0LL;
          }
        }

        else
        {
          v25 = err;
          id v26 = (os_log_s *)AFSiriLogContextPlugin;
          BOOL v27 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            if (!v27)
            {
              id v14 = 0LL;
              goto LABEL_28;
            }

            __int128 v34 = self->_appId;
            CFErrorDomain Domain = CFErrorGetDomain(v25);
            CFIndex Code = CFErrorGetCode(err);
            *(_DWORD *)buf = 136316418;
            id v41 = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
            __int16 v42 = 2112;
            id v43 = a4;
            __int16 v44 = 2112;
            v45 = v34;
            __int16 v46 = 2114;
            CFErrorDomain v47 = Domain;
            __int16 v48 = 2048;
            CFIndex v49 = Code;
            __int16 v50 = 2112;
            CFErrorRef v51 = err;
            _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: could not parse plist file at url='%@' (%@) -> {%{public}@:%li}%@",  buf,  0x3Eu);
          }

          else
          {
            if (!v27)
            {
              id v14 = 0LL;
              goto LABEL_29;
            }

            sub_11FB0((uint64_t)a4, (uint64_t)self, v26);
          }

          id v14 = 0LL;
        }

        v25 = err;
        if (!err)
        {
LABEL_29:

          goto LABEL_30;
        }

- (id)scrapeAppInfo
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___SAAppInfo);
  uint64_t v5 = objc_autoreleasePoolPush();
  __int128 v37 = v4;
  -[SAAppInfo setIdentifier:](v4, "setIdentifier:", AAPSyncInfoIdentifierForAppId((uint64_t)self->_appId));
  id v6 = -[LSApplicationProxy bundleURL](self->_appProxy, "bundleURL");
  CFTypeRef cf = (CFTypeRef)_CFBundleCreateUnique(0LL, v6);
  if (cf)
  {
    v76[0] = kCFBundleIdentifierKey;
    v76[1] = "setAppId:";
    v76[2] = &stru_1C9C0;
    v76[3] = AAPPlistStringParser;
    v76[4] = 0LL;
    v76[5] = kCFBundleVersionKey;
    v76[6] = "setAppVersion:";
    v76[7] = &stru_1C9C0;
    v76[8] = AAPPlistStringParser;
    v76[9] = 0LL;
    v76[10] = _kCFBundleShortVersionStringKey;
    v76[11] = 0LL;
    v76[12] = 0LL;
    v76[13] = AAPPlistStringParser;
    v76[14] = 0LL;
    v76[15] = kCFBundleNameKey;
    v76[16] = "setAppName:";
    v76[17] = &stru_1C9C0;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_B468;
    v48[3] = &unk_1CA28;
    v48[4] = v6;
    v76[18] = AAPPlistStringParser;
    v76[19] = v48;
    v76[20] = @"CFBundleDisplayName";
    v76[21] = "setDisplayAppName:";
    v76[22] = &stru_1C9C0;
    v76[23] = AAPPlistStringParser;
    v76[24] = 0LL;
    v76[25] = @"CFBundleSpokenName";
    v76[26] = "setSpokenName:";
    v76[27] = &stru_1C9C0;
    v76[28] = AAPPlistStringParser;
    v76[29] = 0LL;
    v76[30] = _kCFBundleURLTypesKey;
    v76[31] = "setSupportedSchemes:";
    v76[32] = &stru_1C9C0;
    v76[33] = AAPPlistURLTypesSchemesParser;
    __int128 v79 = 0u;
    __int128 v78 = 0u;
    __int128 v77 = 0u;
    __int16 v46 = v76;
    id v47 = 0LL;
    v72[0] = kCFBundleNameKey;
    v72[1] = "setAppNameMap:";
    v72[2] = &stru_1C9C0;
    v72[3] = AAPPlistStringParser;
    v72[4] = 0LL;
    v72[5] = @"CFBundleDisplayName";
    v72[6] = "setDisplayAppNameMap:";
    v72[7] = &stru_1C9C0;
    v72[8] = AAPPlistStringParser;
    v72[9] = 0LL;
    v72[10] = @"CFBundleSpokenName";
    v72[11] = "setSpokenNameMap:";
    v72[12] = &stru_1C9C0;
    v72[13] = AAPPlistStringParser;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int16 v44 = v72;
    id v45 = 0LL;
    v68[0] = @"itemId";
    v68[1] = "setAdamId:";
    v68[2] = &stru_1C9C0;
    v68[3] = AAPPlistStringFromNumberParser;
    v68[4] = 0LL;
    v68[5] = @"itemName";
    v68[6] = "setSpotlightName:";
    v68[7] = &stru_1C9C0;
    v68[8] = AAPPlistStringParser;
    v68[9] = 0LL;
    v68[10] = @"artistName";
    v68[11] = "setProviderName:";
    v68[12] = &stru_1C9C0;
    v68[13] = AAPPlistStringParser;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int16 v42 = v68;
    id v43 = 0LL;
    __int16 v50 = "setAppIdentifyingInfo:";
    CFErrorRef v51 = &stru_1C9C0;
    v52 = AAPAggregateSyncIdentityParser;
    uint64_t v53 = 0LL;
    v54 = "setBetaApp:";
    v55 = &stru_1CA00;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_B480;
    v41[3] = &unk_1CA28;
    v41[4] = self;
    uint64_t v56 = 0LL;
    v57 = v41;
    v58 = "setSupportsUniversalSearchSubscription:";
    v59 = &stru_1CA00;
    v60 = AAPUniversalSearchParser;
    uint64_t v61 = 0LL;
    v62 = "setHasSiriIntegration:";
    v63 = &stru_1CA00;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_B4AC;
    v40[3] = &unk_1CA28;
    v40[4] = self;
    uint64_t v64 = 0LL;
    v65 = v40;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    id v7 = -[LSApplicationProxy entitlements](self->_appProxy, "entitlements");
    if (!v7 || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_12180();
      }
    }

    id v9 = -[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:]( self,  "valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:",  v46,  cf,  v7,  0LL,  0LL);
    id v47 = v9;
    if (v9)
    {
      id v10 = v9;
      id v11 = [v9 objectForKey:kCFBundleIdentifierKey];
      if ([v11 isEqualToString:self->_appId])
      {
        SEL v32 = a2;
        __int128 v33 = v5;
        id v35 = v7;
        id v45 = -[AAPSyncMetaDataItemUpdate valuesForLocalInfoPlistEntries:inBundle:withEntitlements:ignoringDefaultValues:]( self,  "valuesForLocalInfoPlistEntries:inBundle:withEntitlements:ignoringDefaultValues:",  v44,  cf,  v7,  v10);
        if (objc_msgSend( -[LSApplicationProxy applicationType](self->_appProxy, "applicationType"),  "isEqualToString:",  @"User")) {
          id v43 = -[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]( self,  "valuesForEntries:inPlistAtURL:",  v68,  objc_msgSend( -[LSApplicationProxy bundleContainerURL](self->_appProxy, "bundleContainerURL"),  "URLByAppendingPathComponent:isDirectory:",  @"iTunesMetadata.plist",  0));
        }
        __int128 v34 = self;
        uint64_t v12 = 0LL;
        uint64_t v13 = &v46;
        v49[0] = &v46;
        v49[1] = &v44;
        v49[2] = &v42;
        v49[3] = 0LL;
        do
        {
          id v14 = *v13;
          if (**v13)
          {
            uint64_t v15 = 0LL;
            uint64_t v16 = 0LL;
            id v17 = v13[1];
            uint64_t v18 = *v13;
            do
            {
              uint64_t v19 = &v14[v15];
              uint64_t v20 = v14[v15 + 2];
              if (v20)
              {
                uint64_t v21 = v19[1];
                if (!v21)
                {
                  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  v32,  v34,  @"AAPSyncMetaDataItemUpdate.m",  472LL,  @"no selector defined for setter of key=%@",  *v18);
                  uint64_t v21 = v19[1];
                  uint64_t v20 = v19[2];
                }

                (*(void (**)(uint64_t, SAAppInfo *, uint64_t, id))(v20 + 16))( v20,  v37,  v21,  objc_msgSend(v17, "objectForKey:"));
                id v14 = *v13;
              }

              ++v16;
              uint64_t v18 = &v14[5 * v16];
              uint64_t v22 = v14[v15 + 5];
              v15 += 5LL;
            }

            while (v22);
          }

          uint64_t v13 = (void **)v49[++v12];
        }

        while (v13);
        if (v51)
        {
          uint64_t v23 = 0LL;
          id v24 = v47;
          id v25 = v45;
          id v26 = &v50;
          id v27 = v43;
          do
          {
            if (!*v26) {
              -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  v32,  v34,  @"AAPSyncMetaDataItemUpdate.m",  484LL,  @"no selector defined for aggregateSetter at index=%li",  v23);
            }
            v38[4] = v26;
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472LL;
            v39[2] = sub_B4F8;
            v39[3] = &unk_1CA50;
            v39[4] = v24;
            v39[5] = v25;
            v39[6] = v27;
            v39[7] = v35;
            v39[8] = v26;
            v39[9] = cf;
            v28 = v26[3];
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472LL;
            v38[2] = sub_B524;
            v38[3] = &unk_1C980;
            -[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]( v34,  "valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:",  v39,  v28,  v38);
            (*((void (**)(void))v26[1] + 2))();
            ++v23;
            id v29 = v26[5];
            v26 += 4;
          }

          while (v29);
        }

        uint64_t v5 = v33;
      }

      else
      {
        BOOL v30 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR);
        if (v11)
        {
          if (v30) {
            sub_1210C();
          }
        }

        else if (v30)
        {
          sub_120A0();
        }
      }
    }

    CFRelease(cf);
  }

  else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
  {
    sub_12034();
  }

  objc_autoreleasePoolPop(v5);
  return v37;
}

- (BOOL)isMetaDataItemUpdate
{
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p appId='%@' bundleURL='%@' anchor=%@>",  objc_opt_class(self),  self,  self->_appId,  -[LSApplicationProxy bundleURL](self->_appProxy, "bundleURL"),  self->_anchor);
}

- (NSString)appId
{
  return self->_appId;
}

- (AAPSyncAnchor)anchor
{
  return self->_anchor;
}

@end