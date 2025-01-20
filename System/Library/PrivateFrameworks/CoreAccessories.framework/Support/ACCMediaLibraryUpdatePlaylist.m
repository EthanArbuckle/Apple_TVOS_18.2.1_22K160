@interface ACCMediaLibraryUpdatePlaylist
- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 dict:(id)a4;
- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5;
- (ACCMediaLibraryUpdatePlaylistContent)content;
- (BOOL)folder;
- (BOOL)geniusMix;
- (BOOL)radioStation;
- (BOOL)smartPlaylist;
- (NSString)mediaLibraryUID;
- (NSString)name;
- (NSString)revision;
- (id)copyDict;
- (id)debugDescription;
- (id)description;
- (int)contentStyle;
- (unint64_t)parentPersistentID;
- (unint64_t)persistentID;
- (unint64_t)validMask;
- (unsigned)radioStationOrdering;
- (void)fillStruct:(id *)a3;
- (void)setContent:(id)a3;
- (void)setContentStyle:(int)a3;
- (void)setFolder:(BOOL)a3;
- (void)setGeniusMix:(BOOL)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setName:(id)a3;
- (void)setParentPersistentID:(unint64_t)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setRadioStation:(BOOL)a3;
- (void)setRadioStationOrdering:(unsigned __int16)a3;
- (void)setRevision:(id)a3;
- (void)setSmartPlaylist:(BOOL)a3;
@end

@implementation ACCMediaLibraryUpdatePlaylist

- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ACCMediaLibraryUpdatePlaylist;
  v11 = -[ACCMediaLibraryUpdatePlaylist init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_persistentID = a4;
    v12->_validMask = 1LL;
    name = v12->_name;
    v12->_name = 0LL;

    content = v12->_content;
    v12->_parentPersistentID = 0LL;
    v12->_content = 0LL;
    v12->_contentStyle = 0;
    *(_DWORD *)&v12->_folder = 0;
    v12->_radioStationOrdering = 0;
  }

  return v12;
}

- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___ACCMediaLibraryUpdatePlaylist;
  id v9 = -[ACCMediaLibraryUpdatePlaylist init](&v44, "init");
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibraryUID, a3);
    revision = v10->_revision;
    v10->_revision = (NSString *)&stru_100200A40;

    v10->_persistentID = 0LL;
    name = v10->_name;
    v10->_name = 0LL;

    content = v10->_content;
    v10->_parentPersistentID = 0LL;
    v10->_content = 0LL;
    v10->_int contentStyle = 0;
    *(_DWORD *)&v10->_folder = 0;
    v10->_radioStationOrdering = 0;

    v10->_validMask = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"]);

    if (v14)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"]);
      objc_super v16 = v10->_revision;
      v10->_revision = (NSString *)v15;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"]);
      v10->_persistentID = (unint64_t)[v18 unsignedLongLongValue];

      v10->_validMask |= 1uLL;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistName"]);

    if (v19)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistName"]);
      v21 = v10->_name;
      v10->_name = (NSString *)v20;

      v10->_validMask |= 2uLL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistParentPersistentID"]);

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistParentPersistentID"]);
      v10->_parentPersistentID = (unint64_t)[v23 unsignedLongLongValue];

      v10->_validMask |= 4uLL;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsFolder"]);

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsFolder"]);
      v10->_folder = [v25 unsignedCharValue] != 0;

      v10->_validMask |= 0x10uLL;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsGeniusMix"]);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsGeniusMix"]);
      v10->_geniusMix = [v27 unsignedCharValue] != 0;

      v10->_validMask |= 8uLL;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"]);

    if (v28)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v29 = (os_log_s *)*(id *)gLogObjects;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v29 = (os_log_s *)&_os_log_default;
        id v30 = &_os_log_default;
      }

      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int contentStyle = v10->_contentStyle;
        v32 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"]);
        *(_DWORD *)buf = 138412802;
        v46 = v10;
        __int16 v47 = 1024;
        int v48 = contentStyle;
        __int16 v49 = 2112;
        v50 = v32;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@ contentStyle %d->%@", buf, 0x1Cu);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"]);
      v10->_int contentStyle = [v33 unsignedCharValue];

      v10->_validMask |= 0x20uLL;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsRadioStation"]);

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsRadioStation"]);
      v10->_radioStation = [v35 unsignedCharValue] != 0;

      v10->_validMask |= 0x40uLL;
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"]);

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"]);
      v10->_smartPlaylist = [v37 unsignedCharValue] != 0;

      v10->_validMask |= 0x100uLL;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistRadioStationOrdering"]);

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistRadioStationOrdering"]);
      v10->_radioStationOrdering = (unsigned __int16)[v39 unsignedShortValue];

      v10->_validMask |= 0x200uLL;
    }
  }

  if (gLogObjects) {
    BOOL v40 = gNumLogObjects < 1;
  }
  else {
    BOOL v40 = 1;
  }
  if (v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v42 = (os_log_s *)&_os_log_default;
    id v41 = &_os_log_default;
  }

  else
  {
    v42 = (os_log_s *)*(id *)gLogObjects;
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v10;
}

