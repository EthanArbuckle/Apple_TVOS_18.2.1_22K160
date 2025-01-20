@interface GCTVSettingsGameWrapper
- (BOOL)isEqual:(id)a3;
- (GCSGame)game;
- (GCTVSettingsControllerRepresentedObject)representedObject;
- (GCTVSettingsGameWrapper)initWithGame:(id)a3 profile:(id)a4 record:(id)a5 representedObject:(id)a6;
- (LSApplicationRecord)record;
- (id)description;
- (id)profile;
- (unint64_t)hash;
- (void)save;
- (void)setGame:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRecord:(id)a3;
@end

@implementation GCTVSettingsGameWrapper

- (GCTVSettingsGameWrapper)initWithGame:(id)a3 profile:(id)a4 record:(id)a5 representedObject:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = &OBJC_CLASS___GCTVSettingsGameWrapper;
  v14 = -[GCTVSettingsGameWrapper init](&v27, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_representedObject, v13);
    objc_storeStrong((id *)&v15->_record, a5);
    if (v10)
    {
      v16 = (GCSGame *)v10;
      game = v15->_game;
      v15->_game = v16;
    }

    else
    {
      v18 = objc_alloc(&OBJC_CLASS___GCSGame);
      game = (GCSGame *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](v15->_record, "bundleIdentifier"));
      record = v15->_record;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
      v21 = (void *)objc_claimAutoreleasedReturnValue( -[LSApplicationRecord localizedNameWithPreferredLocalizations:]( record,  "localizedNameWithPreferredLocalizations:",  v20));
      v22 = -[GCSGame initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:]( v18,  "initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:",  game,  v21,  &__NSDictionary0__struct,  &__NSDictionary0__struct);
      v23 = v15->_game;
      v15->_game = v22;
    }

    if (v11) {
      v24 = (GCSNilProfile *)v11;
    }
    else {
      v24 = objc_opt_new(&OBJC_CLASS___GCSNilProfile);
    }
    id profile = v15->_profile;
    v15->_id profile = v24;
  }

  return v15;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<GCTVSettingsGameWrapper game: %@, profile: %@, record: %@>",  self->_game,  self->_profile,  self->_record);
}

- (void)setProfile:(id)a3
{
}

- (void)save
{
  p_representedObject = &self->_representedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained controller]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentIdentifier]);

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_representedObject);
    id v24 = (id)objc_claimAutoreleasedReturnValue([v7 prefsStore]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCSGame bundleIdentifier](self->_game, "bundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v24 gameWithBundleIdentifier:v8]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GCSGame controllerToProfileMappings](self->_game, "controllerToProfileMappings"));
    id v11 = [v10 mutableCopy];

    id profile = self->_profile;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___GCSProfile);
    if ((objc_opt_isKindOfClass(profile, v13) & 1) != 0)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([self->_profile uuid]);
      id v15 = objc_loadWeakRetained((id *)p_representedObject);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 controller]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 persistentIdentifier]);
      [v11 setObject:v14 forKeyedSubscript:v17];
    }

    else
    {
      id v14 = objc_loadWeakRetained((id *)p_representedObject);
      id v15 = (id)objc_claimAutoreleasedReturnValue([v14 controller]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistentIdentifier]);
      [v11 removeObjectForKey:v16];
    }

    v18 = objc_alloc(&OBJC_CLASS___GCSGame);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GCSGame bundleIdentifier](self->_game, "bundleIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GCSGame title](self->_game, "title"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[GCSGame controllerToCompatibilityModeMappings]( self->_game,  "controllerToCompatibilityModeMappings"));
    v22 = -[GCSGame initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:]( v18,  "initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:",  v19,  v20,  v11,  v21);

    id v23 = [v11 count];
    if (v9)
    {
      if (v23) {
        [v24 updateGameFrom:v9 to:v22 saveToDisk:1];
      }
      else {
        [v24 removeGame:v9 saveToDisk:1];
      }
    }

    else if (v23)
    {
      [v24 addGame:v22 saveToDisk:1];
    }
  }

- (BOOL)isEqual:(id)a3
{
  v4 = (GCTVSettingsGameWrapper *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___GCTVSettingsGameWrapper);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCSGame bundleIdentifier](self->_game, "bundleIdentifier"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsGameWrapper game](v4, "game"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
      unsigned __int8 v9 = [v6 isEqual:v8];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GCSGame bundleIdentifier](self->_game, "bundleIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (GCSGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (id)profile
{
  return self->_profile;
}

- (LSApplicationRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (GCTVSettingsControllerRepresentedObject)representedObject
{
  return (GCTVSettingsControllerRepresentedObject *)objc_loadWeakRetained((id *)&self->_representedObject);
}

- (void).cxx_destruct
{
}

@end