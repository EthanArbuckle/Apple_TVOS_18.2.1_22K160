@interface PBSiriScreenActionApplication
- (AXElement)accessibilityElement;
- (NSArray)commandScreenActionItems;
- (NSArray)currentScreenActionItems;
- (NSDictionary)semanticContext;
- (NSString)bundleIdentifier;
- (PBSiriScreenActionApplication)initWithAccessibilityElement:(id)a3;
- (id)_filteredScreenActionItems:(id)a3 applicationScreenActionItems:(id)a4 screenActionItemsWithSemanticContext:(id)a5;
- (id)_focusableScreenActionItems;
- (id)_screenActionItemsFromAccessibilityElements:(id)a3;
- (id)_visibleScreenActionItemsWithSemanticContext;
- (id)screenActionItemForIdentifier:(id)a3;
- (void)setAccessibilityElement:(id)a3;
- (void)setCommandScreenActionItems:(id)a3;
- (void)setSemanticContext:(id)a3;
@end

@implementation PBSiriScreenActionApplication

- (PBSiriScreenActionApplication)initWithAccessibilityElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSiriScreenActionApplication;
  v6 = -[PBSiriScreenActionApplication init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessibilityElement, a3);
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication accessibilityElement](self, "accessibilityElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleId]);

  return (NSString *)v3;
}

- (NSDictionary)semanticContext
{
  semanticContext = self->_semanticContext;
  if (!semanticContext)
  {
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[AXElement semanticContext](self->_accessibilityElement, "semanticContext"));
    id v5 = self->_semanticContext;
    self->_semanticContext = v4;

    semanticContext = self->_semanticContext;
  }

  return semanticContext;
}

- (NSArray)commandScreenActionItems
{
  commandScreenActionItems = self->_commandScreenActionItems;
  if (!commandScreenActionItems)
  {
    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication semanticContext](self, "semanticContext"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCLinkedDataUtilities tvSchemaCommandsKeyCompactIRI]( &OBJC_CLASS___TVSCLinkedDataUtilities,  "tvSchemaCommandsKeyCompactIRI"));
    v21 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_arrayForKey:", v5));

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      uint64_t v10 = TVSCSchemaDotOrgNameKey;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_stringForKey:", v10));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication bundleIdentifier](self, "bundleIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v14,  v13));

          v16 = objc_alloc(&OBJC_CLASS___PBSiriScreenActionItem);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication accessibilityElement](self, "accessibilityElement"));
          v18 = -[PBSiriScreenActionItem initWithAccessibilityElement:](v16, "initWithAccessibilityElement:", v17);

          -[PBSiriScreenActionItem setSemanticContext:](v18, "setSemanticContext:", v12);
          -[PBSiriScreenActionItem setIdentifier:](v18, "setIdentifier:", v15);
          -[NSMutableArray addObject:](v23, "addObject:", v18);
        }

        id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v8);
    }

    v19 = self->_commandScreenActionItems;
    self->_commandScreenActionItems = &v23->super;

    commandScreenActionItems = self->_commandScreenActionItems;
  }

  return commandScreenActionItems;
}

- (NSArray)currentScreenActionItems
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication commandScreenActionItems](self, "commandScreenActionItems"));
  if (v4) {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);
  }
  id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionApplication _visibleScreenActionItemsWithSemanticContext]( self,  "_visibleScreenActionItemsWithSemanticContext"));
  id v6 = sub_1000F75DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Semantic Context Screen Action Items: %@",  buf,  0xCu);
  }

  if (v5) {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);
  }
  id v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionApplication _focusableScreenActionItems]( self,  "_focusableScreenActionItems"));
  id v9 = sub_1000F75DC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Focusable Screen Action Items: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionApplication _filteredScreenActionItems:applicationScreenActionItems:screenActionItemsWithSemanticContext:]( self,  "_filteredScreenActionItems:applicationScreenActionItems:screenActionItemsWithSemanticContext:",  v8,  v4,  v5));
  if ([v11 count]) {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v11);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000A0020;
  v16[3] = &unk_1003D49A8;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  v17 = v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v16);
  -[NSMutableArray removeObjectsAtIndexes:](v3, "removeObjectsAtIndexes:", v12);
  id v13 = sub_1000F75DC();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Returning Screen Action Items: %@", buf, 0xCu);
  }

  return (NSArray *)v3;
}