- (id)description
{
  v2 = &stru_100200A40;
  if (self->_folder) {
    v3 = @" folder";
  }
  else {
    v3 = &stru_100200A40;
  }
  if (self->_geniusMix) {
    v4 = @" geniusMix";
  }
  else {
    v4 = &stru_100200A40;
  }
  if (self->_radioStation) {
    v5 = @" station";
  }
  else {
    v5 = &stru_100200A40;
  }
  if (self->_smartPlaylist) {
    v2 = @" smart";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ACCMediaLibraryUpdatePlaylist>[%@:%llu revision=%@ valid=%llxh '%@' %@ %@ %@ %@ parentPersistentID=%llu]",  self->_mediaLibraryUID,  self->_persistentID,  self->_revision,  self->_validMask,  self->_name,  v3,  v4,  v5,  v2,  self->_parentPersistentID);
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCMediaLibraryUpdatePlaylist description](self, "description"));
  id v4 = -[ACCMediaLibraryUpdatePlaylist copyDict](self, "copyDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n    %@", v3, v4));

  return v5;
}

- (id)copyDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  revision = self->_revision;
  if (revision) {
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  revision,  @"ACCMediaLibraryUpdateRevisionKey");
  }
  unint64_t validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_persistentID));
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  v9,  @"ACCMediaLibraryUpdatePlaylistPersistentID");

    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_5:
      if ((validMask & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }

  else if ((validMask & 2) == 0)
  {
    goto LABEL_5;
  }

  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  self->_name,  @"ACCMediaLibraryUpdatePlaylistName");
  unint64_t validMask = self->_validMask;
  if ((validMask & 4) == 0)
  {
LABEL_6:
    if ((validMask & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }

- (void)fillStruct:(id *)a3
{
  *(void *)&a3->var4 = 0LL;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    id v7 = (os_log_s *)*(id *)gLogObjects;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    acc_platform_packetLogging_logEventVA_cold_5((uint64_t)self, v7);
  }

  unint64_t validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    a3->var1 = self->_persistentID;
    a3->var0 |= 1u;
    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_13:
      if ((validMask & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_26;
    }
  }

  else if ((validMask & 2) == 0)
  {
    goto LABEL_13;
  }

  name = self->_name;
  if (name)
  {
    name = -[NSString UTF8String](name, "UTF8String");
    unint64_t validMask = self->_validMask;
  }

  a3->var2 = (char *)name;
  a3->var0 |= 2u;
  if ((validMask & 4) == 0)
  {
LABEL_14:
    if ((validMask & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setRevision:(id)a3
{
}

- (void)setPersistentID:(unint64_t)a3
{
  unint64_t v3 = self->_validMask | 1;
  self->_persistentID = a3;
  self->_unint64_t validMask = v3;
}

- (void)setName:(id)a3
{
  self->_validMask |= 2uLL;
}

- (void)setParentPersistentID:(unint64_t)a3
{
  self->_parentPersistentID = a3;
  self->_validMask |= 4uLL;
}

- (void)setFolder:(BOOL)a3
{
  self->_folder = a3;
  self->_validMask |= 0x10uLL;
}

- (void)setGeniusMix:(BOOL)a3
{
  self->_geniusMix = a3;
  self->_validMask |= 8uLL;
}

- (void)setContentStyle:(int)a3
{
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    id v7 = (os_log_s *)*(id *)gLogObjects;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCMediaLibraryUpdatePlaylist setContentStyle:].cold.1((uint64_t)self, a3, v7);
  }

  self->_int contentStyle = a3;
  self->_validMask |= 0x20uLL;
}

- (void)setRadioStation:(BOOL)a3
{
  self->_radioStation = a3;
  self->_validMask |= 0x40uLL;
}

- (void)setSmartPlaylist:(BOOL)a3
{
  self->_smartPlaylist = a3;
  self->_validMask |= 0x100uLL;
}

- (void)setRadioStationOrdering:(unsigned __int16)a3
{
  self->_radioStationOrdering = a3;
  self->_validMask |= 0x200uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)parentPersistentID
{
  return self->_parentPersistentID;
}

- (BOOL)folder
{
  return self->_folder;
}

- (BOOL)geniusMix
{
  return self->_geniusMix;
}

- (BOOL)radioStation
{
  return self->_radioStation;
}

- (BOOL)smartPlaylist
{
  return self->_smartPlaylist;
}

- (unsigned)radioStationOrdering
{
  return self->_radioStationOrdering;
}

- (int)contentStyle
{
  return self->_contentStyle;
}

- (ACCMediaLibraryUpdatePlaylistContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setContentStyle:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 16);
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%@ setContentStyle %d->%d",  (uint8_t *)&v4,  0x18u);
  OUTLINED_FUNCTION_2();
}

@end