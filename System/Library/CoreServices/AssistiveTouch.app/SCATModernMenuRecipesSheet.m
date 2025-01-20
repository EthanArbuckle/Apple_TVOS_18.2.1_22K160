@interface SCATModernMenuRecipesSheet
- (NSArray)recipes;
- (SCATModernMenuRecipesSheet)initWithMenu:(id)a3;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (void)menuItemWasActivated:(id)a3;
- (void)setRecipes:(id)a3;
@end

@implementation SCATModernMenuRecipesSheet

- (SCATModernMenuRecipesSheet)initWithMenu:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuRecipesSheet;
  v3 = -[SCATModernMenuSheet initWithMenu:](&v7, "initWithMenu:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 switchControlRecipes]);
    -[SCATModernMenuRecipesSheet setRecipes:](v3, "setRecipes:", v5);
  }

  return v3;
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuRecipesSheet recipes](self, "recipes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v3 count] + 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuRecipesSheet recipes](self, "recipes"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10004A3A8;
  v20[3] = &unk_1001235E8;
  v20[4] = self;
  id v7 = v5;
  id v21 = v7;
  id v8 = v4;
  id v22 = v8;
  [v6 enumerateObjectsUsingBlock:v20];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 screenPoint]);

  if (v10)
  {
    id v11 = sub_10002B014(@"CREATE_RECIPE_FROM_POINT");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"create_recipe_from_point",  self,  v12,  @"SCATIcon_recipe_createFromTap",  2LL));

    [v8 addObject:v13];
    id v14 = sub_10002B014(@"CREATE_RECIPE_FROM_HOLD_POINT");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"create_recipe_from_hold_point",  self,  v15,  @"SCATIcon_recipe_createFromHold",  2LL));

    [v8 addObject:v16];
  }

  v17 = v22;
  id v18 = v8;

  return v18;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 hasPrefix:@"recipe_"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", objc_msgSend(@"recipe_", "length")));
    id v8 = [v7 integerValue];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuRecipesSheet recipes](self, "recipes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v8]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 delegate]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    [v12 menu:v13 activateRecipe:v10];
  }

  else if (([v5 isEqualToString:@"create_recipe_from_point"] & 1) != 0 {
         || [v5 isEqualToString:@"create_recipe_from_hold_point"])
  }
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 screenPoint]);

    if (!v15) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuRecipesSheet.m",  89LL,  "-[SCATModernMenuRecipesSheet menuItemWasActivated:]",  @"Can't create a recipe for no point");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 screenPoint]);
    [v17 CGPointValue];
    double v19 = v18;
    double v21 = v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 scatUIContext]);
    +[HNDScreen convertPoint:toView:](&OBJC_CLASS___HNDScreen, "convertPoint:toView:", v23, v19, v21);
    double v25 = v24;
    double v27 = v26;

    LODWORD(v16) = [v5 isEqualToString:@"create_recipe_from_hold_point"];
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v29 = v28;
    if ((_DWORD)v16) {
      id v30 = objc_msgSend(v28, "createAndSaveRecipeForInterfaceOrientedHoldPoint:", v25, v27);
    }
    else {
      id v31 = objc_msgSend(v28, "createAndSaveRecipeForInterfaceOrientedPoint:", v25, v27);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 switchControlRecipes]);
    -[SCATModernMenuRecipesSheet setRecipes:](self, "setRecipes:", v33);

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10004A884;
    v36[3] = &unk_100121D18;
    v36[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v36, v34, 0.0);
  }

  else
  {
    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___SCATModernMenuRecipesSheet;
    -[SCATModernMenuSheet menuItemWasActivated:](&v35, "menuItemWasActivated:", v4);
  }
}

- (int64_t)preferredTipObject
{
  return 1LL;
}

- (NSArray)recipes
{
  return self->_recipes;
}

- (void)setRecipes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end