- (id)screenActionItemForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication currentScreenActionItems](self, "currentScreenActionItems"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", (void)v13));
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_visibleScreenActionItemsWithSemanticContext
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication accessibilityElement](self, "accessibilityElement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementsWithSemanticContext]);
  if (![v4 count])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 siriContentElementsWithSemanticContext]);

    id v4 = (void *)v5;
  }

  id v6 = sub_1000F75DC();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    unsigned int v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Semantic Context AXElements: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionApplication _screenActionItemsFromAccessibilityElements:]( self,  "_screenActionItemsFromAccessibilityElements:",  v4));
  return v8;
}

- (id)_focusableScreenActionItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionApplication accessibilityElement](self, "accessibilityElement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nativeFocusableElements]);
  if (![v4 count])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 siriContentNativeFocusableElements]);

    id v4 = (void *)v5;
  }

  id v6 = sub_1000F75DC();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    unsigned int v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Focusable AXElements: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSiriScreenActionApplication _screenActionItemsFromAccessibilityElements:]( self,  "_screenActionItemsFromAccessibilityElements:",  v4));
  return v8;
}

- (id)_screenActionItemsFromAccessibilityElements:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
        unsigned int v11 = objc_alloc(&OBJC_CLASS___PBSiriScreenActionItem);
        v12 = -[PBSiriScreenActionItem initWithAccessibilityElement:]( v11,  "initWithAccessibilityElement:",  v10,  (void)v15);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem semanticContext](v12, "semanticContext"));
        if (v13) {
          -[NSMutableArray addObject:](v4, "addObject:", v12);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)_filteredScreenActionItems:(id)a3 applicationScreenActionItems:(id)a4 screenActionItemsWithSemanticContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  if ([v8 count] || (id v11 = v10, objc_msgSend(v9, "count")))
  {
    v35 = v9;
    v36 = v10;
    id v37 = v8;
    v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v49;
      uint64_t v15 = TVSCJSONLinkedDataTypeKey;
      uint64_t v16 = TVSCSchemaDotOrgNameKey;
      do
      {
        __int128 v17 = 0LL;
        do
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(obj);
          }
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * (void)v17), "semanticContext", v35));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tvs_stringForKey:", v15));
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCLinkedDataUtilities tvSchemaTypeSoftwareApplicationNavigationCommandCompactIRI]( &OBJC_CLASS___TVSCLinkedDataUtilities,  "tvSchemaTypeSoftwareApplicationNavigationCommandCompactIRI"));
          unsigned int v21 = [v19 isEqual:v20];

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tvs_stringForKey:", v16));
            if (v22) {
              -[NSMutableDictionary tvs_setObjectIfNotNil:forKey:]( v38,  "tvs_setObjectIfNotNil:forKey:",  &__kCFBooleanTrue,  v22);
            }
          }

          __int128 v17 = (char *)v17 + 1;
        }

        while (v13 != v17);
        id v13 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }

      while (v13);
    }

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v9 = v35;
    id v24 = v35;
    id v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v45;
      do
      {
        v28 = 0LL;
        do
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * (void)v28), "identifier", v35));
          if (v29) {
            -[NSMutableDictionary tvs_setObjectIfNotNil:forKey:]( v23,  "tvs_setObjectIfNotNil:forKey:",  &__kCFBooleanTrue,  v29);
          }

          v28 = (char *)v28 + 1;
        }

        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }

      while (v26);
    }

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1000A0898;
    v40[3] = &unk_1003D49D0;
    v41 = v38;
    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    v43 = v23;
    v30 = v23;
    v31 = v42;
    v32 = v38;
    id v10 = v36;
    [v36 enumerateObjectsUsingBlock:v40];
    id v33 = [v36 mutableCopy];
    [v33 removeObjectsAtIndexes:v31];
    id v11 = [v33 copy];

    id v8 = v37;
  }

  return v11;
}

- (void)setSemanticContext:(id)a3
{
}

- (AXElement)accessibilityElement
{
  return self->_accessibilityElement;
}

- (void)setAccessibilityElement:(id)a3
{
}

- (void)setCommandScreenActionItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end