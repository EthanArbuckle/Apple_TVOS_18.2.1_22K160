@interface TileImage
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertImage:(id)a3 inDatabase:(id)a4;
- (TileImage)initWithImage:(id)a3 inDatabase:(id)a4;
- (id)tileImage;
@end

@implementation TileImage

- (TileImage)initWithImage:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 symbolName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v9, @"symbol");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 hasColorContent]));
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v10, @"hasColorContent");

  uint64_t v11 = PKSemanticColorToString([v7 tintColor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v12, @"tint");

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 imageName]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v8, "setObjectOrNull:forKey:", v13, @"iconName");

  v14 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v8, v6);
  return v14;
}

+ (id)insertImage:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    v18 = sub_1002C57B0;
    v19 = sub_1002C57C0;
    id v20 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002C57C8;
    v10[3] = &unk_1006477E8;
    v13 = &v15;
    id v14 = a1;
    id v11 = v6;
    id v12 = v7;
    sub_1002CCC5C((uint64_t)v12, v10);
    id v8 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)tileImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TileImage _propertySetters](&OBJC_CLASS___TileImage, "_propertySetters"));
  id v4 = -[PKPassTileImage _init](objc_alloc(&OBJC_CLASS___PKPassTileImage), "_init");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002C5900;
  v11[3] = &unk_100639EE8;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)databaseTable
{
  return @"pass_tile_image";
}

+ (id)_propertySetters
{
  v3[0] = @"symbol";
  v3[1] = @"iconName";
  v4[0] = &stru_1006535E8;
  v4[1] = &stru_100653608;
  v3[2] = @"tint";
  v3[3] = @"hasColorContent";
  v4[2] = &stru_100653628;
  v4[3] = &stru_100653648;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end