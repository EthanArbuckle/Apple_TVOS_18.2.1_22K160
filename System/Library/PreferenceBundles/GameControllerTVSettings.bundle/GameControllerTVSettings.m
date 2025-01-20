LABEL_24:
          }

          v8 = (char *)v8 + 1;
        }

        while (v8 != v6);
        v6 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
      }

      while (v6);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v27 = v43;
    v28 = [v27 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v28)
    {
      v29 = v28;
      v30 = *(void *)v58;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleIdentifier]);
          [v26 setObject:v32 forKeyedSubscript:v33];
        }

        v29 = [v27 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }

      while (v29);
    }

    -[GCTVSettingsControllerRepresentedObject setAppsWithSettings:](self, "setAppsWithSettings:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v35 = v44;
    v36 = [v35 countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v36)
    {
      v37 = v36;
      v38 = *(void *)v54;
      do
      {
        for (k = 0LL; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)k);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v40 bundleIdentifier]);
          [v34 setObject:v40 forKeyedSubscript:v41];
        }

        v37 = [v35 countByEnumeratingWithState:&v53 objects:v69 count:16];
      }

      while (v37);
    }

    -[GCTVSettingsControllerRepresentedObject setAppsWithoutSettings:](self, "setAppsWithoutSettings:", v34);
  }

  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    -[GCTVSettingsControllerRepresentedObject setAppsWithSettings:](self, "setAppsWithSettings:", v42);

    v52 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    -[GCTVSettingsControllerRepresentedObject setAppsWithoutSettings:](self, "setAppsWithoutSettings:");
  }
}

BOOL sub_4084(id a1, LSApplicationRecord *a2)
{
  return -[LSApplicationRecord supportsControllerUserInteraction]( a2,  "supportsControllerUserInteraction");
}

void sub_4108(uint64_t a1)
{
  id GCSettingsLogger = getGCSettingsLogger();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "updateCopilotFusedControllers %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controller]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentIdentifier]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controller]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentIdentifier]);

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v30;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pilotIdentifier", (void)v29));
          unsigned int v15 = [v14 isEqualToString:v8];

          if (v15)
          {
            id v10 = v13;
            goto LABEL_15;
          }

          v16 = (void *)objc_claimAutoreleasedReturnValue([v13 copilotIdentifier]);
          int v17 = [v16 isEqualToString:v8];

          if ((v17 & 1) != 0)
          {
            id v10 = v13;

            v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) prefsStore]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v10 pilotIdentifier]);
            v20 = (GCSNilCopilot *)objc_claimAutoreleasedReturnValue([v22 controllerFor:v23]);

            uint64_t v21 = 1LL;
            goto LABEL_19;
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

LABEL_15:
    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) prefsStore]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 copilotIdentifier]);
    v20 = (GCSNilCopilot *)objc_claimAutoreleasedReturnValue([v18 controllerFor:v19]);

    if (!v20) {
      v20 = objc_opt_new(&OBJC_CLASS___GCSNilCopilot);
    }
    uint64_t v21 = 0LL;
LABEL_19:
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v25 = -[GCTVSettingsCopilotFusedControllerWrapper initWithCopilot:controllerIsCopilot:representedObject:]( objc_alloc(&OBJC_CLASS___GCTVSettingsCopilotFusedControllerWrapper),  "initWithCopilot:controllerIsCopilot:representedObject:",  v20,  v21,  *(void *)(a1 + 40));
    -[NSMutableArray addObject:](v24, "addObject:", v25);

    [*(id *)(a1 + 40) setWrappedCopilotFusedController:v24];
    id v26 = getGCSettingsLogger();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) wrappedCopilotFusedController]);
      *(_DWORD *)buf = 138412290;
      v35 = v28;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "self.wrappedCopilotFusedController is now %@", buf, 0xCu);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) navigationController]);
  v22 = [v21 popViewControllerAnimated:1];
}

  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_44D4(uint64_t a1)
{
  uint64_t v1 = a1;
  [*(id *)(a1 + 32) filterSupportedApps];
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = *(id *)(v1 + 40);
  uint64_t v45 = v1;
  id v46 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v46)
  {
    uint64_t v2 = *(void *)v61;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v46; i = (char *)i + 1)
      {
        if (*(void *)v61 != v2) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 controllerToProfileMappings]);
        v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v1 + 32) + 32) persistentIdentifier]);
        v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

        if (v7)
        {
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v1 + 32) + 48) profiles]);
          id v9 = [v8 countByEnumeratingWithState:&v56 objects:v67 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v57;
            while (2)
            {
              for (j = 0LL; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v57 != v10) {
                  objc_enumerationMutation(v8);
                }
                v12 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)j);
                v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
                unsigned int v14 = [v7 isEqual:v13];

                if (v14)
                {
                  id v9 = v12;
                  goto LABEL_17;
                }
              }

              id v9 = [v8 countByEnumeratingWithState:&v56 objects:v67 count:16];
              if (v9) {
                continue;
              }
              break;
            }

LABEL_17:
            uint64_t v1 = v45;
            uint64_t v2 = v40;
          }
        }

        else
        {
          id v9 = 0LL;
        }

        unsigned int v15 = *(void **)(*(void *)(v1 + 32) + 64LL);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

        v18 = -[GCTVSettingsGameWrapper initWithGame:profile:record:representedObject:]( objc_alloc(&OBJC_CLASS___GCTVSettingsGameWrapper),  "initWithGame:profile:record:representedObject:",  v4,  v9,  v17,  *(void *)(v1 + 32));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[GCSGame defaultIdentifier](&OBJC_CLASS___GCSGame, "defaultIdentifier"));
        unsigned int v21 = [v19 isEqualToString:v20];

        if (v21)
        {
          v66 = v18;
          uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
          uint64_t v23 = *(void *)(v1 + 32);
          v24 = *(void **)(v23 + 88);
          *(void *)(v23 + 88) = v22;

          goto LABEL_27;
        }

        if (v9)
        {
          v25 = v38;
        }

        else
        {
          if (!v17) {
            goto LABEL_27;
          }
          v25 = v44;
        }

        -[NSMutableArray addObject:](v25, "addObject:", v18);
LABEL_27:
      }

      id v46 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }

    while (v46);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v39 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v1 + 32) + 72) objectEnumerator]);
  id obja = [v39 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (obja)
  {
    uint64_t v41 = *(void *)v53;
    do
    {
      uint64_t v26 = 0LL;
      do
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(v39);
        }
        uint64_t v47 = v26;
        v27 = -[GCTVSettingsGameWrapper initWithGame:profile:record:representedObject:]( objc_alloc(&OBJC_CLASS___GCTVSettingsGameWrapper),  "initWithGame:profile:record:representedObject:",  0LL,  0LL,  *(void *)(*((void *)&v52 + 1) + 8 * v26),  *(void *)(v1 + 32));
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        v28 = v44;
        id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v48,  v64,  16LL);
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v49;
          while (2)
          {
            for (k = 0LL; k != v30; k = (char *)k + 1)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(v28);
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue([v33 persistentIdentifier]);
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsGameWrapper record](v27, "record"));
              v36 = (void *)objc_claimAutoreleasedReturnValue([v35 persistentIdentifier]);
              unsigned __int8 v37 = [v34 isEqual:v36];

              if ((v37 & 1) != 0)
              {

                goto LABEL_44;
              }
            }

            id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v48,  v64,  16LL);
            if (v30) {
              continue;
            }
            break;
          }
        }

        -[NSMutableArray addObject:](v28, "addObject:", v27);
LABEL_44:

        uint64_t v1 = v45;
        uint64_t v26 = v47 + 1;
      }

      while ((id)(v47 + 1) != obja);
      id obja = [v39 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }

    while (obja);
  }

  -[NSMutableArray sortUsingComparator:](v38, "sortUsingComparator:", &stru_4CA78);
  -[NSMutableArray sortUsingComparator:](v44, "sortUsingComparator:", &stru_4CA78);
  [*(id *)(v1 + 32) setWrappedGamesWithProfile:v38];
  [*(id *)(v1 + 32) setWrappedGamesWithoutProfile:v44];
}
}

  swift_bridgeObjectRelease(v4);
  return 0LL;
}

int64_t sub_4A10(id a1, GCTVSettingsGameWrapper *a2, GCTVSettingsGameWrapper *a3)
{
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsGameWrapper game](a2, "game"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsGameWrapper game](v4, "game"));

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedName]);
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_4B24(uint64_t a1)
{
  uint64_t v2 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [*(id *)(a1 + 32) count]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v7);
        id v9 = objc_alloc(&OBJC_CLASS___GCTVSettingsProfileWrapper);
        uint64_t v10 = -[GCTVSettingsProfileWrapper initWithProfile:](v9, "initWithProfile:", v8, (void)v11);
        -[NSMutableArray addObject:](v2, "addObject:", v10);

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  [*(id *)(a1 + 40) setProfiles:v2];
}

id sub_50C8(uint64_t a1)
{
  id GCSettingsLogger = getGCSettingsLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "End find controller: %@", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 32) setFindingController:0];
}

LABEL_16:
    copilot = self->_copilot;
    v19 = objc_opt_class(&OBJC_CLASS___GCSController);
    if ((objc_opt_isKindOfClass(copilot, v19) & 1) != 0 && (v20 = self->_copilot) != 0LL)
    {
      uint64_t v45 = v20;
      if (v17)
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v17 fusedControllerIdentifier]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 controllerFor:v21]);

        [v7 removeController:v22 saveToDisk:0];
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCopilotFusedControllerWrapper representedObject](self, "representedObject"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 controller]);

      v25 = objc_opt_new(&OBJC_CLASS___NSUUID);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v25, "UUIDString"));

      uint64_t v26 = sub_EAFC((uint64_t)@"%@", @"COPILOT_NAME_AUTO_GENERATED");
      v44 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedName]);
      id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v44, v27));

      uint64_t v41 = objc_alloc(&OBJC_CLASS___GCSController);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v24 productCategoryKey]);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v24 shareButton]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v24 buttons]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v24 dpads]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v24 logoSfSymbolsName]);
      LOBYTE(v25) = [v24 supportsHaptics];
      uint64_t v31 = [v24 supportsLight];
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v24 baseProfile]);
      BYTE1(v38) = v31;
      LOBYTE(v38) = (_BYTE)v25;
      v42 = -[GCSController initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:]( v41,  "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:su pportsHaptics:supportsLight:baseProfile:miscellaneous:",  v46,  v43,  v40,  0LL,  v39,  v28,  v29,  v30,  v38,  v32,  0LL);

      v33 = objc_alloc(&OBJC_CLASS___GCSCopilotFusedController);
      v34 = v45;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v45 persistentIdentifier]);
      v36 = [v33 initWithFusedControllerIdentifier:v43 pilotIdentifier:v5 copilotIdentifier:v35];

      [v7 addCopilotFusedController:v36 saveToDisk:1];
      [v7 addController:v42 saveToDisk:1];
    }

    else
    {
      if (!v17)
      {
LABEL_24:

        goto LABEL_25;
      }

      unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v17 fusedControllerIdentifier]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v7 controllerFor:v37]);

      [v7 removeController:v34 saveToDisk:1];
    }

    goto LABEL_24;
  }

    int v17 = swift_bridgeObjectRelease(v3);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
    v18 = v33[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
    v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v7);
    id v3 = (uint64_t)&v33;
    specialized ContiguousArray._endMutation()(v19);
LABEL_17:
    id v4 = v29;
    a2 = v15;
    goto LABEL_5;
  }

  return _swiftEmptyArrayStorage;
}

LABEL_25:
}

  __int128 v13 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  __int128 v14 = _CocoaArrayWrapper.endIndex.getter(v13);
  swift_release(_swiftEmptyArrayStorage);
  if (!v14) {
    goto LABEL_26;
  }
LABEL_21:
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001LL) != 0)
  {
LABEL_27:
    specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, _swiftEmptyArrayStorage);
    goto LABEL_24;
  }

  if (_swiftEmptyArrayStorage[2])
  {
    __int128 v12 = (id)_swiftEmptyArrayStorage[4];
LABEL_24:
    swift_release(_swiftEmptyArrayStorage);
    return;
  }

  __break(1u);
LABEL_29:
  __break(1u);
}

    __int128 v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    int v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(void *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    result = v19;
  }

  uint64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  unsigned int v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    __int128 v11 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    __int128 v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    unsigned int v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

    __int128 v12 = (v23 - 1) & v23;
    unsigned int v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    int v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unsigned int v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unsigned int v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
  }

  v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  uint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    id v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    id v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    __int128 v14 = (v26 - 1) & v26;
    int v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v17);
    unsigned int v21 = *v19;
    v20 = v19[1];
    uint64_t v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v22, v15);
    uint64_t v23 = v35;
    v24 = (void *)(*(void *)(v35 + 48) + v18);
    void *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain(v20);
  }

  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release(v4);
    v28 = v31;
    id v29 = v35;
    goto LABEL_28;
  }

  uint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    __int128 v11 = v27;
    goto LABEL_25;
  }

  while (1)
  {
    __int128 v11 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_26;
    }
    uint64_t v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }

      swift_bridgeObjectRelease(v4);
      uint64_t v23 = [v8 persistentIdentifier];
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      id v4 = v25;

      uint64_t v26 = a3[2];
      if (v26)
      {
        v27 = a3[4];
        v28 = a3[5];
        if (v27 == v24 && v28 == v4 || (_stringCompareWithSmolCheck(_:_:expecting:)(v27, v28, v24, v4, 0LL) & 1) != 0) {
          goto LABEL_4;
        }
        if (v26 != 1)
        {
          id v29 = a3 + 7;
          id v30 = 1LL;
          do
          {
            uint64_t v31 = v30 + 1;
            if (__OFADD__(v30, 1LL)) {
              goto LABEL_57;
            }
            __int128 v32 = *(v29 - 1);
            v33 = *v29;
            v34 = v32 == v24 && v33 == v4;
            if (v34 || (_stringCompareWithSmolCheck(_:_:expecting:)(v32, v33, v24, v4, 0LL) & 1) != 0) {
              goto LABEL_4;
            }
            v29 += 2;
            ++v30;
          }

          while (v31 != v26);
        }
      }

      swift_bridgeObjectRelease(v4);
      v35 = [v8 persistentIdentifier];
      v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
      id v4 = v37;

      v38 = a4[2];
      if (!v38) {
        goto LABEL_51;
      }
      id v39 = a4[4];
      uint64_t v40 = a4[5];
      if ((v39 != v36 || v40 != v4) && (_stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v36, v4, 0LL) & 1) == 0) {
        break;
      }
LABEL_4:

      swift_bridgeObjectRelease(v4);
LABEL_5:
      if (v6 == i) {
        return v59;
      }
    }

    if (v38 == 1)
    {
LABEL_51:
      uint64_t v47 = swift_bridgeObjectRelease(v4);
      id v4 = (uint64_t)&v59;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v47);
      __int128 v48 = v59[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v48);
      __int128 v49 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v48, v8);
      specialized ContiguousArray._endMutation()(v49);
      goto LABEL_5;
    }

    uint64_t v41 = a4 + 7;
    v42 = 1LL;
    while (1)
    {
      v43 = v42 + 1;
      if (__OFADD__(v42, 1LL)) {
        break;
      }
      v44 = *(v41 - 1);
      uint64_t v45 = *v41;
      id v46 = v44 == v36 && v45 == v4;
      if (v46 || (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, v36, v4, 0LL) & 1) != 0) {
        goto LABEL_4;
      }
      v41 += 2;
      ++v42;
      if (v43 == v38) {
        goto LABEL_51;
      }
    }

    __int128 v12 = (v23 - 1) & v23;
    unsigned int v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    int v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unsigned int v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unsigned int v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = v20;
  }

  v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  uint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    id v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    id v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

  if (*(unsigned __int8 *)(a1 + v4[8]) != *(unsigned __int8 *)(a2 + v4[8])
    || *(unsigned __int8 *)(a1 + v4[9]) != *(unsigned __int8 *)(a2 + v4[9]))
  {
    return 0LL;
  }

  v27 = v4[10];
  v28 = *(void *)(a1 + v27);
  id v29 = *(void *)(a1 + v27 + 8);
  id v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  if (v28 == *v30 && v29 == v31
    || (__int128 v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, *v30, v31, 0LL), result = 0LL, (v32 & 1) != 0))
  {
    sub_3624C(*(void *)(a1 + v4[11]), *(void *)(a2 + v4[11]));
    if ((v33 & 1) != 0
      && *(unsigned __int8 *)(a1 + v4[12]) == *(unsigned __int8 *)(a2 + v4[12])
      && *(double *)(a1 + v4[13]) == *(double *)(a2 + v4[13])
      && *(void *)(a1 + v4[14]) == *(void *)(a2 + v4[14])
      && *(void *)(a1 + v4[15]) == *(void *)(a2 + v4[15])
      && *(unsigned __int8 *)(a1 + v4[16]) == *(unsigned __int8 *)(a2 + v4[16])
      && *(unsigned __int8 *)(a1 + v4[17]) == *(unsigned __int8 *)(a2 + v4[17]))
    {
      return *(void *)(a1 + v4[18]) == *(void *)(a2 + v4[18]);
    }

    return 0LL;
  }

  return result;
}

void sub_76AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12, id *a13, id *a14)
{
}

void sub_778C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "state") != 0);
}

void sub_77D4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) isConnected])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 detailedProductCategory]);
    id v6 = [v5 isEqual:@"Xbox Series X"];
  }

  else
  {
    id v6 = &dword_0 + 1;
  }

  [v7 setHidden:v6];
}

void sub_7870(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
    [v10 setHidden:v6 == 0];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObj]);
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v7, "findingController") ^ 1);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObj]);
    else {
      uint64_t v9 = 0LL;
    }
    [v10 setAccessoryTypes:v9];
  }
}

id sub_7940(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___GCTVSettingsProfileControllerRepresentedObject);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
    __int128 v11 = -[GCTVSettingsProfileControllerRepresentedObject initWithProfile:controller:]( v9,  "initWithProfile:controller:",  v10,  WeakRetained[16]);

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    uint64_t v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    v19 = sub_7ADC;
    v20 = &unk_4CB40;
    objc_copyWeak(&v22, v7);
    __int128 v14 = v11;
    unsigned int v21 = v14;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v13,  0LL,  v14,  0LL,  &v17));

    objc_msgSend(v15, "setUpdateBlock:", &stru_4CB80, v17, v18, v19, v20);
    objc_destroyWeak(&v22);
  }

  else
  {
    unsigned int v15 = 0LL;
  }

  return v15;
}

void sub_7AC4(_Unwind_Exception *a1)
{
}

GCTVSettingsProfileController *sub_7ADC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v3 = -[GCTVSettingsProfileController initWithProfileRepresentedObj:prefsStoreObj:]( objc_alloc(&OBJC_CLASS___GCTVSettingsProfileController),  "initWithProfileRepresentedObj:prefsStoreObj:",  *(void *)(a1 + 32),  WeakRetained[17]);
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void sub_7B3C(id a1, TSKSettingItem *a2, id a3)
{
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v3, "representedObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  -[TSKSettingItem setLocalizedTitle:](v3, "setLocalizedTitle:", v4);
}

id sub_7B94(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _nameViewControllerForItem:v3]);

  return v5;
}

void sub_7BE8(id a1, TSKSettingItem *a2, id a3)
{
}

id sub_7BF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 game]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedName]);

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 game]);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCSGame defaultIdentifier](&OBJC_CLASS___GCSGame, "defaultIdentifier"));
    unsigned int v14 = [v12 isEqualToString:v13];

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained availableProfileValuesAndIncludeNil:v14 ^ 1]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v10,  0LL,  v6,  @"profile",  v15));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_7E08;
    v21[3] = &unk_4CB40;
    objc_copyWeak(&v23, v7);
    id v22 = v6;
    [v16 setChildControllerBlock:v21];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_7E68;
    v18[3] = &unk_4CC18;
    objc_copyWeak(&v19, v7);
    char v20 = v14;
    [v16 setUpdateBlock:v18];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v23);
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

void sub_7DE4(_Unwind_Exception *a1)
{
}

GCTVSettingsProfileSelectionController *sub_7E08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v3 = -[GCTVSettingsProfileSelectionController initWithGame:controller:]( objc_alloc(&OBJC_CLASS___GCTVSettingsProfileSelectionController),  "initWithGame:controller:",  *(void *)(a1 + 32),  WeakRetained[16]);
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void sub_7E68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained availableProfileValuesAndIncludeNil:*(_BYTE *)(a1 + 40) == 0]);
  [v5 setAvailableValues:v8];

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___GCSProfile);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v30 = a1;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v10 = objc_loadWeakRetained((id *)(a1 + 32));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObj]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 prefsStore]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 profiles]);

  id v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v14)
  {
LABEL_10:

    a1 = v30;
LABEL_13:
    id v24 = sub_EA9C(@"PROFILE_UNSET");
    id v22 = (id)objc_claimAutoreleasedReturnValue(v24);
    [v5 setLocalizedValue:v22];
    goto LABEL_14;
  }

  id v15 = v14;
  uint64_t v16 = *(void *)v32;
LABEL_4:
  uint64_t v17 = 0LL;
  while (1)
  {
    if (*(void *)v32 != v16) {
      objc_enumerationMutation(v13);
    }
    uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    char v20 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
    unsigned __int8 v21 = [v19 isEqual:v20];

    if ((v21 & 1) != 0) {
      break;
    }
    if (v15 == (id)++v17)
    {
      id v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  id v22 = v18;

  a1 = v30;
  if (!v22) {
    goto LABEL_13;
  }
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
  [v5 setLocalizedValue:v23];

LABEL_14:
  if (*(_BYTE *)(a1 + 40))
  {
    id v25 = sub_EA9C(@"TV_CHOOSE_PROFILE_DEFAULT");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    [v5 setLocalizedDescription:v26];
  }

  else
  {
    id v27 = sub_EAFC((uint64_t)@"%@", @"TV_CHOOSE_PROFILE_APP");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedTitle]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v28));
    [v5 setLocalizedDescription:v29];
  }
}

void sub_8138(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObj]);

  if (v3 != v5)
  {
    if ([*(id *)(a1 + 32) hasPoorBehavior])
    {
      uint64_t v6 = TSKWiFiLocString(@"BluetoothDevicePoorBehaviorDescriptionFormat_WIFI");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
      [v10 setLocalizedDescription:v9];
    }

    else
    {
      [v10 setLocalizedDescription:0];
    }

    [v10 setHidden:*(void *)(a1 + 32) == 0];
  }
}

id sub_8234(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = sub_EA9C(@"COPILOT_TITLE");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) availableCopilotControllers]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v7,  0LL,  v4,  @"copilot",  v8));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gameBuddyFormatter]);
    [v9 setLocalizedValueFormatter:v10];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_8350;
    v12[3] = &unk_4CAC8;
    v12[4] = *(void *)(a1 + 32);
    [v9 setUpdateBlock:v12];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

void sub_8350(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___GCTVSettingsCopilotFusedControllerWrapper);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gameBuddyFormatter]);
    [v14 setLocalizedValueFormatter:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
    if ([v7 controllerIsCopilot])
    {
      [v14 setEnabled:0];
      id v8 = sub_EAFC((uint64_t)@"%@", @"COPILOT_DETAIL_DESC_DISABLED");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 copilot]);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v11));

      [v14 setLocalizedDescription:v12];
    }

    else
    {
      id v13 = sub_EA9C(@"COPILOT_DETAIL_DESC");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v14 setLocalizedDescription:v9];
    }
  }
}

void sub_84A0(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(v5, "setHidden:", objc_msgSend(WeakRetained, "shouldShowCopilotOptions") ^ 1);
  }
}

void sub_8C9C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GCController controllers](&OBJC_CLASS___GCController, "controllers"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 filteredArrayUsingPredicate:*(void *)(*(void *)(a1 + 32) + 72)]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 firstObject]);

  uint64_t v4 = (void *)v6;
  id v5 = *(void **)(a1 + 32);
  if (v6 != v5[15])
  {
    [v5 setDevice:v6];
    [*(id *)(a1 + 32) reloadSettings];
    uint64_t v4 = (void *)v6;
  }
}

void sub_8D94(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GCController controllers](&OBJC_CLASS___GCController, "controllers"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 filteredArrayUsingPredicate:*(void *)(*(void *)(a1 + 32) + 72)]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v4 = *(id *)(*(void *)(a1 + 32) + 120LL);
  if (v5 != v4)
  {
    [v4 removeHapticEngines];
    [*(id *)(a1 + 32) setDevice:v5];
    [*(id *)(a1 + 32) reloadSettings];
  }
}

void sub_907C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _bluetoothDevice]);
  [v2 disconnectDevice:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v4 = [v5 popViewControllerAnimated:1];
}

void sub_92D4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v2 unpairDevice:*(void *)(a1 + 32)];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controller]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentIdentifier]);

  if (v4)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "prefsStore", 0));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 copilotFusedControllers]);

    id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pilotIdentifier]);
        unsigned __int8 v13 = [v12 isEqualToString:v4];

        if ((v13 & 1) != 0) {
          break;
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 copilotIdentifier]);
        unsigned __int8 v15 = [v14 isEqualToString:v4];

        if ((v15 & 1) != 0) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }

      id v16 = v11;

      if (!v16) {
        goto LABEL_15;
      }
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) prefsStore]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 fusedControllerIdentifier]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 controllerFor:v18]);

      char v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) prefsStore]);
      [v20 removeController:v19 saveToDisk:1];

      uint64_t v6 = v16;
    }

LABEL_14:
  }

  swift_bridgeObjectRelease(v4);
  return 0LL;
}

void sub_97F0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

int64_t sub_9B10(id a1, GCSElement *a2, GCSElement *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCSElement remappingKey](a2, "remappingKey");
  int v5 = -[GCSElement remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

int64_t sub_9B64(id a1, GCSElement *a2, GCSElement *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCSElement remappingKey](a2, "remappingKey");
  int v5 = -[GCSElement remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

int64_t sub_9E04(id a1, GCSElement *a2, GCSElement *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCSElement remappingKey](a2, "remappingKey");
  int v5 = -[GCSElement remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

int64_t sub_9E58(id a1, GCSElement *a2, GCSElement *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCSElement remappingKey](a2, "remappingKey");
  int v5 = -[GCSElement remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

void sub_A050( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_A078(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained restoreToDefaults];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 customizatonController]);
    [v2 reloadSettings];

    id WeakRetained = v3;
  }
}

void sub_A26C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_A294(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 14) = 1;
    id v5 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 navigationController]);
    id v4 = [v3 popViewControllerAnimated:1];

    id WeakRetained = v5;
  }
}

void sub_A450(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 elementKey]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v14 mappingKey]);
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v13 = *(void **)(a1 + 32);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v14 elementKey]);
    [v13 setObject:v14 forKeyedSubscript:v10];
LABEL_8:

    uint64_t v9 = v14;
    goto LABEL_9;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___GCSDirectionPadMapping);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v7);
  uint64_t v9 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    id v10 = v14;
    if (([v10 invertHorizontally] & 1) != 0
      || ([v10 invertVertically] & 1) != 0
      || [v10 swapAxes])
    {
      __int128 v11 = *(void **)(a1 + 32);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 elementKey]);
      [v11 setObject:v10 forKeyedSubscript:v12];
    }

    goto LABEL_8;
  }

LABEL_9:
}

  if (v4)
  {
    id v16 = swift_bridgeObjectRetain(v7);
    sub_2A4FC(v16, (uint64_t)j_nullsub_1, 0LL);
    swift_bridgeObjectRelease(v7);
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  [v1 setGames:isa];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v1) + 16])();
}

  if (v4)
  {
    id v16 = swift_bridgeObjectRetain(v7);
    sub_29F50(v16, (uint64_t)j_nullsub_1_1, 0LL);
    swift_bridgeObjectRelease(v7);
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  [v1 setProfiles:isa];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v1) + 16])();
}

  if (v4)
  {
    unsigned __int8 v13 = swift_bridgeObjectRetain(v7);
    sub_29F6C(v13);
    swift_bridgeObjectRelease(v7);
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  [v1 setMouseProfiles:isa];
}

  if (v4)
  {
    id v16 = swift_bridgeObjectRetain(v7);
    sub_29F34(v16, (uint64_t)j_nullsub_1_7, 0LL);
    swift_bridgeObjectRelease(v7);
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  [v1 setAllControllers:isa];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v1) + 16])();
}

LABEL_12:
    unsigned __int8 v13 = objc_loadWeakRetained((id *)p_customizatonController);
    id v14 = (id)objc_claimAutoreleasedReturnValue([v13 prefsStore]);
    [v14 removeProfile:v7 saveToDisk:1];
  }

  else
  {
    id v27 = 0uLL;
    v28 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    unsigned __int8 v15 = objc_loadWeakRetained((id *)&self->_customizatonController);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prefsStore", 0));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profiles]);

    uint64_t v7 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v7)
    {
      uint64_t v18 = *(void *)v26;
      while (2)
      {
        for (j = 0LL; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v17);
          }
          char v20 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
          unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uuid]);
          id v22 = [v21 isEqual:self->_uuid];

          if (v22)
          {
            uint64_t v7 = v20;
            goto LABEL_23;
          }
        }

        uint64_t v7 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

      id v8 = v19;
    }

    remappedElement = self->_remappedElement;
    self->_remappedElement = v11;

    -[GCTVSettingsElementCustomizationControllerRepresentedObject didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"elements");
  }
}

LABEL_23:
    unsigned __int8 v13 = (id)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileControllerRepresentedObject profileFromCurrentConfiguration]( self,  "profileFromCurrentConfiguration"));
    id v14 = objc_loadWeakRetained((id *)p_customizatonController);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 prefsStore]);
    __int128 v24 = v23;
    if (v7) {
      [v23 updateProfileFrom:v7 to:v13 saveToDisk:1];
    }
    else {
      [v23 addProfile:v13 saveToDisk:1];
    }
  }
}

    id v16 = (v25 - 1) & v25;
    id v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_24:
    id v27 = *(void *)(v7 + 72);
    v28 = *(void *)(v10 + 48) + v27 * v22;
    if ((v45 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v28, v6);
      id v29 = *(id *)(*(void *)(v10 + 56) + 8 * v22);
    }

    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v28, v6);
      id v29 = *(id *)(*(void *)(v10 + 56) + 8 * v22);
    }

    uint64_t v30 = *(void *)(v12 + 40);
    __int128 v31 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v30, v6, v31);
    __int128 v32 = -1LL << *(_BYTE *)(v12 + 32);
    __int128 v33 = result & ~v32;
    __int128 v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v17 + 8 * (v33 >> 6))) != 0)
    {
      char v20 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v17 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        unsigned __int8 v37 = v34 == v36;
        if (v34 == v36) {
          __int128 v34 = 0LL;
        }
        v35 |= v37;
        v38 = *(void *)(v17 + 8 * v34);
      }

      while (v38 == -1);
      char v20 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v20;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))( *(void *)(v12 + 48) + v27 * v20,  v9,  v6);
    *(void *)(*(void *)(v12 + 56) + 8 * v20) = v29;
    ++*(void *)(v12 + 16);
  }

  swift_release(v10);
  id v3 = v41;
  __int128 v24 = v43;
  if ((v45 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  id v39 = 1LL << *(_BYTE *)(v10 + 32);
  if (v39 >= 64) {
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v24 = -1LL << v39;
  }
  *(void *)(v10 + 16) = 0LL;
LABEL_43:
  result = swift_release(v10);
  void *v3 = v12;
  return result;
}

    id v14 = (v23 - 1) & v23;
    unsigned __int8 v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    __int128 v25 = *(void *)(v8 + 56);
    __int128 v26 = v8;
    id v27 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    id v29 = *v27;
    v28 = v27[1];
    uint64_t v30 = *(void *)(v6 + 72);
    __int128 v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }

    Hasher.init(_seed:)(v47, *(void *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    result = Hasher._finalize()();
    __int128 v32 = -1LL << *(_BYTE *)(v10 + 32);
    __int128 v33 = result & ~v32;
    __int128 v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      uint64_t v18 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        unsigned __int8 v37 = v34 == v36;
        if (v34 == v36) {
          __int128 v34 = 0LL;
        }
        v35 |= v37;
        v38 = *(void *)(v15 + 8 * v34);
      }

      while (v38 == -1);
      uint64_t v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    id v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v28;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v10 + 56) + v30 * v18,  v45,  v46);
    ++*(void *)(v10 + 16);
    id v8 = v26;
  }

  __int128 v24 = v22 + 2;
  if (v24 < v42)
  {
    __int128 v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        uint64_t v17 = v24 + 1;
        if (__OFADD__(v24, 1LL)) {
          goto LABEL_43;
        }
        if (v17 >= v42) {
          goto LABEL_36;
        }
        __int128 v23 = v43[v17];
        ++v24;
        if (v23) {
          goto LABEL_23;
        }
      }
    }

    uint64_t v17 = v24;
    goto LABEL_23;
  }

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
    swift_arrayInitWithCopy(a1);
    return a3;
  }

    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }

  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
    swift_arrayInitWithCopy(a1);
    return a3;
  }

  swift_bridgeObjectRelease(a1);
  return 0LL;
}

    id v8 = (v13 - 1) & v13;
    __int128 v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    unsigned __int8 v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    id v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v17);
    id v19 = v18;
    char v20 = sub_19588(v16, v17);
    id v22 = v21;
    swift_bridgeObjectRelease(v17);
    if ((v22 & 1) == 0)
    {

      return;
    }

    sub_3860C(0LL, &qword_56760, &classRef_GCSElementMapping);
    __int128 v23 = *(id *)(*(void *)(a2 + 56) + 8 * v20);
    __int128 v24 = static NSObject.== infix(_:_:)(v23, v19);

    if ((v24 & 1) == 0) {
      return;
    }
  }

  id v14 = v12 + 4;
  if (v14 >= v9) {
    return;
  }
  unsigned __int8 v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    id v4 = v14;
    goto LABEL_23;
  }

  while (1)
  {
    id v4 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unsigned __int8 v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }

void sub_BBC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11)
{
}

id sub_BCEC(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _nameViewControllerForItem:v3]);

  return v5;
}

void sub_BD40(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
  objc_msgSend(v3, "setCanFocus:", objc_msgSend(v4, "customizable"));
}

void sub_BDA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_EA9C(@"HAPTICS_DESC");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setLocalizedDescription:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v6, "customizable"));
}

void sub_BE2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_EA9C(@"LIGHTBAR_COLOR_DESC");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setLocalizedDescription:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v6, "customizable"));
}

void sub_BEB8(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  else {
    id v5 = @"VIDEO_RECORDING_PROFILE_DESC_FALSE";
  }
  id v6 = sub_EA9C(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v10 setLocalizedDescription:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "customizable"));
}

id sub_BF58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nameLocalizationKey]);
  uint64_t v8 = _GCFConvertStringToLocalizedString(@"%@", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_C16C;
  v25[3] = &unk_4CB40;
  id v10 = (id *)(a1 + 32);
  objc_copyWeak(&v27, (id *)(a1 + 32));
  id v11 = v6;
  id v26 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  v11,  0LL,  v25));

  char v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_C258;
  __int128 v23 = &unk_4CB18;
  objc_copyWeak(&v24, v10);
  [v12 setUpdateBlock:&v20];
  id v13 = sub_EAFC((uint64_t)@"%@", @"CUSTOMIZE_BUTTON_DESC");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 nameLocalizationKey]);
  uint64_t v16 = _GCFConvertStringToLocalizedString(@"%@", v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v14,  v17,  v20,  v21,  v22,  v23));

  [v12 setLocalizedDescription:v18];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  return v12;
}

void sub_C140(_Unwind_Exception *a1)
{
}

GCTVSettingsElementCustomizationController *sub_C16C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(&OBJC_CLASS___GCTVSettingsElementCustomizationController);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[5] elementMappings]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[5] configurableControllerButtons]);
    uint64_t v8 = -[GCTVSettingsElementCustomizationController initWithMapping:elements:controller:prefsStoreObj:]( v3,  "initWithMapping:elements:controller:prefsStoreObj:",  v6,  v7,  WeakRetained[2],  WeakRetained[3]);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_C258(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "customizable"));
}

id sub_C2B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nameLocalizationKey]);
  uint64_t v8 = _GCFConvertStringToLocalizedString(@"%@", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_C4CC;
  v25[3] = &unk_4CB40;
  id v10 = (id *)(a1 + 32);
  objc_copyWeak(&v27, (id *)(a1 + 32));
  id v11 = v6;
  id v26 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  v11,  0LL,  v25));

  char v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_C5B8;
  __int128 v23 = &unk_4CB18;
  objc_copyWeak(&v24, v10);
  [v12 setUpdateBlock:&v20];
  id v13 = sub_EAFC((uint64_t)@"%@", @"CUSTOMIZE_ELEMENT_DESC");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 nameLocalizationKey]);
  uint64_t v16 = _GCFConvertStringToLocalizedString(@"%@", v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v14,  v17,  v20,  v21,  v22,  v23));

  [v12 setLocalizedDescription:v18];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  return v12;
}

void sub_C4A0(_Unwind_Exception *a1)
{
}

GCTVSettingsElementCustomizationController *sub_C4CC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(&OBJC_CLASS___GCTVSettingsElementCustomizationController);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[5] elementMappings]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[5] configurableControllerDpads]);
    uint64_t v8 = -[GCTVSettingsElementCustomizationController initWithMapping:elements:controller:prefsStoreObj:]( v3,  "initWithMapping:elements:controller:prefsStoreObj:",  v6,  v7,  WeakRetained[2],  WeakRetained[3]);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_C5B8(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "customizable"));
}

LABEL_21:
  return (id)v4;
}

    __int128 v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    id v24 = *v23;
    __int128 v25 = (-1LL << v3) - 1;
  }

  else
  {
    __int128 v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    __int128 v25 = *v23;
    id v24 = (-1LL << result) - 1;
  }

  void *v23 = v25 & v24;
  id v26 = *(void *)(a2 + 16);
  id v27 = __OFSUB__(v26, 1LL);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

void sub_D358(id a1)
{
  uint64_t v1 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 6LL);
  v13[0] = GCInputLeftShoulder;
  v13[1] = GCInputRightShoulder;
  v14[0] = @"Top";
  v14[1] = @"Top";
  v13[2] = GCInputLeftTrigger;
  v13[3] = GCInputRightTrigger;
  v14[2] = @"Top";
  v14[3] = @"Top";
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", v2, &off_4FDA8);

  v11[0] = GCInputLeftShoulder;
  v11[1] = GCInputRightShoulder;
  v12[0] = @"Top";
  v12[1] = @"Top";
  v11[2] = GCInputLeftTrigger;
  v11[3] = GCInputRightTrigger;
  v12[2] = @"Top";
  v12[3] = @"Top";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", v3, &off_4FDC0);

  v9[0] = GCInputLeftShoulder;
  v9[1] = GCInputRightShoulder;
  v10[0] = @"Top";
  v10[1] = @"Top";
  v9[2] = GCInputLeftTrigger;
  v9[3] = GCInputRightTrigger;
  v10[2] = @"Top";
  v10[3] = @"Top";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", v4, &off_4FDD8);

  v7[0] = GCInputLeftShoulder;
  v7[1] = GCInputRightShoulder;
  v8[0] = @"Top";
  v8[1] = @"Top";
  v7[2] = GCInputLeftTrigger;
  v7[3] = GCInputRightTrigger;
  v8[2] = @"Top";
  v8[3] = @"Top";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", v5, &off_4FDF0);

  id v6 = (void *)qword_568D8;
  qword_568D8 = (uint64_t)v1;
}

id sub_DAF0(void *a1)
{
  return [*(id *)(a1[4] + 32) setImage:a1[6]];
}

void sub_E514(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  id v2 = (void *)qword_568E0;
  qword_568E0 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
  id v4 = (void *)qword_568E8;
  qword_568E8 = v3;
}

id sub_EA28()
{
  if (qword_568F8 != -1) {
    dispatch_once(&qword_568F8, &stru_4CEB0);
  }
  return (id)qword_56900;
}

void sub_EA68(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.gametech.GameController.GameControllerTVSettings"));
  id v2 = (void *)qword_56900;
  qword_56900 = v1;
}

id sub_EA9C(void *a1)
{
  id v1 = a1;
  id v2 = sub_EA28();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v1 value:&stru_4E2F8 table:@"Localizable"]);

  return v4;
}

id sub_EAFC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_EA28();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v2 value:&stru_4E2F8 table:@"Localizable"]);

  return v5;
}

id sub_EFE4(uint64_t a1)
{
  id GCSettingsLogger = getGCSettingsLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "End find controller: %@", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 32) setFindingController:0];
}

void sub_F5AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_F5C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained filterSupportedApps];
}

void sub_FDC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id a32)
{
}

void sub_FE84(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "state") != 0);
}

void sub_FECC(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([*(id *)(a1 + 32) isConnected])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 detailedProductCategory]);
    id v6 = [v5 isEqual:@"Xbox Series X"];
  }

  else
  {
    id v6 = &dword_0 + 1;
  }

  [v7 setHidden:v6];
}

GCTVSettingsCustomizationController *sub_FF68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsCustomizationController);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    -[GCTVSettingsCustomizationController setDevice:](v2, "setDevice:", v3);

    id v4 = sub_EA9C(@"CUSTOMIZATION_TITLE");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[GCTVSettingsCustomizationController setTitle:](v2, "setTitle:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
    -[GCTVSettingsCustomizationController setSettings:](v2, "setSettings:", v6);
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

void sub_1001C(id *a1, void *a2)
{
  id v10 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
  [v10 setHidden:v4 == 0];

  id v5 = objc_loadWeakRetained(a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
  else {
    id v7 = @"SettingsOFF";
  }
  uint64_t v8 = TSKLocString(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v10 setLocalizedValue:v9];
}

void sub_100E0(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
    [v10 setHidden:v6 == 0];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObj]);
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v7, "findingController") ^ 1);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObj]);
    else {
      uint64_t v9 = 0LL;
    }
    [v10 setAccessoryTypes:v9];
  }
}

id sub_101B0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  from = a1;
  id v7 = a1 + 4;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  if (WeakRetained)
  {
    uint64_t v56 = 0LL;
    __int128 v57 = &v56;
    uint64_t v58 = 0x3032000000LL;
    __int128 v59 = sub_10674;
    __int128 v60 = sub_10684;
    id v61 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

    if (v9)
    {
      id v10 = a1 + 5;
      id v11 = objc_loadWeakRetained(a1 + 5);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 settingsForBundleID]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 objectForKey:v13]);
      unsigned __int8 v15 = (void *)v57[5];
      v57[5] = v14;

      if (!v57[5])
      {
        id v16 = objc_loadWeakRetained(v10);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 settingsForBundleID]);
        id v18 = [v17 mutableCopy];

        id v19 = objc_alloc(&OBJC_CLASS___GCControllerSettings);
        char v20 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
        id v22 = -[GCControllerSettings initWithBundleIdentifier:forController:]( v19,  "initWithBundleIdentifier:forController:",  v20,  v21);
        __int128 v23 = (void *)v57[5];
        v57[5] = (uint64_t)v22;

        uint64_t v24 = v57[5];
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
        [v18 setObject:v24 forKeyedSubscript:v25];

        id v26 = objc_loadWeakRetained(v10);
        [v26 setSettingsForBundleID:v18];
      }
    }

    id v46 = WeakRetained;
    id v47 = v5;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedName]);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1068C;
    v52[3] = &unk_4CF00;
    objc_copyWeak(&v55, v7);
    id v28 = v6;
    id v53 = v28;
    __int128 v54 = &v56;
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v27,  0LL,  v28,  0LL,  v52));

    id v30 = sub_EAFC((uint64_t)@"%@", @"CUSTOMIZATION_APP_DESC");
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedName]);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v31, v32));

    [v29 setLocalizedDescription:v33];
    id v34 = objc_loadWeakRetained(v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 device]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
    unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
    unsigned int v38 = +[GCControllerSettings settingsCustomizedForController:forBundleIdentifier:]( &OBJC_CLASS___GCControllerSettings,  "settingsCustomizedForController:forBundleIdentifier:",  v36,  v37);

    if (v38)
    {
      froma = from + 5;
      id v39 = objc_loadWeakRetained(froma);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 settingsForBundleID]);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v41]);
      else {
        uint64_t v43 = TSKLocString(@"SettingsOFF");
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      [v29 setLocalizedValue:v44];

      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_107A8;
      v50[3] = &unk_4CB18;
      objc_copyWeak(&v51, froma);
      [v29 setUpdateBlock:v50];
      objc_destroyWeak(&v51);
    }

    objc_destroyWeak(&v55);
    _Block_object_dispose(&v56, 8);

    id WeakRetained = v46;
    id v5 = v47;
  }

  else
  {
    id v29 = 0LL;
  }

  return v29;
}

void sub_10624( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_10674(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10684(uint64_t a1)
{
}

GCTVSettingsCustomizationController *sub_1068C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsCustomizationController);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizedName]);
    -[GCTVSettingsCustomizationController setApplicationName:](v3, "setApplicationName:", v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    -[GCTVSettingsCustomizationController setDevice:](v3, "setDevice:", v5);

    -[GCTVSettingsCustomizationController setSettings:]( v3,  "setSettings:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    id v6 = sub_EAFC((uint64_t)@"%@", @"CUSTOMIZATION");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizedName]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

    -[GCTVSettingsCustomizationController setTitle:](v3, "setTitle:", v9);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_107A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v3 representedObject]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settingsForBundleID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  else {
    uint64_t v8 = @"SettingsOFF";
  }
  uint64_t v9 = TSKLocString(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v3 setLocalizedValue:v10];
}

void sub_1087C(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObj]);

  if (v3 != v5)
  {
    if ([*(id *)(a1 + 32) hasPoorBehavior])
    {
      uint64_t v6 = TSKWiFiLocString(@"BluetoothDevicePoorBehaviorDescriptionFormat_WIFI");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
      [v10 setLocalizedDescription:v9];
    }

    else
    {
      [v10 setLocalizedDescription:0];
    }

    [v10 setHidden:*(void *)(a1 + 32) == 0];
  }
}

void sub_10F50(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _bluetoothDevice]);
  [v2 disconnectDevice:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v4 = [v5 popViewControllerAnimated:1];
}

void sub_111A8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance"));
  [v2 unpairDevice:*(void *)(a1 + 32)];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) navigationController]);
  id v3 = [v4 popViewControllerAnimated:1];
}

int64_t sub_11694(id a1, LSApplicationRecord *a2, LSApplicationRecord *a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](a2, "localizedName"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](v4, "localizedName"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_11758(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GCController controllers](&OBJC_CLASS___GCController, "controllers"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 filteredArrayUsingPredicate:*(void *)(*(void *)(a1 + 32) + 40)]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v4 = (void *)v6;
  id v5 = *(void **)(a1 + 32);
  if (v6 != v5[11])
  {
    [v5 setDevice:v6];
    [*(id *)(a1 + 32) reloadSettings];
    id v4 = (void *)v6;
  }
}

void sub_11850(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GCController controllers](&OBJC_CLASS___GCController, "controllers"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 filteredArrayUsingPredicate:*(void *)(*(void *)(a1 + 32) + 40)]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v4 = *(id *)(*(void *)(a1 + 32) + 88LL);
  if (v5 != v4)
  {
    [v4 removeHapticEngines];
    [*(id *)(a1 + 32) setDevice:v5];
    [*(id *)(a1 + 32) reloadSettings];
  }
}

void sub_11A84( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_13:
    [v11 settingItem:v14 didUpdateMetadataWithGroup:v12];
    [v14 setDirty:0];
    goto LABEL_14;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_3AAE4((uint64_t)v6);
  }
LABEL_14:

  return v11;
}

    [v11 settingItem:v14 didUpdateMetadataWithGroup:v12];
    [v14 setDirty:0];
    goto LABEL_14;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_3AB74((uint64_t)v6);
  }
LABEL_14:

  return v11;
}

    result = sub_1C58C(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

  if (a1 < 0) {
    id v19 = a1;
  }
  else {
    id v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  id v11 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(a1);
  if (!v11) {
    return 0LL;
  }
LABEL_3:
  uint64_t v12 = 0LL;
  v21[1] = v3;
  id v22 = a1 & 0xC000000000000001LL;
  id v13 = a1;
  while (1)
  {
    uint64_t v14 = v22 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, a1) : *(id *)(a1 + 8 * v12 + 32);
    unsigned __int8 v15 = v14;
    id v16 = [v14 uuid];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v17 = [v24 uuid];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    id v3 = static UUID.== infix(_:_:)(v10, v8);
    a1 = *(void *)(v23 + 8);
    ((void (*)(char *, uint64_t))a1)(v8, v5);
    ((void (*)(char *, uint64_t))a1)(v10, v5);

    if ((v3 & 1) != 0) {
      return v12;
    }
    id v18 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_13;
    }

    ++v12;
    a1 = v13;
    if (v18 == v11) {
      return 0LL;
    }
  }

int64_t sub_11F40(id a1, GCControllerElement *a2, GCControllerElement *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCControllerElement remappingKey](a2, "remappingKey");
  int v5 = -[GCControllerElement remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

LABEL_6:
  -[GCTVSettingsElementCustomizationController_Legacy updateMappableControllerElements]( self,  "updateMappableControllerElements");
  -[GCTVSettingsElementCustomizationController_Legacy reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

  v69 = v52;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
  id v53 = 0LL;
LABEL_7:
  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v28));

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_17070;
  v58[3] = &unk_4CFF8;
  objc_copyWeak(&v59, &location);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v29,  @"configurableControllerButtons",  v58));

  [v30 setAutoHide:1];
  [v30 setComparesArrayDeeply:0];
  -[NSMutableArray addObject:](self->_buttonsGroups, "addObject:", v30);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_1736C;
  v56[3] = &unk_4CFF8;
  objc_copyWeak(&v57, &location);
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v31,  @"configurableControllerDpads",  v56));

  [v32 setAutoHide:1];
  [v32 setComparesArrayDeeply:0];
  -[NSMutableArray addObject:](self->_buttonsGroups, "addObject:", v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_17668;
  v54[3] = &unk_4CFF8;
  objc_copyWeak(&v55, &location);
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v33,  @"configurableControllerSystemButtons",  v54));

  [v34 setAutoHide:1];
  [v34 setComparesArrayDeeply:0];
  -[NSMutableArray addObject:](self->_buttonsGroups, "addObject:", v34);
  v35 = sub_EAFC((uint64_t)@"%@", @"RESTORE_APP_DEFAULTS_DESC");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController applicationName](self, "applicationName"));
  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v36, v37));

  if (-[GCTVSettingsCustomizationController isCustomizingDefaultSettings](self, "isCustomizingDefaultSettings"))
  {
    unsigned int v38 = sub_EA9C(@"RESTORE_DEFAULTS_DESC");
    id v39 = (id)objc_claimAutoreleasedReturnValue(v38);
  }

  else
  {
    id v39 = v49;
  }

  uint64_t v40 = v39;
  uint64_t v41 = sub_EA9C(@"RESTORE_DEFAULTS_TITLE");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCustomizationController representedObject](self, "representedObject"));
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v42,  v40,  0LL,  0LL,  v43,  "promptEraseAllSettings"));

  v68 = v44;
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));
  id v46 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v45));

  v67[0] = self->_customizationToggleGroup;
  v67[1] = v50;
  v67[2] = v30;
  v67[3] = v32;
  v67[4] = v34;
  v67[5] = v46;
  id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 6LL));

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&v63);

  objc_destroyWeak(&v65);
  objc_destroyWeak(&location);
  return v47;
}

void sub_12454( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_124A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 unmappedLocalizedName]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  v6,  0LL,  v10,  "selectMappedElement:"));

    id v12 = objc_loadWeakRetained(v7);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 element]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 unmappedLocalizedName]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 unmappedLocalizedName]);
    unsigned int v16 = [v14 isEqual:v15];

    id v25 = v5;
    if (v16)
    {
      [v11 setLocalizedDescription:0];
    }

    else
    {
      id v17 = sub_EAFC((uint64_t)@"%1$@ %2$@", @"CUSTOMIZE_BUTTON_TO_BUTTON_DESC");
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 unmappedLocalizedName]);
      id v20 = objc_loadWeakRetained(v7);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 element]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 unmappedLocalizedName]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v19, v22));

      [v11 setLocalizedDescription:v23];
    }

    objc_initWeak(&location, v11);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_12738;
    v26[3] = &unk_4CFD0;
    objc_copyWeak(&v28, &location);
    id v27 = v6;
    objc_copyWeak(&v29, v7);
    [v11 setUpdateBlock:v26];
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    id v5 = v25;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

void sub_12714( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_12738(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mappedElement]);
  [WeakRetained setAccessoryTypes:2 * (v2 == v4)];
}

void sub_12C6C(id a1)
{
  id v1 = (void *)qword_56910;
  qword_56910 = (uint64_t)&off_4FE08;
}

void sub_1387C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  id v2 = (void *)qword_56918;
  qword_56918 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
  id v4 = (void *)qword_56920;
  qword_56920 = v3;
}

void sub_14008(id a1)
{
  uint64_t v1 = (void *)qword_56938;
  qword_56938 = (uint64_t)&off_4FE30;
}

void sub_14A54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_14AA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v33 = v5;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 nameLocalizationKey]);
    uint64_t v10 = _GCFConvertStringToLocalizedString(@"%@", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained representedObject]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  v6,  0LL,  v12,  "selectMappedElement:"));

    id v14 = objc_loadWeakRetained(v7);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 baseElement]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    unsigned int v19 = [v17 isEqual:v18];

    if (v19)
    {
      [v13 setLocalizedDescription:0];
    }

    else
    {
      id v20 = sub_EAFC((uint64_t)@"%1$@ %2$@", @"CUSTOMIZE_BUTTON_TO_BUTTON_DESC");
      id v30 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v32 = objc_loadWeakRetained(v7);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v32 representedObject]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v31 baseElement]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 nameLocalizationKey]);
      uint64_t v23 = _GCFConvertStringToLocalizedString(@"%@", v22);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 nameLocalizationKey]);
      uint64_t v26 = _GCFConvertStringToLocalizedString(@"%@", v25);
      id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v30, v24, v27));

      [v13 setLocalizedDescription:v28];
    }

    objc_initWeak(&location, v13);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_14DBC;
    v34[3] = &unk_4CFD0;
    objc_copyWeak(&v36, &location);
    id v35 = v6;
    objc_copyWeak(&v37, v7);
    [v13 setUpdateBlock:v34];
    objc_destroyWeak(&v37);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    id v5 = v33;
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

void sub_14D98(_Unwind_Exception *a1)
{
}

void sub_14DBC(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] name]);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remappedElement]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  [WeakRetained setAccessoryTypes:2 * (v2 == v6)];
}

uint64_t gc_isInternalBuild()
{
  if (qword_56950 != -1) {
    dispatch_once(&qword_56950, &stru_4D078);
  }
  return byte_56948;
}

void sub_15538(id a1)
{
  CFBooleanRef v1 = (CFBooleanRef)MGCopyAnswer(@"InternalBuild", 0LL);
  byte_56948 = v1 == kCFBooleanTrue;
  CFRelease(v1);
}

id getGCLogger()
{
  if (qword_56960 != -1) {
    dispatch_once(&qword_56960, &stru_4D098);
  }
  return (id)qword_56958;
}

void sub_155B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  id v2 = (void *)qword_56958;
  qword_56958 = (uint64_t)v1;
}

id getGCSettingsLogger()
{
  if (qword_56968 != -1) {
    dispatch_once(&qword_56968, &stru_4D0B8);
  }
  return (id)qword_56940;
}

void sub_15624(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  id v2 = (void *)qword_56940;
  qword_56940 = (uint64_t)v1;
}

void sub_15BB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_15BDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained customizatonController]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 settings]);
  [v2 eraseAllSettings];
}

int64_t sub_162EC(id a1, GCControllerButtonInput *a2, GCControllerButtonInput *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCControllerButtonInput remappingKey](a2, "remappingKey");
  int v5 = -[GCControllerButtonInput remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

int64_t sub_16340(id a1, GCControllerDirectionPad *a2, GCControllerDirectionPad *a3)
{
  id v4 = a3;
  LODWORD(a2) = -[GCControllerDirectionPad remappingKey](a2, "remappingKey");
  int v5 = -[GCControllerDirectionPad remappingKey](v4, "remappingKey");

  else {
    return 1LL;
  }
}

void sub_16B88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, id *a16)
{
}

void sub_16C7C(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  else {
    id v6 = @"SettingsOFF";
  }
  uint64_t v7 = TSKLocString(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v19 setLocalizedValue:v8];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v10 = [WeakRetained isCustomizingDefaultSettings];

  unsigned int v11 = [v5 BOOLValue];
  if (v10)
  {
    if ((v11 & 1) != 0) {
      id v12 = @"ENABLED_DESC_TRUE";
    }
    else {
      id v12 = @"ENABLED_DESC_FALSE";
    }
    id v18 = sub_EA9C(v12);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v19 setLocalizedDescription:v15];
  }

  else
  {
    if (v11) {
      id v13 = @"ENABLED_APP_DESC_TRUE";
    }
    else {
      id v13 = @"ENABLED_APP_DESC_FALSE";
    }
    id v14 = sub_EAFC((uint64_t)@"%@", v13);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applicationName]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v16));

    [v19 setLocalizedDescription:v17];
  }
}

void sub_16DC8(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v7, "customizationsEnabled"));

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v9 = [v8 isCustomizingDefaultSettings];

  unsigned int v10 = [v5 BOOLValue];
  if (v9)
  {
    if ((v10 & 1) != 0) {
      unsigned int v11 = @"RUMBLE_DESC_TRUE";
    }
    else {
      unsigned int v11 = @"RUMBLE_DESC_FALSE";
    }
    id v17 = sub_EA9C(v11);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v18 setLocalizedDescription:v14];
  }

  else
  {
    if (v10) {
      id v12 = @"RUMBLE_APP_DESC_TRUE";
    }
    else {
      id v12 = @"RUMBLE_APP_DESC_FALSE";
    }
    id v13 = sub_EAFC((uint64_t)@"%@", v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applicationName]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15));

    [v18 setLocalizedDescription:v16];
  }
}

void sub_16F1C(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v7, "customizationsEnabled"));

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v9 = [v8 isCustomizingDefaultSettings];

  unsigned int v10 = [v5 BOOLValue];
  if (v9)
  {
    if ((v10 & 1) != 0) {
      unsigned int v11 = @"VIDEO_RECORDING_DESC_TRUE";
    }
    else {
      unsigned int v11 = @"VIDEO_RECORDING_DESC_FALSE";
    }
    id v17 = sub_EA9C(v11);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v18 setLocalizedDescription:v14];
  }

  else
  {
    if (v10) {
      id v12 = @"VIDEO_RECORDING_APP_DESC_TRUE";
    }
    else {
      id v12 = @"VIDEO_RECORDING_APP_DESC_FALSE";
    }
    id v13 = sub_EAFC((uint64_t)@"%@", v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) applicationName]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15));

    [v18 setLocalizedDescription:v16];
  }
}

id sub_17070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 unmappedLocalizedName]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1724C;
  v18[3] = &unk_4CB40;
  id v8 = (id *)(a1 + 32);
  objc_copyWeak(&v20, (id *)(a1 + 32));
  id v9 = v6;
  id v19 = v9;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v7,  0LL,  v9,  0LL,  v18));

  id v11 = sub_EAFC((uint64_t)@"%@", @"CUSTOMIZE_BUTTON_DESC");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 unmappedLocalizedName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  [v10 setLocalizedDescription:v14];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1730C;
  v16[3] = &unk_4CB18;
  objc_copyWeak(&v17, v8);
  [v10 setUpdateBlock:v16];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v20);
  return v10;
}

void sub_17220(_Unwind_Exception *a1)
{
}

GCTVSettingsElementCustomizationController_Legacy *sub_1724C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsElementCustomizationController_Legacy);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    -[GCTVSettingsElementCustomizationController_Legacy setDevice:](v3, "setDevice:", v4);

    -[GCTVSettingsElementCustomizationController_Legacy setElement:](v3, "setElement:", *(void *)(a1 + 32));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
    -[GCTVSettingsElementCustomizationController_Legacy setSettings:](v3, "setSettings:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unmappedLocalizedName]);
    -[GCTVSettingsElementCustomizationController_Legacy setTitle:](v3, "setTitle:", v6);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_1730C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "customizationsEnabled"));
}

id sub_1736C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 unmappedLocalizedName]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_17548;
  v18[3] = &unk_4CB40;
  id v8 = (id *)(a1 + 32);
  objc_copyWeak(&v20, (id *)(a1 + 32));
  id v9 = v6;
  id v19 = v9;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v7,  0LL,  v9,  0LL,  v18));

  id v11 = sub_EAFC((uint64_t)@"%@", @"CUSTOMIZE_ELEMENT_DESC");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 unmappedLocalizedName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  [v10 setLocalizedDescription:v14];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_17608;
  v16[3] = &unk_4CB18;
  objc_copyWeak(&v17, v8);
  [v10 setUpdateBlock:v16];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v20);
  return v10;
}

void sub_1751C(_Unwind_Exception *a1)
{
}

GCTVSettingsElementCustomizationController_Legacy *sub_17548(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsElementCustomizationController_Legacy);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    -[GCTVSettingsElementCustomizationController_Legacy setDevice:](v3, "setDevice:", v4);

    -[GCTVSettingsElementCustomizationController_Legacy setElement:](v3, "setElement:", *(void *)(a1 + 32));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
    -[GCTVSettingsElementCustomizationController_Legacy setSettings:](v3, "setSettings:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unmappedLocalizedName]);
    -[GCTVSettingsElementCustomizationController_Legacy setTitle:](v3, "setTitle:", v6);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_17608(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "customizationsEnabled"));
}

id sub_17668(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 unmappedLocalizedName]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_177D0;
  v14[3] = &unk_4CB40;
  id v8 = (id *)(a1 + 32);
  objc_copyWeak(&v16, (id *)(a1 + 32));
  id v9 = v6;
  id v15 = v9;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v7,  0LL,  v9,  0LL,  v14));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_17890;
  v12[3] = &unk_4CB18;
  objc_copyWeak(&v13, v8);
  [v10 setUpdateBlock:v12];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  return v10;
}

void sub_177AC(_Unwind_Exception *a1)
{
}

GCTVSettingsElementCustomizationController_Legacy *sub_177D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___GCTVSettingsElementCustomizationController_Legacy);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
    -[GCTVSettingsElementCustomizationController_Legacy setDevice:](v3, "setDevice:", v4);

    -[GCTVSettingsElementCustomizationController_Legacy setElement:](v3, "setElement:", *(void *)(a1 + 32));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
    -[GCTVSettingsElementCustomizationController_Legacy setSettings:](v3, "setSettings:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) unmappedLocalizedName]);
    -[GCTVSettingsElementCustomizationController_Legacy setTitle:](v3, "setTitle:", v6);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_17890(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained settings]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "customizationsEnabled"));
}

uint64_t sub_17C1C(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  id v9 = (char *)&v25 - v8;
  id v10 = [a1 bundleIdentifier];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  id v14 = [a2 bundleIdentifier];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  if (v11 == v15 && v13 == v17)
  {
    swift_bridgeObjectRelease_n(v13, 2LL);
  }

  else
  {
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v15, v17, 0LL);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v17);
    char v20 = 0;
    if ((v19 & 1) == 0) {
      return v20 & 1;
    }
  }

  id v21 = [a1 modifiedDate];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  id v22 = [a2 modifiedDate];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  char v20 = static Date.== infix(_:_:)(v9, v7);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v26 + 8);
  v23(v7, v4);
  v23(v9, v4);
  return v20 & 1;
}

uint64_t GCSGame.id.getter()
{
  id v1 = [v0 bundleIdentifier];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_17E34(void *a1, void *a2)
{
  uint64_t v5 = sub_18140(&qword_566C0);
  __chkstk_darwin(v5);
  uint64_t v7 = &v32[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v32[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  id v12 = [v2 controllerToProfileMappings];
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  id v14 = [a1 persistentIdentifier];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  uint64_t v17 = v16;

  if (*(void *)(v13 + 16) && (unint64_t v18 = sub_19588(v15, v17), (v19 & 1) != 0))
  {
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v9 + 16))( v7,  *(void *)(v13 + 56) + *(void *)(v9 + 72) * v18,  v8);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v20, 1LL, v8);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v13);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    uint64_t v21 = sub_196F0((uint64_t)v7, &qword_566C0);
    return (*(uint64_t (**)(uint64_t))&stru_1F8.segname[(swift_isaMask & *a2) + 8])(v21);
  }

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v11, v7, v8);
  id v23 = [a2 profiles];
  unint64_t v24 = sub_195EC();
  unint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

  __chkstk_darwin(v26);
  *(void *)&v32[-16] = v11;
  uint64_t v27 = (uint64_t)sub_18180(sub_1990C, &v32[-32], v25);
  uint64_t v28 = v27;
  if (!((unint64_t)v27 >> 62))
  {
    uint64_t result = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFF8LL));
    if (result) {
      goto LABEL_9;
    }
LABEL_16:
    uint64_t v31 = swift_bridgeObjectRelease(v28);
    uint64_t v22 = (*(uint64_t (**)(uint64_t))&stru_1F8.segname[(swift_isaMask & *a2) + 8])(v31);
    goto LABEL_17;
  }

  if (v27 >= 0) {
    v27 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v27);
  if (!result) {
    goto LABEL_16;
  }
LABEL_9:
  if ((v28 & 0xC000000000000001LL) != 0)
  {
    id v30 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v28);
    goto LABEL_12;
  }

  if (*(void *)((char *)&dword_10 + (v28 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v30 = *(id *)(v28 + 32);
LABEL_12:
    uint64_t v22 = (uint64_t)v30;
    swift_bridgeObjectRelease(v28);
LABEL_17:
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    return v22;
  }

  __break(1u);
  return result;
}

uint64_t sub_18140(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_18180(uint64_t (*a1)(id *), void *a2, unint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v26 = &_swiftEmptyArrayStorage;
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0LL;
      uint64_t v23 = v4 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v24 = v4 & 0xC000000000000001LL;
      uint64_t v22 = v4;
      while (v24)
      {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v4);
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1LL)) {
          goto LABEL_17;
        }
        id v25 = v9;
        id v12 = a2;
        char v13 = a1(&v25);
        if (v3)
        {
          swift_bridgeObjectRelease(v4);

          swift_release(v26);
          return v12;
        }

        if ((v13 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          uint64_t v14 = v7;
          uint64_t v15 = a1;
          uint64_t v16 = a2;
          uint64_t v17 = v26[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
          uint64_t v18 = v17;
          a2 = v16;
          a1 = v15;
          uint64_t v7 = v14;
          uint64_t v4 = v22;
          uint64_t v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v10);
          specialized ContiguousArray._endMutation()(v19);
        }

        else
        {
        }

        ++v8;
        if (v11 == v7)
        {
          id v12 = v26;
          goto LABEL_23;
        }
      }

      if (v8 < *(void *)(v23 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      if (v4 < 0) {
        uint64_t v20 = v4;
      }
      else {
        uint64_t v20 = v4 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v20);
      if (!v7) {
        goto LABEL_22;
      }
    }

    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }

LABEL_22:
  id v12 = &_swiftEmptyArrayStorage;
LABEL_23:
  swift_bridgeObjectRelease(v4);
  return v12;
}

  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  unint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  void *v24 = v8;
  v24[1] = a2;
  id v25 = *(void *)(v23 + 16);
  uint64_t v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

BOOL sub_18384(void *a1, void *a2)
{
  uint64_t v5 = sub_18140(&qword_566C0);
  __chkstk_darwin(v5);
  uint64_t v7 = &v32[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = &v32[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  id v12 = [v2 controllerToProfileMappings];
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  id v14 = [a1 persistentIdentifier];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  uint64_t v17 = v16;

  if (*(void *)(v13 + 16) && (unint64_t v18 = sub_19588(v15, v17), (v19 & 1) != 0))
  {
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v9 + 16))( v7,  *(void *)(v13 + 56) + *(void *)(v9 + 72) * v18,  v8);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v20, 1LL, v8);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v13);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    sub_196F0((uint64_t)v7, &qword_566C0);
    return 0LL;
  }

  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v11, v7, v8);
    id v22 = [a2 profiles];
    unint64_t v23 = sub_195EC();
    unint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);

    __chkstk_darwin(v25);
    *(void *)&v32[-16] = v11;
    uint64_t v26 = (uint64_t)sub_18180(sub_19628, &v32[-32], v24);
    for (uint64_t i = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFF8LL)); ; uint64_t i = _CocoaArrayWrapper.endIndex.getter(v29))
    {
      BOOL v21 = i != 0;
      if (!i) {
        break;
      }
      if ((v26 & 0xC000000000000001LL) != 0)
      {
        uint64_t v30 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v26);
        swift_unknownObjectRelease(v30);
        break;
      }

      uint64_t v28 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFF8LL));
      swift_bridgeObjectRelease(v26);
      if (v28) {
        goto LABEL_19;
      }
      __break(1u);
LABEL_13:
      if (v26 < 0) {
        uint64_t v29 = v26;
      }
      else {
        uint64_t v29 = v26 & 0xFFFFFFFFFFFFFF8LL;
      }
    }

    swift_bridgeObjectRelease(v26);
LABEL_19:
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  }

  return v21;
}

uint64_t sub_18644(id *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = [*a1 uuid];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a2) = static UUID.== infix(_:_:)(v7, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a2 & 1;
}

uint64_t sub_18840()
{
  id v1 = [v0 bundleIdentifier];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;

  id v5 = [(id)objc_opt_self(GCSGame) defaultIdentifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  if (v2 == v6 && v4 == v8)
  {
    swift_bridgeObjectRelease_n(v4, 2LL);
    char v11 = 0;
  }

  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v6, v8, 0LL);
    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v8);
    char v11 = v10 ^ 1;
  }

  return v11 & 1;
}

uint64_t sub_1891C()
{
  uint64_t v1 = sub_18140(&qword_56430);
  uint64_t v2 = swift_allocObject(v1, 48LL, 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_47940;
  *(void *)(v2 + 32) = [(id)swift_getObjCClassFromMetadata(v0) defaultGame];
  unint64_t v3 = sub_18AC0((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v4 = sub_18C58((uint64_t)_swiftEmptyArrayStorage);
  id v5 = objc_allocWithZone(&OBJC_CLASS___GCSGame);
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  type metadata accessor for UUID(0LL);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  type metadata accessor for GCSCompatibilityMode();
  Class v9 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  id v10 = [v5 initWithBundleIdentifier:v6 title:v7 controllerToProfileMappings:isa controllerToCompatibilityModeMappings:v9];

  *(void *)(v2 + 40) = v10;
  specialized Array._endMutation()();
  return v2;
}

unint64_t sub_18AC0(uint64_t a1)
{
  uint64_t v2 = sub_18140(&qword_56150);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }

  sub_18140((uint64_t *)&unk_566D0);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  id v10 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v28 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_197E4(v13, (uint64_t)v5);
    uint64_t v15 = *v5;
    uint64_t v16 = v5[1];
    unint64_t result = sub_19588(*v5, v16);
    if ((v18 & 1) != 0) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v20 = (uint64_t *)(v8[6] + 16 * result);
    uint64_t *v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    uint64_t v22 = type metadata accessor for UUID(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32LL))( v21 + *(void *)(*(void *)(v22 - 8) + 72LL) * v19,  v10,  v22);
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_12;
    }
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v26 = v28;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_18C58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_18140(&qword_56148);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v6 - 2);
    uint64_t v8 = (uint64_t)*(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_19588(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_18DC4()
{
  uint64_t v1 = v0;
  id v2 = [v0 bundleIdentifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  uint64_t v5 = v4;

  id v6 = [(id)objc_opt_self(GCSGame) defaultIdentifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v9 = v8;

  if (v3 == v7 && v5 == v9)
  {
    swift_bridgeObjectRelease_n(v5, 2LL);
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v7, v9, 0LL);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v9);
    if ((v11 & 1) == 0)
    {
      swift_beginAccess(&unk_56970, v30, 32LL, 0LL);
      id v12 = objc_getAssociatedObject(v1, &unk_56970);
      swift_endAccess(v30);
      if (v12)
      {
        _bridgeAnyObjectToAny(_:)(v30, v12);
        swift_unknownObjectRelease(v12);
      }

      else
      {
        memset(v30, 0, sizeof(v30));
      }

      sub_196A8((uint64_t)v30, (uint64_t)v31);
      if (v32)
      {
      }

      else
      {
        sub_196F0((uint64_t)v31, &qword_561F0);
      }

      id v15 = [v1 title];
      static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      uint64_t v17 = v16;

      id v18 = [v1 bundleIdentifier];
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      uint64_t v21 = v20;

      id v22 = objc_allocWithZone(&OBJC_CLASS___LSApplicationRecord);
      id v23 = sub_1911C(v19, v21, 0);
      uint64_t v24 = swift_bridgeObjectRelease(v17);
      uint64_t v25 = static Locale.preferredLanguages.getter(v24);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v25);
      id v27 = [v23 localizedNameWithPreferredLocalizations:isa];

      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      NSString v28 = String._bridgeToObjectiveC()();
      swift_beginAccess(&unk_56970, v31, 32LL, 0LL);
      objc_setAssociatedObject(v1, &unk_56970, v28, &stru_2E8.segname[9]);
      swift_endAccess(v31);

      return v13;
    }
  }

  return sub_199DC(0xD000000000000010LL, (void *)0x80000000000412F0LL);
}

void sub_190C8(uint64_t *a1@<X8>)
{
  id v3 = [*v1 bundleIdentifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

id sub_1911C(uint64_t a1, uint64_t a2, char a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v12 = 0LL;
  id v7 = [v3 initWithBundleIdentifier:v6 allowPlaceholder:a3 & 1 error:&v12];

  id v8 = v12;
  if (v7)
  {
    id v9 = v12;
  }

  else
  {
    id v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }

  return v7;
}

uint64_t sub_191F4(uint64_t a1, uint64_t a2)
{
  return sub_19414(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_19200(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_19274(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_192F0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_19330@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_19374@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1939C(uint64_t a1)
{
  uint64_t v2 = sub_197A4(&qword_56140, (uint64_t)&unk_47A94);
  uint64_t v3 = sub_197A4((unint64_t *)&unk_56750, (uint64_t)&unk_47A3C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_19408(uint64_t a1, uint64_t a2)
{
  return sub_19414(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_19414(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_19450(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_19490(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_19500(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

unint64_t sub_19588(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1982C(a1, a2, v5);
}

unint64_t sub_195EC()
{
  unint64_t result = qword_564F0;
  if (!qword_564F0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___GCSProfile);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_564F0);
  }

  return result;
}

uint64_t sub_19628(id *a1)
{
  return sub_18644(a1, *(void *)(v1 + 16)) & 1;
}

void type metadata accessor for GCSCompatibilityMode()
{
  if (!qword_56130)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_4D220);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_56130);
    }
  }

uint64_t sub_196A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18140(&qword_561F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_196F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_18140(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void *sub_1972C()
{
  return &protocol witness table for String;
}

uint64_t sub_19738()
{
  return sub_197A4((unint64_t *)&unk_56730, (uint64_t)&unk_47A04);
}

uint64_t sub_1975C()
{
  return sub_197A4(&qword_56138, (uint64_t)"}X");
}

uint64_t sub_19780()
{
  return sub_197A4((unint64_t *)&unk_56740, (uint64_t)&unk_47A6C);
}

uint64_t sub_197A4(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for GCSCompatibilityMode();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_197E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18140(&qword_56150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1982C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_1990C(id *a1)
{
  return sub_19628(a1) & 1;
}

id sub_19924()
{
  NSString v0 = String._bridgeToObjectiveC()();
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  id v2 = [v1 bundleWithIdentifier:v0];

  if (v2) {
    return v2;
  }
  else {
    return [v1 mainBundle];
  }
}

unint64_t sub_199C0()
{
  return 0xD00000000000003ALL;
}

uint64_t sub_199DC(uint64_t a1, void *a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  unint64_t v6 = (NSBundle *)[v5 bundleWithIdentifier:v4];

  if (!v6) {
    unint64_t v6 = (NSBundle *)[v5 mainBundle];
  }
  v12._object = a2;
  v7._uint64_t countAndFlagsBits = a1;
  v7._object = a2;
  v8.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v8.value._object = (void *)0xEB00000000656C62LL;
  v9._uint64_t countAndFlagsBits = a1;
  v9._object = a2;
  v12._uint64_t countAndFlagsBits = a1;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, v8, v6, v9, v12)._countAndFlagsBits;

  return countAndFlagsBits;
}

Swift::String __swiftcall String.localized(with:)(Swift::OpaquePointer with)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  NSString v6 = String._bridgeToObjectiveC()();
  Swift::String v7 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
  Swift::String_optional v8 = (NSBundle *)[v7 bundleWithIdentifier:v6];

  if (!v8) {
    Swift::String_optional v8 = (NSBundle *)[v7 mainBundle];
  }
  v19._object = v3;
  v9._uint64_t countAndFlagsBits = v4;
  v9._object = v3;
  v10.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v10.value._object = (void *)0xEB00000000656C62LL;
  v11._uint64_t countAndFlagsBits = v4;
  v11._object = v3;
  v19._uint64_t countAndFlagsBits = v4;
  Swift::String v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, v8, v11, v19);

  uint64_t v13 = static String.localizedStringWithFormat(_:_:)(v12._countAndFlagsBits, v12._object, with._rawValue);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease(v12._object);
  uint64_t v16 = v13;
  uint64_t v17 = v15;
  result._object = v17;
  result._uint64_t countAndFlagsBits = v16;
  return result;
}

char *sub_19BFC()
{
  uint64_t v1 = sub_18140(&qword_56158);
  __chkstk_darwin(v1);
  id v35 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v3 = [v0 persistentIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  Swift::String v6 = String.lowercased()();
  uint64_t countAndFlagsBits = v6._countAndFlagsBits;
  object = v6._object;
  swift_bridgeObjectRelease(v5);
  uint64_t v38 = type metadata accessor for Locale(0LL);
  Swift::String v9 = (char *)_swiftEmptyArrayStorage;
  id v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56LL);
  unint64_t v37 = 0x80000000000413A0LL;
  while (1)
  {
    uint64_t v43 = countAndFlagsBits;
    unint64_t v44 = (unint64_t)object;
    uint64_t v41 = 0xD000000000000027LL;
    unint64_t v42 = v37;
    uint64_t v10 = (uint64_t)v35;
    v36(v35, 1LL, 1LL, v38);
    unint64_t v11 = sub_19F50();
    swift_bridgeObjectRetain(object);
    uint64_t v12 = StringProtocol.range<A>(of:options:range:locale:)( &v41,  1024LL,  0LL,  0LL,  1LL,  v10,  &type metadata for String,  &type metadata for String,  v11,  v11);
    uint64_t v14 = v13;
    char v16 = v15;
    sub_19F94(v10);
    swift_bridgeObjectRelease(v42);
    swift_bridgeObjectRelease(v44);
    if ((v16 & 1) != 0) {
      break;
    }
    uint64_t v17 = String.subscript.getter(v12, v14, countAndFlagsBits, object);
    uint64_t v19 = v18;
    uint64_t v20 = static String._fromSubstring(_:)(v17);
    unint64_t v22 = v21;
    swift_bridgeObjectRelease(v19);
    uint64_t v43 = countAndFlagsBits;
    unint64_t v44 = (unint64_t)object;
    uint64_t v41 = v20;
    unint64_t v42 = v22;
    uint64_t v39 = 0LL;
    unint64_t v40 = 0xE000000000000000LL;
    uint64_t countAndFlagsBits = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v41,  &v39,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v11,  v11,  v11);
    uint64_t v24 = v23;
    swift_bridgeObjectRelease(object);
    uint64_t v43 = v20;
    unint64_t v44 = v22;
    uint64_t v41 = 45LL;
    unint64_t v42 = 0xE100000000000000LL;
    uint64_t v39 = 0LL;
    unint64_t v40 = 0xE000000000000000LL;
    uint64_t v25 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v41,  &v39,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v11,  v11,  v11);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease(v22);
    uint64_t v43 = v25;
    unint64_t v44 = v27;
    uint64_t v41 = 58LL;
    unint64_t v42 = 0xE100000000000000LL;
    uint64_t v39 = 0LL;
    unint64_t v40 = 0xE000000000000000LL;
    uint64_t v28 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v41,  &v39,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v11,  v11,  v11);
    uint64_t v30 = v29;
    swift_bridgeObjectRelease(v27);
    if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
      Swift::String v9 = sub_1A714(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
    }
    unint64_t v32 = *((void *)v9 + 2);
    unint64_t v31 = *((void *)v9 + 3);
    if (v32 >= v31 >> 1) {
      Swift::String v9 = sub_1A714((char *)(v31 > 1), v32 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v32 + 1;
    id v33 = &v9[16 * v32];
    *((void *)v33 + 4) = v28;
    *((void *)v33 + 5) = v30;
    object = v24;
  }

  swift_bridgeObjectRelease(object);
  if (!*((void *)v9 + 2))
  {
    swift_bridgeObjectRelease(v9);
    return 0LL;
  }

  return v9;
}

unint64_t sub_19F50()
{
  unint64_t result = qword_56160;
  if (!qword_56160)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_56160);
  }

  return result;
}

uint64_t sub_19F94(uint64_t a1)
{
  uint64_t v2 = sub_18140(&qword_56158);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

Class sub_19FE0(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();

  if (v5)
  {
    v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    v6.super.Class isa = 0LL;
  }

  return v6.super.isa;
}

char *sub_1A03C()
{
  uint64_t v1 = sub_18140(&qword_56158);
  __chkstk_darwin(v1);
  id v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [v0 persistentIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v6 = v5;

  Swift::String v7 = String.lowercased()();
  uint64_t countAndFlagsBits = v7._countAndFlagsBits;
  object = v7._object;
  swift_bridgeObjectRelease(v6);
  uint64_t v10 = type metadata accessor for Locale(0LL);
  unint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  uint64_t v33 = v10;
  unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  unint64_t v31 = 0x80000000000413D0LL;
  while (1)
  {
    uint64_t v37 = countAndFlagsBits;
    uint64_t v38 = object;
    unint64_t v35 = 0xD00000000000003ELL;
    unint64_t v36 = v31;
    v32(v3, 1LL, 1LL, v33);
    unint64_t v12 = sub_19F50();
    swift_bridgeObjectRetain(object);
    uint64_t v13 = StringProtocol.range<A>(of:options:range:locale:)( &v35,  1024LL,  0LL,  0LL,  1LL,  v3,  &type metadata for String,  &type metadata for String,  v12,  v12);
    uint64_t v15 = v14;
    char v17 = v16;
    sub_19F94((uint64_t)v3);
    swift_bridgeObjectRelease(v36);
    swift_bridgeObjectRelease(v38);
    if ((v17 & 1) != 0) {
      break;
    }
    uint64_t v18 = String.subscript.getter(v13, v15, countAndFlagsBits, object);
    uint64_t v20 = v19;
    uint64_t v21 = static String._fromSubstring(_:)(v18);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRetain(v23);
    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      unint64_t v11 = sub_1A714(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v25 = *((void *)v11 + 2);
    unint64_t v24 = *((void *)v11 + 3);
    if (v25 >= v24 >> 1) {
      unint64_t v11 = sub_1A714((char *)(v24 > 1), v25 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v25 + 1;
    unint64_t v26 = &v11[16 * v25];
    *((void *)v26 + 4) = v21;
    *((void *)v26 + 5) = v23;
    uint64_t v37 = countAndFlagsBits;
    uint64_t v38 = object;
    unint64_t v35 = v21;
    unint64_t v36 = v23;
    v34[0] = 0LL;
    v34[1] = 0xE000000000000000LL;
    uint64_t countAndFlagsBits = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v35,  v34,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v12,  v12,  v12);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(object);
    object = v28;
  }

  swift_bridgeObjectRelease(object);
  if (!*((void *)v11 + 2))
  {
    swift_bridgeObjectRelease(v11);
    return 0LL;
  }

  return v11;
}

id sub_1A328()
{
  return sub_1A38C(1952867692LL, 0xE400000000000000LL);
}

id sub_1A378()
{
  return sub_1A38C(0x7468676972LL, 0xE500000000000000LL);
}

id sub_1A38C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  id v6 = [v2 miscellaneous];
  if (!v6) {
    return 0LL;
  }
  Swift::String v7 = v6;
  uint64_t v8 = sub_18140(&qword_561C8);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v7,  &type metadata for String,  v8,  &protocol witness table for String);

  id v10 = [v5 productCategoryKey];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v13 = v12;

  if (v11 == 0xD000000000000021LL && v13 == 0x8000000000041410LL)
  {
    swift_bridgeObjectRelease(0x8000000000041410LL);
  }

  else
  {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, 0xD000000000000021LL, 0x8000000000041410LL, 0LL);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
LABEL_10:
      swift_bridgeObjectRelease(v9);
      return 0LL;
    }
  }

  if (!*(void *)(v9 + 16)) {
    goto LABEL_10;
  }
  unint64_t v15 = sub_19588(a1, a2);
  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v17 = *(void *)(*(void *)(v9 + 56) + 8 * v15);
  swift_unknownObjectRetain(v17);
  swift_bridgeObjectRelease(v9);
  uint64_t v23 = v17;
  swift_unknownObjectRetain(v17);
  uint64_t v18 = sub_18140(&qword_561D0);
  if ((swift_dynamicCast(&v22, &v23, v8, v18, 6LL) & 1) == 0)
  {
    swift_unknownObjectRelease(v17);
    return 0LL;
  }

  uint64_t v19 = v22;
  id v20 = sub_1A814(v22);
  swift_bridgeObjectRelease(v19);
  swift_unknownObjectRelease(v17);
  return v20;
}

uint64_t sub_1A620()
{
  id v1 = [v0 productCategoryKey];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000021LL && v4 == 0x8000000000041410LL)
  {
    swift_bridgeObjectRelease(0x8000000000041410LL);
    char v5 = 0;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, 0xD000000000000021LL, 0x8000000000041410LL, 0LL);
    swift_bridgeObjectRelease(v4);
    char v5 = v6 ^ 1;
  }

  return v5 & 1;
}

uint64_t sub_1A6D4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  unint64_t v4 = sub_1A9D0();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

char *sub_1A714(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_18140((uint64_t *)&unk_561E0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  char v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v14);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

id sub_1A814(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0LL;
  }
  unint64_t v2 = sub_19588(0x726F6C6F63LL, 0xE500000000000000LL);
  if ((v3 & 1) == 0) {
    return 0LL;
  }
  sub_1AA0C(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v22);
  sub_1AA48(v22, v23);
  sub_1AA0C((uint64_t)v23, (uint64_t)v22);
  uint64_t v4 = sub_18140(&qword_561D8);
  uint64_t v5 = v21;
  if (!*(void *)(v21 + 16)
    || (unint64_t v6 = sub_19588(6579570LL, 0xE300000000000000LL), (v7 & 1) == 0)
    || !*(void *)(v5 + 16)
    || (uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6),
        unint64_t v9 = sub_19588(0x6E65657267LL, 0xE500000000000000LL),
        (v10 & 1) == 0))
  {
    sub_1AA58(v23);
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (!*(void *)(v5 + 16)
    || (uint64_t v11 = *(void *)(*(void *)(v5 + 56) + 8 * v9),
        unint64_t v12 = sub_19588(1702194274LL, 0xE400000000000000LL),
        (v13 & 1) == 0))
  {
    swift_bridgeObjectRelease(v5);
LABEL_13:
    sub_1AA58(v23);
    return 0LL;
  }

  uint64_t v14 = *(void *)(*(void *)(v5 + 56) + 8 * v12);
  swift_bridgeObjectRelease(v5);
  id v15 = objc_allocWithZone(&OBJC_CLASS___GCColor);
  *(float *)&double v16 = (float)v8 / 255.0;
  *(float *)&double v17 = (float)v11 / 255.0;
  *(float *)&double v18 = (float)v14 / 255.0;
  id v19 = [v15 initWithRed:v16 green:v17 blue:v18];
  sub_1AA58(v23);
  return v19;
}

void *sub_1A9C4()
{
  return &protocol witness table for ObjectIdentifier;
}

unint64_t sub_1A9D0()
{
  unint64_t result = qword_564D0;
  if (!qword_564D0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___GCSController);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_564D0);
  }

  return result;
}

uint64_t sub_1AA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1AA48(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1AA58(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1AA7C()
{
  id v1 = objc_getAssociatedObject(v0, &unk_56D80);
  swift_endAccess(v5);
  if (v1)
  {
    _bridgeAnyObjectToAny(_:)(v4, v1);
    swift_unknownObjectRelease(v1);
  }

  else
  {
    memset(v4, 0, sizeof(v4));
  }

  sub_196A8((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
  }

  else
  {
    sub_1C2C8((uint64_t)v5, &qword_561F0);
  }

  return 0LL;
}

void sub_1AB54()
{
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  swift_beginAccess(&unk_56D80, v2, 32LL, 0LL);
  objc_setAssociatedObject(v0, &unk_56D80, isa, 0LL);
  swift_endAccess(v2);
}

void sub_1ABC0(void (*a1)(void), uint64_t a2)
{
  unsigned __int8 v3 = v2;
  uint64_t v94 = a2;
  v95 = a1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v93 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  v91 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v88 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v88 - v10;
  uint64_t v12 = sub_18140(&qword_56258);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for URL(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  v92 = (char *)&v88 - v20;
  id v21 = [v3 haptics];
  if (v21
    && (uint64_t v22 = v21,
        id v23 = [v21 createEngineWithLocality:GCHapticsLocalityDefault],
        v22,
        v23))
  {
    uint64_t v89 = v4;
    v103 = sub_1B59C;
    v104 = 0LL;
    aBlock = _NSConcreteStackBlock;
    uint64_t v100 = 1107296256LL;
    v101 = sub_1B6CC;
    v102 = &unk_4D328;
    unint64_t v24 = _Block_copy(&aBlock);
    [v23 setStoppedHandler:v24];
    _Block_release(v24);
    unint64_t v25 = (void *)swift_allocObject(&unk_4D360, 40LL, 7LL);
    uint64_t v27 = v94;
    unint64_t v26 = v95;
    v25[2] = v23;
    v25[3] = v26;
    void v25[4] = v27;
    v103 = sub_1C2BC;
    v104 = v25;
    aBlock = _NSConcreteStackBlock;
    uint64_t v100 = 1107296256LL;
    v101 = sub_1BA68;
    v102 = &unk_4D378;
    uint64_t v28 = _Block_copy(&aBlock);
    uint64_t v29 = v104;
    swift_retain(v27);
    id v30 = v23;
    swift_release(v29);
    id v90 = v30;
    [v30 setResetHandler:v28];
    _Block_release(v28);
    NSString v31 = String._bridgeToObjectiveC()();
    unint64_t v32 = (void *)objc_opt_self(&OBJC_CLASS___NSBundle);
    id v33 = [v32 bundleWithIdentifier:v31];

    if (!v33) {
      id v33 = [v32 mainBundle];
    }
    NSString v34 = String._bridgeToObjectiveC()();
    NSString v35 = String._bridgeToObjectiveC()();
    id v36 = [v33 URLForResource:v34 withExtension:v35];

    if (v36)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v36);

      uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
      v37(v14, v19, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0LL, 1LL, v15);
      int v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1LL, v15);
      uint64_t v39 = v89;
      if (v38 != 1)
      {
        unint64_t v40 = v92;
        v37(v92, v14, v15);
        aBlock = 0LL;
        id v41 = v90;
        unsigned int v42 = [v90 startAndReturnError:&aBlock];
        uint64_t v43 = aBlock;
        if (v42)
        {
          unint64_t v44 = aBlock;
          Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
          swift_beginAccess(&unk_56D80, &aBlock, 32LL, 0LL);
          objc_setAssociatedObject(v3, &unk_56D80, isa, 0LL);
          swift_endAccess(&aBlock);

          id v46 = (void *)swift_allocObject(&unk_4D3B0, 40LL, 7LL);
          uint64_t v48 = v94;
          id v47 = v95;
          v46[2] = v3;
          v46[3] = v47;
          v46[4] = v48;
          v103 = sub_1C974;
          v104 = v46;
          aBlock = _NSConcreteStackBlock;
          uint64_t v100 = 1107296256LL;
          v101 = sub_1BC00;
          v102 = &unk_4D3C8;
          __int128 v49 = _Block_copy(&aBlock);
          __int128 v50 = v104;
          swift_retain(v48);
          id v51 = v3;
          swift_release(v50);
          [v41 notifyWhenPlayersFinished:v49];
          _Block_release(v49);
          URL._bridgeToObjectiveC()(v52);
          __int128 v54 = v53;
          aBlock = 0LL;
          unsigned int v55 = [v41 playPatternFromURL:v53 error:&aBlock];

          uint64_t v43 = aBlock;
          uint64_t v56 = v93;
          if (v55)
          {
            __int128 v57 = aBlock;

LABEL_22:
            (*(void (**)(char *, uint64_t))(v16 + 8))(v40, v15);
            return;
          }
        }

        else
        {
          uint64_t v56 = v93;
        }

        v75 = v43;
        uint64_t v76 = _convertNSErrorToError(_:)(v43);

        swift_willThrow();
        v95(1LL);
        uint64_t v77 = sub_1CBE4();
        v78 = v91;
        (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v91, v77, v39);
        swift_errorRetain(v76);
        uint64_t v79 = swift_errorRetain(v76);
        v80 = (os_log_s *)Logger.logObject.getter(v79);
        uint64_t v81 = v39;
        os_log_type_t v82 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v80, v82))
        {
          uint64_t v83 = swift_slowAlloc(22LL, -1LL);
          v84 = (void **)swift_slowAlloc(64LL, -1LL);
          aBlock = v84;
          *(_DWORD *)uint64_t v83 = 136315394;
          uint64_t v98 = sub_1C304(0x6564492F50414841LL, 0xED0000796669746ELL, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &aBlock, v83 + 4);
          *(_WORD *)(v83 + 12) = 2080;
          swift_getErrorValue(v76, v97, v96);
          uint64_t v85 = Error.localizedDescription.getter(v96[1], v96[2]);
          unint64_t v87 = v86;
          uint64_t v98 = sub_1C304(v85, v86, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &aBlock, v83 + 14);
          swift_bridgeObjectRelease(v87);
          swift_errorRelease(v76);
          swift_errorRelease(v76);
          _os_log_impl(&dword_0, v80, v82, "An error occured playing %s: %s.", (uint8_t *)v83, 0x16u);
          swift_arrayDestroy(v84, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v84, -1LL, -1LL);
          swift_slowDealloc(v83, -1LL, -1LL);

          swift_errorRelease(v76);
          (*(void (**)(char *, uint64_t))(v93 + 8))(v91, v89);
          (*(void (**)(char *, uint64_t))(v16 + 8))(v92, v15);
          return;
        }

        swift_errorRelease(v76);
        swift_errorRelease(v76);
        swift_errorRelease(v76);

        (*(void (**)(char *, uint64_t))(v56 + 8))(v78, v81);
        goto LABEL_22;
      }
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1LL, 1LL, v15);
      uint64_t v39 = v89;
    }

    sub_1C2C8((uint64_t)v14, &qword_56258);
    uint64_t v66 = sub_1CBE4();
    uint64_t v67 = v93;
    uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v93 + 16))(v11, v66, v39);
    v69 = (os_log_s *)Logger.logObject.getter(v68);
    os_log_type_t v70 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v72 = v39;
      v73 = (void **)swift_slowAlloc(32LL, -1LL);
      aBlock = v73;
      *(_DWORD *)v71 = 136315138;
      uint64_t v98 = sub_1C304(0x6564492F50414841LL, 0xED0000796669746ELL, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &aBlock, v71 + 4);
      _os_log_impl(&dword_0, v69, v70, "Unable to find haptics file named '%s'.", v71, 0xCu);
      swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1LL, -1LL);
      swift_slowDealloc(v71, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v67 + 8))(v11, v72);
    }

    else
    {

      (*(void (**)(char *, uint64_t))(v67 + 8))(v11, v39);
    }

    id v74 = v90;
    v95(1LL);
  }

  else
  {
    uint64_t v58 = sub_1CBE4();
    uint64_t v59 = v93;
    uint64_t v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v93 + 16))(v9, v58, v4);
    id v61 = (os_log_s *)Logger.logObject.getter(v60);
    os_log_type_t v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = v4;
      v64 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_0, v61, v62, "Failed to create engine.", v64, 2u);
      v65 = v64;
      uint64_t v4 = v63;
      swift_slowDealloc(v65, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v59 + 8))(v9, v4);
    v95(1LL);
  }

uint64_t sub_1B59C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1CBE4();
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v10 = 134217984;
    uint64_t v13 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10 + 4);
    _os_log_impl(&dword_0, v8, v9, "The engine stopped because %ld", v10, 0xCu);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1B6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_1B708(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v31 = a3;
  unint64_t v32 = a2;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = sub_1CBE4();
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v13 = v12(v10, v11, v4);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "The engine reset --> Restarting now!", v16, 2u);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v10, v4);
  id v36 = 0LL;
  id v30 = v36;
  id v19 = v36;
  uint64_t v20 = _convertNSErrorToError(_:)(v30);

  swift_willThrow();
  v32(1LL);
  v12(v8, v11, v4);
  swift_errorRetain(v20);
  uint64_t v21 = swift_errorRetain(v20);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v25 = (void *)swift_slowAlloc(32LL, -1LL);
    id v36 = v25;
    *(_DWORD *)unint64_t v24 = 136315138;
    unint64_t v32 = (void (*)(uint64_t))(v24 + 4);
    swift_getErrorValue(v20, v35, v34);
    uint64_t v26 = Error.localizedDescription.getter(v34[1], v34[2]);
    unint64_t v28 = v27;
    uint64_t v33 = sub_1C304(v26, v27, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v32);
    swift_bridgeObjectRelease(v28);
    swift_errorRelease(v20);
    swift_errorRelease(v20);
    _os_log_impl(&dword_0, v22, v23, "Failed to restart the engine: %s", v24, 0xCu);
    swift_arrayDestroy(v25, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

    swift_errorRelease(v20);
  }

  else
  {
    swift_errorRelease(v20);
    swift_errorRelease(v20);
    swift_errorRelease(v20);
  }

  return (id)((uint64_t (*)(char *, uint64_t))v17)(v8, v4);
}

uint64_t sub_1BA68(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_1BA94(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v8 = sub_1CBE4();
  uint64_t v9 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "Done!", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  swift_beginAccess(&unk_56D80, v16, 32LL, 0LL);
  objc_setAssociatedObject(a1, &unk_56D80, isa, 0LL);
  swift_endAccess(v16);

  return a2(1LL);
}

uint64_t sub_1BC00(uint64_t a1, void *a2)
{
  uint64_t v4 = *(uint64_t (**)(void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  uint64_t v6 = v4(a2);
  swift_release(v3);

  return v6;
}

char *sub_1BC54(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  id v5 = v4;
  uint64_t v56 = a1;
  __int128 v57 = a3;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v54 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v53 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v52 = v10;
  __chkstk_darwin(v10);
  __int128 v50 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DispatchTimeInterval(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  os_log_type_t v15 = (uint64_t *)((char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v49 = type metadata accessor for DispatchTime(0LL);
  uint64_t v16 = *(void *)(v49 - 8);
  uint64_t v17 = __chkstk_darwin(v49);
  id v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v46 - v20;
  unint64_t result = (char *)[v5 playerIndex];
  uint64_t v23 = (uint64_t)(result + 1);
  if (__OFADD__(result, 1LL))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v55 = a4;
  uint64_t v48 = v8;
  BOOL v24 = -v23 < 0;
  uint64_t v25 = -v23 & 3;
  uint64_t v26 = v23 & 3;
  if (v24) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = -v25;
  }
  unint64_t result = (char *)[v5 setPlayerIndex:v27];
  if (__OFSUB__(a2, 1LL)) {
    goto LABEL_11;
  }
  if (a2 == 1)
  {
    [v5 setPlayerIndex:v56];
    Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
    swift_beginAccess(&unk_56D80, aBlock, 32LL, 0LL);
    objc_setAssociatedObject(v5, &unk_56D80, isa, 0LL);
    swift_endAccess(aBlock);

    return (char *)v57(1LL);
  }

  else
  {
    sub_1C998();
    uint64_t v47 = static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    *os_log_type_t v15 = 200LL;
    (*(void (**)(void *, void, uint64_t))(v13 + 104))( v15,  enum case for DispatchTimeInterval.milliseconds(_:),  v12);
    DispatchTime.advanced(by:)(v15);
    (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
    unint64_t v28 = *(void (**)(char *, uint64_t))(v16 + 8);
    uint64_t v29 = v49;
    v28(v19, v49);
    id v30 = (void *)swift_allocObject(&unk_4D400, 56LL, 7LL);
    uint64_t v32 = v55;
    uint64_t v31 = v56;
    _OWORD v30[2] = v5;
    v30[3] = v31;
    uint64_t v33 = v57;
    v30[4] = a2 - 1;
    v30[5] = v33;
    v30[6] = v32;
    aBlock[4] = sub_1CA00;
    uint64_t v59 = v30;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1BA68;
    aBlock[3] = &unk_4D418;
    NSString v34 = _Block_copy(aBlock);
    NSString v35 = v59;
    id v36 = v5;
    swift_retain(v32);
    uint64_t v37 = swift_release(v35);
    int v38 = v50;
    static DispatchQoS.unspecified.getter(v37);
    aBlock[0] = _swiftEmptyArrayStorage;
    unint64_t v39 = sub_1CA2C();
    uint64_t v40 = sub_18140((uint64_t *)&unk_56520);
    unint64_t v41 = sub_1CA74();
    unsigned int v42 = v53;
    uint64_t v43 = v48;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v40, v41, v48, v39);
    unint64_t v44 = (void *)v47;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v21, v38, v42, v34);
    _Block_release(v34);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v52);
    return (char *)((uint64_t (*)(char *, uint64_t))v28)(v21, v29);
  }

BOOL sub_1C014()
{
  id v1 = [v0 _componentWithProtocol:&OBJC_PROTOCOL___GCControllerSettingsComponent];
  swift_unknownObjectRelease();
  return v1 != 0LL;
}

id sub_1C05C()
{
  id result = [v0 _componentWithProtocol:&OBJC_PROTOCOL___GCControllerProductInfo];
  if (result)
  {
    id v2 = result;
    uint64_t v3 = &OBJC_PROTOCOL___GCControllerProductInfo;
    id result = (id)swift_dynamicCastObjCProtocolConditional(result, 1LL, &v3);
    if (!result)
    {
      swift_unknownObjectRelease(v2);
      return 0LL;
    }
  }

  return result;
}

void sub_1C0C8(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  if ((sub_1AA7C() & 1) == 0)
  {
    id v5 = [v2 haptics];
    if (v5)
    {

      sub_1ABC0((void (*)(void))a1, a2);
    }

    else
    {
      Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
      swift_beginAccess(&unk_56D80, v7, 32LL, 0LL);
      objc_setAssociatedObject(v2, &unk_56D80, isa, 0LL);
      swift_endAccess(v7);

      sub_1BC54((uint64_t)[v2 playerIndex], 9, a1, a2);
    }
  }

uint64_t sub_1C1B0()
{
  id v1 = [v0 haptics];

  if (v1) {
    return 1LL;
  }
  id v3 = [v0 productCategory];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v6 = v5;

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(GCProductCategoryMFi);
  if (v4 == v7 && v6 == v8)
  {
    swift_bridgeObjectRelease_n(v6, 2LL);
    return [v0 isAttachedToDevice] ^ 1;
  }

  uint64_t v10 = v8;
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0LL);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  uint64_t result = 0LL;
  if ((v11 & 1) != 0) {
    return [v0 isAttachedToDevice] ^ 1;
  }
  return result;
}

uint64_t sub_1C2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1C2B0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_1C2BC()
{
  return sub_1B708(*(void **)(v0 + 16), *(void (**)(uint64_t))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1C2C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_18140(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_1C304(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C3D4(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1AA0C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1AA0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1AA58(v12);
  return v7;
}

uint64_t sub_1C3D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

        if (v5 == v4) {
          return _swiftEmptyArrayStorage;
        }
      }

      if (v5 < *(void *)(v7 + 16)) {
        break;
      }
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      if (v3 < 0) {
        uint64_t v33 = v3;
      }
      else {
        uint64_t v33 = v3 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v33);
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }

    uint64_t v10 = *(id *)(v8 + 8 * v5);
    goto LABEL_9;
  }

  return _swiftEmptyArrayStorage;
}

        uint64_t v2 = v23;
        ++v4;
        if (v7 == v3) {
          return _swiftEmptyArrayStorage;
        }
      }

      if (v4 < *(void *)(v24 + 16)) {
        break;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      if (v2 < 0) {
        uint64_t v22 = v2;
      }
      else {
        uint64_t v22 = v2 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v22);
      if (!v3) {
        return _swiftEmptyArrayStorage;
      }
    }

    uint64_t v5 = *(id *)(v2 + 8 * v4 + 32);
    goto LABEL_9;
  }

  return _swiftEmptyArrayStorage;
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1LL << result) - 1;
  }

  uint64_t *v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1LL);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_1C58C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1C620(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_1C7F8(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C7F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1C620(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_1C794(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1C794(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_18140((uint64_t *)&unk_56260);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size_0(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1C7F8(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_18140((uint64_t *)&unk_56260);
    char v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size_0(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    char v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t v27 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  unint64_t v28 = _CocoaArrayWrapper.endIndex.getter(v27);
  uint64_t result = swift_release(_swiftEmptyArrayStorage);
  if (!v28) {
    goto LABEL_31;
  }
LABEL_26:
  if (_swiftEmptyArrayStorage[2])
  {
    uint64_t v25 = (id)_swiftEmptyArrayStorage[4];
    goto LABEL_29;
  }

  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

    if (v22 >= v171) {
      goto LABEL_65;
    }
    if (__OFSUB__(v22, v21)) {
      goto LABEL_155;
    }
    if (v22 - v21 >= v168) {
      goto LABEL_65;
    }
    if (__OFADD__(v21, v168)) {
      goto LABEL_157;
    }
    uint64_t v43 = v171;
    if (v21 + v168 < v171) {
      uint64_t v43 = v21 + v168;
    }
    if (v43 < v21) {
      break;
    }
    if (v22 == v43) {
      goto LABEL_65;
    }
    v163 = v17;
    v164 = v3;
    unint64_t v44 = v167 + 8 * v22;
    uint64_t v45 = (uint64_t)v176;
    v169 = v43;
    while (2)
    {
      uint64_t v47 = v44;
      uint64_t v48 = *(void **)(v19 + 8 * v22);
      uint64_t v49 = v21;
      v172 = v47;
      __int128 v50 = v47;
      v177 = v22;
      while (1)
      {
        uint64_t v51 = *(void **)v50;
        uint64_t v52 = v48;
        v183 = v51;
        id v53 = [v52 uuid];
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v54 = [v182 profileUsageStats];
        uint64_t v55 = type metadata accessor for GCSProfileUsageStats();
        uint64_t v56 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        __int128 v57 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v54, v6, v55, v56);

        uint64_t v58 = *(void *)(v57 + 16);
        v181 = (void **)v52;
        if (v58 && (uint64_t v59 = sub_2DD78(v45), (v60 & 1) != 0))
        {
          id v61 = v45;
          os_log_type_t v62 = v6;
          uint64_t v63 = *(id *)(*(void *)(v57 + 56) + 8 * v59);
          swift_bridgeObjectRelease(v57);
          v64 = *(uint64_t (**)(uint64_t, uint64_t))(v175 + 8);
          v65 = v64(v61, v62);
          LODWORD(v180) = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v63)))(v65);
        }

        else
        {
          swift_bridgeObjectRelease(v57);
          v64 = *(uint64_t (**)(uint64_t, uint64_t))(v175 + 8);
          v64(v45, v6);
          LODWORD(v180) = 0;
          os_log_type_t v62 = v6;
        }

        uint64_t v66 = objc_msgSend(v183, "uuid", v163, v164);
        uint64_t v67 = (uint64_t)v174;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v68 = [v182 profileUsageStats];
        v69 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v68, v62, v55, v56);

        if (!*(void *)(v69 + 16))
        {
          swift_bridgeObjectRelease(v69);
          v64(v67, v62);
          unint64_t v6 = v62;
          goto LABEL_54;
        }

        os_log_type_t v70 = sub_2DD78(v67);
        if ((v71 & 1) != 0) {
          break;
        }
        swift_bridgeObjectRelease(v69);
        unint64_t v6 = v179;
        v64(v67, v179);
LABEL_54:
        uint64_t v45 = (uint64_t)v176;
        v75 = v181;
        if ((v180 & 1) != 0)
        {
LABEL_55:

          goto LABEL_60;
        }

uint64_t sub_1C948()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1C974()
{
  return 1LL;
}

unint64_t sub_1C998()
{
  unint64_t result = qword_56510;
  if (!qword_56510)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_56510);
  }

  return result;
}

uint64_t sub_1C9D4()
{
  swift_release(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1CA00()
{
  return sub_1BC54(v0[3], v0[4], v0[5], v0[6]);
}

unint64_t sub_1CA2C()
{
  unint64_t result = qword_56270;
  if (!qword_56270)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_56270);
  }

  return result;
}

unint64_t sub_1CA74()
{
  unint64_t result = qword_56280;
  if (!qword_56280)
  {
    uint64_t v1 = sub_1CAC0((uint64_t *)&unk_56520);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_56280);
  }

  return result;
}

uint64_t sub_1CAC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void type metadata accessor for GCControllerPlayerIndex()
{
  if (!qword_56288)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_4D450);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_56288);
    }
  }

uint64_t sub_1CB70()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1CCB4(v0, qword_57A50);
  sub_1CC2C(v0, (uint64_t)qword_57A50);
  return Logger.init(subsystem:category:)( 0xD000000000000021LL,  0x8000000000041780LL,  0x746C7561666564LL,  0xE700000000000000LL);
}

uint64_t sub_1CBE4()
{
  if (qword_56D88 != -1) {
    swift_once(&qword_56D88, sub_1CB70);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_1CC2C(v0, (uint64_t)qword_57A50);
}

uint64_t sub_1CC2C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1CC44@<X0>(uint64_t a1@<X8>)
{
  if (qword_56D88 != -1) {
    swift_once(&qword_56D88, sub_1CB70);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_1CC2C(v2, (uint64_t)qword_57A50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t *sub_1CCB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t *sub_1CCF4()
{
  return &qword_563B0;
}

uint64_t *sub_1CD00()
{
  return &qword_563C0;
}

uint64_t sub_1CD60()
{
  v1._object = (void *)0x8000000000041850LL;
  v1._uint64_t countAndFlagsBits = 0xD000000000000027LL;
  String.append(_:)(v1);
  (*(void (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))();
  v2._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._uint64_t countAndFlagsBits = 0x6F4373656D616720LL;
  v4._object = (void *)0xEC0000003D746E75LL;
  String.append(_:)(v4);
  (*(void (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v0)))();
  v5._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  unint64_t v6 = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v6);
  v7._uint64_t countAndFlagsBits = 62LL;
  v7._object = (void *)0xE100000000000000LL;
  String.append(_:)(v7);
  return 0LL;
}

void *sub_1CEA0()
{
  return &_swiftEmptySetSingleton;
}

uint64_t sub_1CEB8()
{
  return sub_1CFB0(&OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_controllerIdentifiers);
}

uint64_t sub_1CED0(uint64_t a1)
{
  return sub_1D084(a1, &OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_controllerIdentifiers);
}

uint64_t (*sub_1CEDC(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

void *sub_1CF20()
{
  return &_swiftEmptySetSingleton;
}

Class sub_1CF38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (uint64_t *)(a1 + *a3);
  swift_beginAccess(v3, v7, 0LL, 0LL);
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain(v4);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

uint64_t sub_1CFA4()
{
  return sub_1CFB0(&OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_gameIdentifiers);
}

uint64_t sub_1CFB0(void *a1)
{
  Swift::String v2 = (void *)(v1 + *a1);
  swift_beginAccess(v2, v4, 0LL, 0LL);
  return swift_bridgeObjectRetain(*v2);
}

uint64_t sub_1D000(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &protocol witness table for String);
  Swift::String v7 = (uint64_t *)(a1 + *a4);
  swift_beginAccess(v7, v10, 1LL, 0LL);
  uint64_t v8 = *v7;
  uint64_t *v7 = v6;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_1D078(uint64_t a1)
{
  return sub_1D084(a1, &OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_gameIdentifiers);
}

uint64_t sub_1D084(uint64_t a1, void *a2)
{
  uint64_t v4 = (uint64_t *)(v2 + *a2);
  swift_beginAccess(v4, v7, 1LL, 0LL);
  uint64_t v5 = *v4;
  uint64_t *v4 = a1;
  return swift_bridgeObjectRelease(v5);
}

uint64_t (*sub_1D0D0(uint64_t a1))(void)
{
  return j__swift_endAccess;
}

uint64_t sub_1D174()
{
  uint64_t v1 = (*(uint64_t (**)(void))((char *)&stru_20.nsects + (swift_isaMask & *v0)))();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease(v1);
  return v2;
}

uint64_t sub_1D210()
{
  uint64_t v1 = (*(uint64_t (**)(void))&stru_68.segname[swift_isaMask & *v0])();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease(v1);
  return v2;
}

BOOL sub_1D2CC()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))() > 0
      || (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v0)))() > 0;
}

id sub_1D32C()
{
  *(void *)&v0[OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_controllerIdentifiers] = &_swiftEmptySetSingleton;
  *(void *)&v0[OBJC_IVAR____TtC24GameControllerTVSettings20GCSProfileUsageStats_gameIdentifiers] = &_swiftEmptySetSingleton;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GCSProfileUsageStats();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for GCSProfileUsageStats()
{
  return objc_opt_self(&OBJC_CLASS____TtC24GameControllerTVSettings20GCSProfileUsageStats);
}

id sub_1D3F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GCSProfileUsageStats();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1D460()
{
  return 0x31322E312E3031LL;
}

id sub_1D478()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2) {
    return v2;
  }
  else {
    return [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  }
}

uint64_t sub_1D514(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_563E0);
}

uint64_t sub_1D5BC()
{
  return sub_1EB14((uint64_t)&unk_47C50, (uint64_t)&off_47C78);
}

const char *sub_1D5D0()
{
  return "connectedControllerIdentifiers";
}

uint64_t sub_1D658(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&unk_47C50, (uint64_t)&off_47C78);
}

void sub_1D66C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 connectedControllerIdentifiers];
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for String);

  *a2 = v4;
}

void sub_1D6C4(uint64_t a1, void **a2)
{
  id v2 = *a2;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v2 setConnectedControllerIdentifiers:isa];
}

void *sub_1D714()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_1D720()
{
  return sub_1F850( OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__connectedControllerIdentifiers,  &qword_563E8);
}

uint64_t sub_1D734(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_563F0,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__connectedControllerIdentifiers,  &qword_563E8);
}

void (*sub_1D750(void *a1))(uint64_t, char)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_563F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  Swift::String v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__connectedControllerIdentifiers[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_563E8);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1D818;
}

uint64_t sub_1D81C(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_563F8);
}

uint64_t sub_1D84C()
{
  return sub_1EB14((uint64_t)&off_47CA8, (uint64_t)&unk_47CD0);
}

const char *sub_1D860()
{
  return "allControllers";
}

uint64_t sub_1D890(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&off_47CA8, (uint64_t)&unk_47CD0);
}

void sub_1D8A4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1D8C0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void *sub_1D8DC()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_1D8E8()
{
  return sub_1F850(OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__allControllers, &qword_56400);
}

uint64_t sub_1D8FC(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_56408,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__allControllers,  &qword_56400);
}

void (*sub_1D918(void *a1))(uint64_t, char)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_56408);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  Swift::String v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__allControllers[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56400);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1D9E0;
}

uint64_t sub_1D9E4(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_56410);
}

uint64_t sub_1DAA4()
{
  return sub_1EB14((uint64_t)&off_47D00, (uint64_t)&unk_47D28);
}

const char *sub_1DAB8()
{
  return "tombstones";
}

uint64_t sub_1DB5C(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&off_47D00, (uint64_t)&unk_47D28);
}

void sub_1DB70(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 tombstones];
  uint64_t v4 = sub_18140(&qword_56620);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v3,  &type metadata for String,  v4,  &protocol witness table for String);

  *a2 = v5;
}

void sub_1DBE4(uint64_t a1, void **a2)
{
  id v2 = *a2;
  sub_18140(&qword_56620);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  [v2 setTombstones:isa];
}

unint64_t sub_1DC50()
{
  return sub_1DE08((uint64_t)_swiftEmptyArrayStorage, &qword_566A0);
}

unint64_t sub_1DC74(uint64_t a1)
{
  uint64_t v2 = sub_18140((uint64_t *)&unk_56720);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }

  sub_18140(&qword_566F0);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v25 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_352F0(v13, (uint64_t)v5, (uint64_t *)&unk_56720);
    unint64_t result = sub_2DD78((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for UUID(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))( v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  v5,  v19);
    *(void *)(v8[7] + 8 * v17) = *(void *)&v5[v10];
    uint64_t v20 = v8[2];
    BOOL v21 = __OFADD__(v20, 1LL);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_12;
    }
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v23 = v25;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1DE08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_18140(a2);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v8 = *(v7 - 2);
    uint64_t v9 = *(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    unint64_t result = sub_19588(v8, v9);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v5[6] + 16 * result);
    uint64_t *v13 = v8;
    v13[1] = v9;
    *(void *)(v5[7] + 8 * result) = v10;
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5[2] = v16;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1DF1C()
{
  return sub_1F850(OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__tombstones, &qword_56418);
}

uint64_t sub_1DF30(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_56420,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__tombstones,  &qword_56418);
}

void (*sub_1DF4C(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_56420);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__tombstones[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56418);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1E014;
}

uint64_t sub_1E018(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_56428);
}

Class sub_1E048(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void *a6)
{
  uint64_t KeyPath = swift_getKeyPath(a3, a2);
  uint64_t v12 = swift_getKeyPath(a4, v11);
  id v13 = a1;
  static Published.subscript.getter(&v17);

  swift_release(KeyPath);
  swift_release(v12);
  uint64_t v14 = v17;
  sub_34D00(0LL, a5, a6);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

uint64_t sub_1E0FC()
{
  return sub_1EB14((uint64_t)&unk_47D58, (uint64_t)&unk_47D80);
}

const char *sub_1E110()
{
  return "profiles";
}

uint64_t sub_1E140( void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = sub_34D00(0LL, a4, a5);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  uint64_t KeyPath = swift_getKeyPath(a6, v13);
  uint64_t v16 = swift_getKeyPath(a7, v15);
  uint64_t v18 = v12;
  return static Published.subscript.setter(&v18, a1, KeyPath, v16);
}

uint64_t sub_1E1CC(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&unk_47D58, (uint64_t)&unk_47D80);
}

void sub_1E1E0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1E1FC(id *a1@<X0>, SEL *a2@<X3>, unint64_t *a3@<X4>, void *a4@<X5>, uint64_t *a5@<X8>)
{
  id v8 = [*a1 *a2];
  uint64_t v9 = sub_34D00(0LL, a3, a4);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  *a5 = v10;
}

void sub_1E268(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_1E284(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, unint64_t *a5, void *a6, SEL *a7)
{
  id v8 = *a2;
  sub_34D00(0LL, a5, a6);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v8, *a7, isa);
}

uint64_t sub_1E2EC()
{
  return sub_1E698(&classRef_GCSProfile, (SEL *)&selRef_defaultProfile);
}

uint64_t sub_1E300()
{
  return sub_1F850(&OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profiles, &qword_56438);
}

uint64_t sub_1E314(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_56440,  &OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profiles,  &qword_56438);
}

void (*sub_1E330(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_56440);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profiles;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56438);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1E3F8;
}

uint64_t sub_1E3FC(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_56448);
}

uint64_t sub_1E42C()
{
  return sub_1EB14((uint64_t)&unk_47DB0, (uint64_t)&unk_47DD8);
}

const char *sub_1E440()
{
  return "mouseProfiles";
}

uint64_t sub_1E470(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&unk_47DB0, (uint64_t)&unk_47DD8);
}

void sub_1E484(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1E4A0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void *sub_1E4BC()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_1E4C8()
{
  return sub_1F850(OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__mouseProfiles, &qword_56450);
}

uint64_t sub_1E4DC(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_56458,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__mouseProfiles,  &qword_56450);
}

void (*sub_1E4F8(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_56458);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__mouseProfiles[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56450);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1E5C0;
}

uint64_t sub_1E5C4(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_56460);
}

uint64_t sub_1E5F4()
{
  return sub_1EB14((uint64_t)&unk_47E00, (uint64_t)&unk_47E28);
}

const char *sub_1E608()
{
  return "games";
}

uint64_t sub_1E638(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&unk_47E00, (uint64_t)&unk_47E28);
}

void sub_1E64C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1E668(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1E684()
{
  return sub_1E698(&classRef_GCSGame, (SEL *)&selRef_defaultGame);
}

uint64_t sub_1E698(void *a1, SEL *a2)
{
  uint64_t v4 = sub_18140(&qword_56430);
  uint64_t v5 = swift_allocObject(v4, 40LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_47BF0;
  *(void *)(v5 + 32) = [(id)objc_opt_self(*a1) *a2];
  specialized Array._endMutation()();
  return v5;
}

uint64_t sub_1E71C()
{
  return sub_1F850(OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__games, &qword_56468);
}

uint64_t sub_1E730(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_56470,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__games,  &qword_56468);
}

void (*sub_1E74C(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_56470);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__games[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56468);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1E814;
}

uint64_t sub_1E818(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_56478);
}

uint64_t sub_1E848()
{
  return sub_1EB14((uint64_t)&unk_47E68, (uint64_t)&unk_47E90);
}

const char *sub_1E85C()
{
  return "copilotFusedControllers";
}

uint64_t sub_1E88C(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&unk_47E68, (uint64_t)&unk_47E90);
}

void sub_1E8A0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1E8BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void *sub_1E8D8()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_1E8E4()
{
  return sub_1F850( OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__copilotFusedControllers,  &qword_56480);
}

uint64_t sub_1E8F8(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_56488,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__copilotFusedControllers,  &qword_56480);
}

void (*sub_1E914(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_56488);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__copilotFusedControllers[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56480);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1E9DC;
}

uint64_t sub_1E9E0(uint64_t a1)
{
  return sub_1E9EC(a1, &qword_56490);
}

uint64_t sub_1E9EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1;
  uint64_t v2 = sub_18140(a2);
  return Published.init(initialValue:)(&v4, v2);
}

uint64_t sub_1EB00()
{
  return sub_1EB14((uint64_t)&unk_47EC8, (uint64_t)&unk_47EF0);
}

uint64_t sub_1EB14(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(a1, a2);
  uint64_t v5 = swift_getKeyPath(a2, v4);
  static Published.subscript.getter(&v7);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

const char *sub_1EB7C()
{
  return "profileUsageStats";
}

uint64_t sub_1EC48(uint64_t a1)
{
  return sub_1EC5C(a1, (uint64_t)&unk_47EC8, (uint64_t)&unk_47EF0);
}

uint64_t sub_1EC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(a2, a2);
  uint64_t v8 = swift_getKeyPath(a3, v7);
  uint64_t v10 = a1;
  return static Published.subscript.setter(&v10, v3, KeyPath, v8);
}

void sub_1ECC0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 profileUsageStats];
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = type metadata accessor for GCSProfileUsageStats();
  uint64_t v6 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, v4, v5, v6);

  *a2 = v7;
}

void sub_1ED5C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  type metadata accessor for UUID(0LL);
  type metadata accessor for GCSProfileUsageStats();
  sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  [v2 setProfileUsageStats:isa];
}

unint64_t sub_1EDF8()
{
  return sub_1DC74((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_1EE04()
{
  return sub_1F850(&OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profileUsageStats, &qword_56498);
}

uint64_t sub_1EE18(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_564A0,  &OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profileUsageStats,  &qword_56498);
}

void (*sub_1EE34(void *a1))(uint64_t, char)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_564A0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profileUsageStats;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_56498);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1EEFC;
}

uint64_t sub_1EF00(char a1)
{
  char v2 = a1;
  return Published.init(initialValue:)(&v2, &type metadata for Bool);
}

uint64_t sub_1EF40()
{
  return sub_1F2AC((uint64_t)&unk_47F30, (uint64_t)&unk_47F58);
}

const char *sub_1EF54()
{
  return "longPressMenuOpensLaunchPad";
}

void sub_1F01C(char a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_47F30, a2);
  uint64_t v6 = swift_getKeyPath(&unk_47F58, v5);
  char v9 = a1;
  uint64_t v7 = v2;
  static Published.subscript.setter(&v9, v7, KeyPath, v6);
  id v8 = *(id *)&v7[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults];
  objc_msgSend( v8,  "setBool:forKey:",  objc_msgSend(v7, "longPressMenuOpensLaunchPad"),  @"bluetoothPrefsMenuLongPressAction");
}

id sub_1F0CC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result = [*a1 longPressMenuOpensLaunchPad];
  *a2 = (_BYTE)result;
  return result;
}

id sub_1F0FC(unsigned __int8 *a1, id *a2)
{
  return [*a2 setLongPressMenuOpensLaunchPad:*a1];
}

uint64_t sub_1F110()
{
  return sub_1F850( OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__longPressMenuOpensLaunchPad,  &qword_564B0);
}

uint64_t sub_1F124(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_564B8,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__longPressMenuOpensLaunchPad,  &qword_564B0);
}

void (*sub_1F140(void *a1))(uint64_t, char)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_564B8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__longPressMenuOpensLaunchPad[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_564B0);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1F208;
}

uint64_t sub_1F220(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath = swift_getKeyPath(a3, a2);
  uint64_t v8 = swift_getKeyPath(a4, v7);
  id v9 = a1;
  static Published.subscript.getter(&v11);

  swift_release(KeyPath);
  swift_release(v8);
  return v11;
}

uint64_t sub_1F298()
{
  return sub_1F2AC((uint64_t)&unk_47FA8, (uint64_t)&unk_47FD0);
}

uint64_t sub_1F2AC(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(a1, a2);
  uint64_t v5 = swift_getKeyPath(a2, v4);
  static Published.subscript.getter(&v7);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

const char *sub_1F314()
{
  return "naturalThumbstickScrollDirection";
}

void sub_1F360(char a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_47FA8, a2);
  uint64_t v6 = swift_getKeyPath(&unk_47FD0, v5);
  v12[0] = a1;
  uint64_t v7 = v2;
  static Published.subscript.setter(v12, v7, KeyPath, v6);
  id v8 = *(id *)&v7[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults];
  uint64_t v9 = [v7 naturalThumbstickScrollDirection] ^ 1;
  swift_beginAccess(&qword_563B0, v12, 0LL, 0LL);
  uint64_t v10 = off_563B8;
  swift_bridgeObjectRetain(off_563B8);
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  [v8 setBool:v9 forKey:v11];
}

id sub_1F454@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result = [*a1 naturalThumbstickScrollDirection];
  *a2 = (_BYTE)result;
  return result;
}

id sub_1F484(unsigned __int8 *a1, id *a2)
{
  return [*a2 setNaturalThumbstickScrollDirection:*a1];
}

uint64_t sub_1F498()
{
  return sub_1F850( OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__naturalThumbstickScrollDirection,  &qword_564B0);
}

uint64_t sub_1F4AC(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_564B8,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__naturalThumbstickScrollDirection,  &qword_564B0);
}

void (*sub_1F4C8(void *a1))(uint64_t, char)
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_564B8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__naturalThumbstickScrollDirection[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_564B0);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1F590;
}

uint64_t sub_1F594(double a1)
{
  double v2 = a1;
  return Published.init(initialValue:)(&v2, &type metadata for Double);
}

double sub_1F63C(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_48010, a2);
  uint64_t v4 = swift_getKeyPath(&unk_48038, v3);
  static Published.subscript.getter(&v6);
  swift_release(KeyPath);
  swift_release(v4);
  return v6;
}

const char *sub_1F6AC()
{
  return "thumbstickScrollingSpeed";
}

void sub_1F6FC(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_48010, a3);
  uint64_t v7 = swift_getKeyPath(&unk_48038, v6);
  *(double *)uint64_t v14 = a1;
  uint64_t v8 = v3;
  static Published.subscript.setter(v14, v8, KeyPath, v7);
  id v9 = *(id *)&v8[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults];
  [v8 thumbstickScrollingSpeed];
  double v11 = v10;
  swift_beginAccess(&qword_563C0, v14, 0LL, 0LL);
  uint64_t v12 = off_563C8;
  swift_bridgeObjectRetain(off_563C8);
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  [v9 setDouble:v13 forKey:v11];
}

id sub_1F7F8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 thumbstickScrollingSpeed];
  *a2 = v4;
  return result;
}

id sub_1F828(double *a1, id *a2)
{
  return [*a2 setThumbstickScrollingSpeed:*a1];
}

uint64_t sub_1F83C()
{
  return sub_1F850( OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__thumbstickScrollingSpeed,  &qword_564C0);
}

uint64_t sub_1F850(void *a1, uint64_t *a2)
{
  uint64_t v4 = sub_18140(a2);
  Published.projectedValue.getter(v4);
  return swift_endAccess(v6);
}

uint64_t sub_1F8B4(uint64_t a1)
{
  return sub_1F8D0( a1,  &qword_564C8,  OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__thumbstickScrollingSpeed,  &qword_564C0);
}

uint64_t sub_1F8D0(uint64_t a1, uint64_t *a2, void *a3, uint64_t *a4)
{
  uint64_t v8 = sub_18140(a2);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  swift_beginAccess(v4 + *a3, v15, 33LL, 0LL);
  uint64_t v12 = sub_18140(a4);
  Published.projectedValue.setter(v11, v12);
  swift_endAccess(v15);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t (*sub_1F9A8(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_18140(&qword_564C8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__thumbstickScrollingSpeed[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33LL, 0LL);
  uint64_t v9 = sub_18140(&qword_564C0);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_1FA70;
}

void sub_1FA74(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88LL) + 16LL);
  v4(*(void *)(*(void *)a1 + 104LL), v3[14], v3[10]);
  uint64_t v5 = v3[15];
  uint64_t v6 = v3[16];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = (void *)v3[14];
  uint64_t v10 = v3[11];
  uint64_t v9 = (void *)v3[12];
  uint64_t v11 = v3[9];
  uint64_t v12 = v3[10];
  uint64_t v13 = v11 + v5;
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess(v13, v3 + 3, 33LL, 0LL);
    Published.projectedValue.setter(v9, v6);
    swift_endAccess(v3 + 3);
    uint64_t v14 = *(void (**)(void *, uint64_t))(v10 + 8);
    v14(v7, v12);
  }

  else
  {
    swift_beginAccess(v11 + v5, v3 + 6, 33LL, 0LL);
    Published.projectedValue.setter(v7, v6);
    swift_endAccess(v3 + 6);
    uint64_t v14 = *(void (**)(void *, uint64_t))(v10 + 8);
  }

  v14(v8, v12);
  free(v8);
  free(v7);
  free(v9);
  free(v3);
}

void *sub_1FB8C(uint64_t a1, uint64_t a2)
{
  return sub_23844( a1,  a2,  (SEL *)&selRef_allControllers,  (unint64_t *)&qword_564D0,  &classRef_GCSController,  (SEL *)&selRef_persistentIdentifier);
}

void *sub_1FCC4()
{
  id v1 = [v0 hiddenControllers];
  uint64_t v2 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  id v4 = [v0 allControllers];
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v2);

  uint64_t v6 = sub_310C4(v5, v3);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  return v6;
}

uint64_t sub_1FD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a2);
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    unint64_t v5 = a2 & 0xC000000000000001LL;
    if ((a2 & 0xC000000000000001LL) == 0)
    {
      id v6 = *(id *)(a2 + 32);
      goto LABEL_5;
    }

    while (1)
    {
      id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
LABEL_5:
      uint64_t v7 = v6;
      sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
      char v8 = static NSObject.== infix(_:_:)(v7, a1);

      if ((v8 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease(a2);
        return 1LL;
      }

      if (v4 == 1) {
        goto LABEL_18;
      }
      if (v5) {
        break;
      }
      unint64_t v5 = 5LL;
      while (1)
      {
        unint64_t v15 = v5 - 3;
        if (__OFADD__(v5 - 4, 1LL)) {
          break;
        }
        id v16 = *(id *)(a2 + 8 * v5);
        char v17 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v17 & 1) != 0) {
          goto LABEL_6;
        }
        ++v5;
        if (v15 == v4) {
          goto LABEL_18;
        }
      }

      __break(1u);
    }

    uint64_t v10 = 1LL;
    while (1)
    {
      uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a2);
      uint64_t v12 = v10 + 1;
      if (__OFADD__(v10, 1LL)) {
        break;
      }
      uint64_t v13 = v11;
      char v14 = static NSObject.== infix(_:_:)(v11, a1);
      swift_unknownObjectRelease(v13);
      if ((v14 & 1) != 0) {
        goto LABEL_6;
      }
      ++v10;
      if (v12 == v4) {
        goto LABEL_18;
      }
    }

    __break(1u);
LABEL_20:
    if (a2 < 0) {
      uint64_t v18 = a2;
    }
    else {
      uint64_t v18 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
  }

LABEL_18:
  swift_bridgeObjectRelease(a2);
  return 0LL;
}

uint64_t sub_1FF10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = a3[4];
  uint64_t v8 = a3[5];
  if (v7 == a1 && v8 == a2) {
    return 1LL;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0LL);
  if ((result & 1) != 0) {
    return 1LL;
  }
  if (v3 == 1) {
    return 0LL;
  }
  uint64_t v11 = a3 + 7;
  for (uint64_t i = 1LL; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1LL)) {
      break;
    }
    uint64_t v14 = *(v11 - 1);
    uint64_t v15 = *v11;
    BOOL v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0LL) & 1) != 0) {
      return 1LL;
    }
    uint64_t result = 0LL;
    v11 += 2;
    if (v13 == v3) {
      return result;
    }
  }

  __break(1u);
  return result;
}

Swift::Int sub_1FFD4()
{
  return sub_219A4(0x72746E6F436C6C61LL, 0xEE007372656C6C6FLL);
}

uint64_t sub_20040()
{
  return sub_213D0( (SEL *)&selRef_allControllers,  (unint64_t *)&qword_564D0,  &classRef_GCSController,  (uint64_t (*)(uint64_t, id))sub_3137C);
}

uint64_t sub_20088()
{
  id v1 = [v0 copilotFusedControllers];
  uint64_t v2 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain(v3);
    id v22 = v0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v7 = (char *)_swiftEmptyArrayStorage;
LABEL_19:
    swift_bridgeObjectRelease_n(v3, 2LL);
    id v18 = [v22 allControllers];
    uint64_t v19 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
    unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);

    BOOL v21 = sub_316F8(v20, v7);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v7);
    return (uint64_t)v21;
  }

  if (v3 < 0) {
    uint64_t v17 = v3;
  }
  else {
    uint64_t v17 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v3);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v17);
  uint64_t v4 = result;
  id v22 = v0;
  if (!result) {
    goto LABEL_18;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001LL) != 0) {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, "fusedControllerIdentifier", v22);
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      uint64_t v13 = v12;

      if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0) {
        uint64_t v7 = sub_1A714(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
      }
      unint64_t v15 = *((void *)v7 + 2);
      unint64_t v14 = *((void *)v7 + 3);
      if (v15 >= v14 >> 1) {
        uint64_t v7 = sub_1A714((char *)(v14 > 1), v15 + 1, 1, v7);
      }
      ++v6;
      *((void *)v7 + 2) = v15 + 1;
      BOOL v16 = &v7[16 * v15];
      *((void *)v16 + 4) = v11;
      *((void *)v16 + 5) = v13;
    }

    while (v4 != v6);
    goto LABEL_19;
  }

  __break(1u);
  return result;
}

Swift::Int sub_202C4()
{
  uint64_t v0 = sub_18140((uint64_t *)&unk_561E0);
  uint64_t inited = swift_initStackObject(v0, &v4);
  *(_OWORD *)(inited + 16) = xmmword_47C00;
  strcpy((char *)(inited + 32), "allControllers");
  *(_BYTE *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0xD000000000000017LL;
  *(void *)(inited + 56) = 0x8000000000047E30LL;
  Swift::Int v2 = sub_323D0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 2LL, &type metadata for String);
  return v2;
}

Class sub_20480(void *a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void *a5)
{
  id v8 = a1;
  uint64_t v9 = a3();

  sub_34D00(0LL, a4, a5);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

uint64_t sub_204EC()
{
  id v1 = [v0 copilotFusedControllers];
  uint64_t v53 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v53);

  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v16 = v2;
    }
    else {
      uint64_t v16 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(v16);
    uint64_t v3 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v6 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
  uint64_t result = swift_bridgeObjectRetain(v2);
  if (!v3) {
    goto LABEL_18;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_57;
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if ((v2 & 0xC000000000000001LL) != 0) {
      id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
    }
    else {
      id v7 = *(id *)(v2 + 8 * v5 + 32);
    }
    id v8 = v7;
    id v9 = [v7 fusedControllerIdentifier];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;

    if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
      uint64_t v6 = sub_1A714(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
    }
    unint64_t v14 = *((void *)v6 + 2);
    unint64_t v13 = *((void *)v6 + 3);
    if (v14 >= v13 >> 1) {
      uint64_t v6 = sub_1A714((char *)(v13 > 1), v14 + 1, 1, v6);
    }
    ++v5;
    *((void *)v6 + 2) = v14 + 1;
    unint64_t v15 = &v6[16 * v14];
    *((void *)v15 + 4) = v10;
    *((void *)v15 + 5) = v12;
  }

  while (v3 != v5);
LABEL_19:
  swift_bridgeObjectRelease_n(v2, 2LL);
  id v17 = [v52 copilotFusedControllers];
  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, v53);

  if (!((unint64_t)v18 >> 62))
  {
    uint64_t v19 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain(v18);
    if (v19) {
      goto LABEL_21;
    }
LABEL_36:
    BOOL v21 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_37;
  }

  if (v18 < 0) {
    uint64_t v31 = v18;
  }
  else {
    uint64_t v31 = v18 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v18);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v31);
  uint64_t v19 = result;
  if (!result) {
    goto LABEL_36;
  }
LABEL_21:
  if (v19 < 1)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }

  uint64_t v20 = 0LL;
  BOOL v21 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if ((v18 & 0xC000000000000001LL) != 0) {
      id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v18);
    }
    else {
      id v22 = *(id *)(v18 + 8 * v20 + 32);
    }
    uint64_t v23 = v22;
    id v24 = [v22 pilotIdentifier];
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    uint64_t v27 = v26;

    if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0) {
      BOOL v21 = sub_1A714(0LL, *((void *)v21 + 2) + 1LL, 1, v21);
    }
    unint64_t v29 = *((void *)v21 + 2);
    unint64_t v28 = *((void *)v21 + 3);
    if (v29 >= v28 >> 1) {
      BOOL v21 = sub_1A714((char *)(v28 > 1), v29 + 1, 1, v21);
    }
    ++v20;
    *((void *)v21 + 2) = v29 + 1;
    id v30 = &v21[16 * v29];
    *((void *)v30 + 4) = v25;
    *((void *)v30 + 5) = v27;
  }

  while (v19 != v20);
LABEL_37:
  swift_bridgeObjectRelease_n(v18, 2LL);
  id v32 = [v52 copilotFusedControllers];
  uint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v32, v53);

  if (!((unint64_t)v33 >> 62))
  {
    uint64_t v34 = *(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain(v33);
    if (v34) {
      goto LABEL_39;
    }
LABEL_54:
    id v36 = (char *)_swiftEmptyArrayStorage;
LABEL_55:
    swift_bridgeObjectRelease_n(v33, 2LL);
    id v48 = [v52 fusableControllers];
    uint64_t v49 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
    unint64_t v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v48, v49);

    uint64_t v51 = sub_3191C(v50, v6, v21, v36);
    swift_bridgeObjectRelease(v50);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v36);
    return (uint64_t)v51;
  }

  if (v33 < 0) {
    uint64_t v47 = v33;
  }
  else {
    uint64_t v47 = v33 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v33);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v47);
  uint64_t v34 = result;
  if (!result) {
    goto LABEL_54;
  }
LABEL_39:
  if (v34 >= 1)
  {
    uint64_t v35 = 0LL;
    unint64_t v54 = v33 & 0xC000000000000001LL;
    id v36 = (char *)_swiftEmptyArrayStorage;
    uint64_t v37 = v33;
    do
    {
      if (v54) {
        id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v35, v33);
      }
      else {
        id v38 = *(id *)(v33 + 8 * v35 + 32);
      }
      unint64_t v39 = v38;
      id v40 = [v38 copilotIdentifier];
      uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
      uint64_t v43 = v42;

      if ((swift_isUniquelyReferenced_nonNull_native(v36) & 1) == 0) {
        id v36 = sub_1A714(0LL, *((void *)v36 + 2) + 1LL, 1, v36);
      }
      unint64_t v45 = *((void *)v36 + 2);
      unint64_t v44 = *((void *)v36 + 3);
      if (v45 >= v44 >> 1) {
        id v36 = sub_1A714((char *)(v44 > 1), v45 + 1, 1, v36);
      }
      ++v35;
      *((void *)v36 + 2) = v45 + 1;
      uint64_t v46 = &v36[16 * v45];
      *((void *)v46 + 4) = v41;
      *((void *)v46 + 5) = v43;
      uint64_t v33 = v37;
    }

    while (v34 != v35);
    goto LABEL_55;
  }

LABEL_58:
  __break(1u);
  return result;
}

    __break(1u);
LABEL_59:
    if (v4 < 0) {
      uint64_t v51 = v4;
    }
    else {
      uint64_t v51 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
  }

  return _swiftEmptyArrayStorage;
}

Swift::Int sub_20A18()
{
  uint64_t v0 = sub_18140((uint64_t *)&unk_561E0);
  uint64_t inited = swift_initStackObject(v0, &v4);
  *(_OWORD *)(inited + 16) = xmmword_47C10;
  strcpy((char *)(inited + 32), "allControllers");
  *(_BYTE *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0xD000000000000017LL;
  *(void *)(inited + 56) = 0x8000000000047E30LL;
  *(void *)(inited + 64) = 0xD00000000000001ALL;
  *(void *)(inited + 72) = 0x80000000000418A0LL;
  Swift::Int v2 = sub_323D0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 3LL, &type metadata for String);
  return v2;
}

void sub_20C00()
{
  id v1 = [v0 allControllers];
  uint64_t v2 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
    if (v4) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease(v3);
    return;
  }

  if (v3 < 0) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v3);
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease(v3);
  if (!v4) {
    goto LABEL_17;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
  }

  else
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001LL) != 0) {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * i + 32);
      }
      id v9 = v8;
      id v10 = [v8 supportsBuddyController];
      if ((_DWORD)v10)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
        uint64_t v6 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
        uint64_t v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v9);
        specialized ContiguousArray._endMutation()(v7);
      }

      else
      {
      }
    }

    swift_bridgeObjectRelease(v3);
  }

Swift::Int sub_20D80()
{
  return sub_219A4(0x72746E6F436C6C61LL, 0xEE007372656C6C6FLL);
}

uint64_t sub_20DF8()
{
  id v1 = [v0 games];
  uint64_t v2 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0) {
      uint64_t v24 = v3;
    }
    else {
      uint64_t v24 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v3);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v24);
    swift_bridgeObjectRelease(v3);
    if (v4) {
      goto LABEL_3;
    }
LABEL_23:
    uint64_t result = swift_bridgeObjectRelease(v3);
    goto LABEL_24;
  }

  uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
  if (!v4) {
    goto LABEL_23;
  }
LABEL_3:
  uint64_t result = objc_opt_self(&OBJC_CLASS___GCSGame);
  id v29 = (id)result;
  if (v4 < 1) {
    goto LABEL_34;
  }
  uint64_t v6 = 0LL;
  unint64_t v7 = v3 & 0xC000000000000001LL;
  uint64_t v8 = v3;
  do
  {
    if (v7) {
      id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
    }
    else {
      id v12 = *(id *)(v3 + 8 * v6 + 32);
    }
    unint64_t v13 = v12;
    id v14 = objc_msgSend(v12, "bundleIdentifier", v29);
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v17 = v16;

    id v18 = [v29 defaultIdentifier];
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    uint64_t v21 = v20;

    if (v15 == v19 && v17 == v21)
    {
      uint64_t v9 = swift_bridgeObjectRelease_n(v17, 2LL);
LABEL_6:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v9);
      uint64_t v10 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v10);
      uint64_t v11 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v13);
      specialized ContiguousArray._endMutation()(v11);
      goto LABEL_7;
    }

    char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v19, v21, 0LL);
    swift_bridgeObjectRelease(v17);
    uint64_t v9 = swift_bridgeObjectRelease(v21);
    if ((v23 & 1) != 0) {
      goto LABEL_6;
    }

LABEL_7:
    ++v6;
    uint64_t v3 = v8;
  }

  while (v4 != v6);
  uint64_t result = swift_bridgeObjectRelease(v8);
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000LL) == 0)
  {
LABEL_24:
    if (_swiftEmptyArrayStorage[2]) {
      goto LABEL_26;
    }
LABEL_31:
    swift_release(_swiftEmptyArrayStorage);
    __break(1u);
LABEL_32:
    id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, _swiftEmptyArrayStorage);
LABEL_29:
    id v26 = v25;
    swift_release(_swiftEmptyArrayStorage);
    return (uint64_t)v26;
  }

void sub_210D0()
{
  id v1 = [v0 profiles];
  uint64_t v2 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
    if (v4) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease(v3);
    goto LABEL_19;
  }

  if (v3 < 0) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = v3 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v3);
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease(v3);
  if (!v4) {
    goto LABEL_18;
  }
LABEL_3:
  if (v4 < 1) {
    goto LABEL_29;
  }
  for (uint64_t i = 0LL; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001LL) != 0) {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
    }
    else {
      id v8 = *(id *)(v3 + 8 * i + 32);
    }
    uint64_t v9 = v8;
    id v10 = [v8 customizable];
    if ((v10 & 1) != 0)
    {
    }

    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
      uint64_t v6 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
      uint64_t v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v9);
      specialized ContiguousArray._endMutation()(v7);
    }
  }

  swift_bridgeObjectRelease(v3);
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000LL) == 0)
  {
    if (!_swiftEmptyArrayStorage[2])
    {
LABEL_26:
      swift_release(_swiftEmptyArrayStorage);
      __break(1u);
      goto LABEL_27;
    }

    goto LABEL_21;
  }

Class sub_212EC( void *a1, uint64_t a2, SEL *a3, unint64_t *a4, void *a5, uint64_t (*a6)(uint64_t, id))
{
  id v10 = a1;
  id v11 = [v10 *a3];
  uint64_t v12 = sub_34D00(0LL, a4, a5);
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

  uint64_t v14 = a6(v13, v10);
  swift_bridgeObjectRelease(v13);

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

uint64_t sub_213AC()
{
  return sub_213D0( (SEL *)&selRef_profiles,  (unint64_t *)&qword_564F0,  &classRef_GCSProfile,  (uint64_t (*)(uint64_t, id))sub_31CB0);
}

uint64_t sub_213D0(SEL *a1, unint64_t *a2, void *a3, uint64_t (*a4)(uint64_t, id))
{
  id v8 = [v4 *a1];
  uint64_t v9 = sub_34D00(0LL, a2, a3);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  id v11 = v4;
  uint64_t v12 = a4(v10, v11);
  swift_bridgeObjectRelease(v10);

  return v12;
}

Swift::Int sub_21474()
{
  return sub_219A4(0x73656C69666F7270LL, 0xE800000000000000LL);
}

uint64_t sub_214C8()
{
  return sub_213D0( (SEL *)&selRef_profiles,  (unint64_t *)&qword_564F0,  &classRef_GCSProfile,  (uint64_t (*)(uint64_t, id))sub_31F30);
}

Swift::Int sub_214EC()
{
  return sub_219A4(0x73656C69666F7270LL, 0xE800000000000000LL);
}

uint64_t sub_21538()
{
  id v1 = [v0 profiles];
  uint64_t v2 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (v3 < 0 || (v3 & 0x4000000000000000LL) != 0)
  {
    id v8 = v0;
    unint64_t v9 = swift_bridgeObjectRetain(v3);
    uint64_t v4 = (uint64_t)sub_2DF24(v9);
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8LL;
    id v5 = v0;
    swift_bridgeObjectRetain(v3);
  }

  uint64_t v10 = v4;
  id v6 = v0;
  sub_33364(&v10, v6);
  swift_bridgeObjectRelease(v3);

  return v10;
}

uint64_t sub_21628(void **a1, id *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v47 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  id v11 = (char *)&v44 - v10;
  uint64_t v12 = *a1;
  id v46 = *a2;
  id v44 = v12;
  id v13 = [v12 uuid];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v14 = a3;
  id v15 = [a3 profileUsageStats];
  uint64_t v16 = type metadata accessor for GCSProfileUsageStats();
  uint64_t v17 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v15, v6, v16, v17);

  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_2DD78((uint64_t)v11), (v20 & 1) != 0))
  {
    uint64_t v21 = *(id *)(*(void *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRelease(v18);
    id v22 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v23 = v22(v11, v6);
    int v45 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v21)))(v23);
  }

  else
  {
    swift_bridgeObjectRelease(v18);
    id v22 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    v22(v11, v6);
    int v45 = 0;
  }

  id v24 = v46;
  id v25 = [v46 uuid];
  uint64_t v26 = (uint64_t)v47;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  id v27 = [v14 profileUsageStats];
  uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v27, v6, v16, v17);

  if (*(void *)(v28 + 16) && (unint64_t v29 = sub_2DD78(v26), (v30 & 1) != 0))
  {
    uint64_t v31 = *(id *)(*(void *)(v28 + 56) + 8 * v29);
    swift_bridgeObjectRelease(v28);
    uint64_t v32 = v22((char *)v26, v6);
    char v33 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v31)))(v32);

    if ((v45 & 1) != 0)
    {
      if ((v33 & 1) == 0) {
        goto LABEL_11;
      }
    }

    else if ((v33 & 1) != 0)
    {
      char v34 = 0;
      return v34 & 1;
    }
  }

  else
  {
    swift_bridgeObjectRelease(v28);
    v22((char *)v26, v6);
    if ((v45 & 1) != 0)
    {
LABEL_11:
      char v34 = 1;
      return v34 & 1;
    }
  }

  id v35 = [v44 name];
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
  uint64_t v38 = v37;

  id v39 = [v24 name];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
  uint64_t v42 = v41;

  if (v36 == v40 && v38 == v42)
  {
    char v34 = 0;
    uint64_t v42 = v38;
  }

  else
  {
    char v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v36, v38, v40, v42, 1LL);
  }

  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRelease(v42);
  return v34 & 1;
}

Swift::Int sub_2198C()
{
  return sub_219A4(0x73656C69666F7270LL, 0xE800000000000000LL);
}

Swift::Int sub_219A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18140((uint64_t *)&unk_561E0);
  uint64_t inited = swift_initStackObject(v4, &v8);
  *(_OWORD *)(inited + 16) = xmmword_47C20;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  Swift::Int v6 = sub_323D0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  return v6;
}

Class sub_21A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_18140((uint64_t *)&unk_561E0);
  uint64_t inited = swift_initStackObject(v6, &v11);
  *(_OWORD *)(inited + 16) = xmmword_47C20;
  *(void *)(inited + 32) = a3;
  *(void *)(inited + 40) = a4;
  Swift::Int v8 = sub_323D0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

uint64_t sub_21AF0(void *a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v1) - 8])();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [v1 connectedControllerIdentifiers];
    uint64_t v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for String);

    id v7 = [v4 fusedControllerIdentifier];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    uint64_t v10 = v9;

    int v11 = sub_1FF10(v8, v10, v6);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
  }

  else
  {
    int v11 = 0;
  }

  id v12 = [v1 connectedControllerIdentifiers];
  id v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, &type metadata for String);

  id v14 = [a1 persistentIdentifier];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  uint64_t v17 = v16;

  LODWORD(v14) = sub_1FF10(v15, v17, v13);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v17);
  return (v14 | v11) & 1;
}

uint64_t sub_21CA4()
{
  id v1 = (void *)(*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v0) - 8])();
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 fusedControllerIdentifier];
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    uint64_t v6 = v5;

    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))((char *)&stru_1A8.offset + (swift_isaMask & *v0)))(v4, v6);
    swift_bridgeObjectRelease(v6);
    if (v7)
    {
      char v8 = (*(uint64_t (**)(uint64_t))((char *)&stru_1F8.reloff + (swift_isaMask & *v0)))(v7);

      uint64_t v2 = (void *)v7;
    }

    else
    {
      char v8 = 0;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

uint64_t sub_21DCC(uint64_t a1)
{
  id v3 = [v1 fusedControllers];
  uint64_t v4 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  LOBYTE(a1) = sub_1FD8C(a1, v5);
  swift_bridgeObjectRelease(v5);
  return a1 & 1;
}

void *sub_21EF0(void *a1)
{
  id v2 = [v1 copilotFusedControllers];
  uint64_t v3 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  while (v5)
  {
    uint64_t v6 = 4LL;
    while (1)
    {
      id v7 = (v4 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, v4)
         : *(id *)(v4 + 8 * v6);
      char v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1LL)) {
        break;
      }
      id v10 = [v7 pilotIdentifier];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      uint64_t v13 = v12;

      id v14 = [a1 persistentIdentifier];
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      uint64_t v17 = v16;

      if (v11 == v15 && v13 == v17) {
        goto LABEL_21;
      }
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v15, v17, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v17);
      if ((v19 & 1) != 0) {
        goto LABEL_22;
      }
      id v20 = [v8 copilotIdentifier];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      uint64_t v13 = v22;

      id v23 = [a1 persistentIdentifier];
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      uint64_t v26 = v25;

      if (v21 == v24 && v13 == v26) {
        goto LABEL_21;
      }
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v13, v24, v26, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v26);
      if ((v27 & 1) != 0) {
        goto LABEL_22;
      }
      id v28 = [v8 fusedControllerIdentifier];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      uint64_t v13 = v30;

      id v31 = [a1 persistentIdentifier];
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      uint64_t v34 = v33;

      if (v29 == v32 && v13 == v34)
      {
LABEL_21:
        swift_bridgeObjectRelease(v4);
        swift_bridgeObjectRelease_n(v13, 2LL);
        return v8;
      }

      char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v13, v32, v34, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v34);
      if ((v35 & 1) != 0)
      {
LABEL_22:
        swift_bridgeObjectRelease(v4);
        return v8;
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_20;
      }
    }

    __break(1u);
LABEL_25:
    if (v4 < 0) {
      uint64_t v37 = v4;
    }
    else {
      uint64_t v37 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v37);
    swift_bridgeObjectRelease(v4);
  }

LABEL_20:
  swift_bridgeObjectRelease(v4);
  return 0LL;
}

void *sub_22254(void *a1)
{
  id v2 = [v1 copilotFusedControllers];
  uint64_t v3 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  while (v5)
  {
    uint64_t v6 = 4LL;
    while (1)
    {
      id v7 = (v4 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, v4)
         : *(id *)(v4 + 8 * v6);
      char v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1LL)) {
        break;
      }
      id v10 = [v7 pilotIdentifier];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      uint64_t v13 = v12;

      id v14 = [a1 persistentIdentifier];
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      uint64_t v17 = v16;

      if (v11 == v15 && v13 == v17) {
        goto LABEL_18;
      }
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v15, v17, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v17);
      if ((v19 & 1) != 0) {
        goto LABEL_19;
      }
      id v20 = [v8 copilotIdentifier];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      uint64_t v13 = v22;

      id v23 = [a1 persistentIdentifier];
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      uint64_t v26 = v25;

      if (v21 == v24 && v13 == v26)
      {
LABEL_18:
        swift_bridgeObjectRelease(v4);
        swift_bridgeObjectRelease_n(v13, 2LL);
        return v8;
      }

      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v13, v24, v26, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v26);
      if ((v27 & 1) != 0)
      {
LABEL_19:
        swift_bridgeObjectRelease(v4);
        return v8;
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_17;
      }
    }

    __break(1u);
LABEL_22:
    if (v4 < 0) {
      uint64_t v29 = v4;
    }
    else {
      uint64_t v29 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v29);
    swift_bridgeObjectRelease(v4);
  }

void *sub_22520(void *a1)
{
  id v2 = [v1 copilotFusedControllers];
  uint64_t v3 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  while (v5)
  {
    uint64_t v6 = 4LL;
    while (1)
    {
      id v7 = (v4 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, v4)
         : *(id *)(v4 + 8 * v6);
      char v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1LL)) {
        break;
      }
      id v10 = [v7 fusedControllerIdentifier];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      uint64_t v13 = v12;

      id v14 = [a1 persistentIdentifier];
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      uint64_t v17 = v16;

      if (v11 == v15 && v13 == v17)
      {
        swift_bridgeObjectRelease(v4);
        swift_bridgeObjectRelease_n(v13, 2LL);
        return v8;
      }

      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v15, v17, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v17);
      if ((v19 & 1) != 0)
      {
        swift_bridgeObjectRelease(v4);
        return v8;
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_14;
      }
    }

    __break(1u);
LABEL_19:
    if (v4 < 0) {
      uint64_t v21 = v4;
    }
    else {
      uint64_t v21 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v21);
    swift_bridgeObjectRelease(v4);
  }

uint64_t sub_227A4()
{
  uint64_t v140 = type metadata accessor for Logger(0LL);
  uint64_t v139 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  v148 = (char *)&v138 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = sub_18140(&qword_564F8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v138 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v3);
  unint64_t v7 = (unint64_t)&v138 - v6;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void (***)(uint64_t, void))(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (uint64_t)&v138 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (uint64_t)&v138 - v13;
  unint64_t v15 = sub_1DC74((uint64_t)_swiftEmptyArrayStorage);
  v161 = v0;
  id v16 = [v0 profiles];
  uint64_t v17 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  unint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

  uint64_t v19 = v18;
  v166 = (uint8_t *)v18;
  if (v18 >> 62) {
    goto LABEL_130;
  }
  uint64_t v20 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFF8LL));
LABEL_3:
  uint64_t v157 = v8;
  unint64_t v162 = v7;
  v163 = v9;
  uint64_t v164 = v12;
  v160 = v5;
  if (v20)
  {
    unint64_t v165 = v19 & 0xC000000000000001LL;
    uint64_t v21 = 4LL;
    while (1)
    {
      if (v165) {
        id v23 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v21 - 4, v19);
      }
      else {
        id v23 = *(id *)(v19 + 8 * v21);
      }
      uint64_t v5 = v23;
      uint64_t v12 = v21 - 3;
      if (__OFADD__(v21 - 4, 1LL))
      {
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        if (v19 < 0) {
          uint64_t v135 = v19;
        }
        else {
          uint64_t v135 = v19 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v19);
        uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v135);
        swift_bridgeObjectRelease(v166);
        uint64_t v19 = (uint64_t)v166;
        goto LABEL_3;
      }

      id v24 = [v23 uuid];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      id v25 = [objc_allocWithZone((Class)type metadata accessor for GCSProfileUsageStats()) init];
      if (!v25)
      {
        swift_bridgeObjectRetain(v15);
        unint64_t v33 = sub_2DD78(v14);
        char v35 = v34;
        swift_bridgeObjectRelease(v15);
        if ((v35 & 1) != 0)
        {
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
          v167[0] = v15;
          uint64_t v8 = v157;
          if (!isUniquelyReferenced_nonNull_native)
          {
            sub_30288();
            unint64_t v15 = v167[0];
          }

          uint64_t v37 = (void (*)(unint64_t, uint64_t))v163[1];
          v37(*(void *)(v15 + 48) + v163[9] * v33, v8);
          uint64_t v38 = *(void **)(*(void *)(v167[0] + 56) + 8 * v33);
          int64_t v39 = v33;
          uint64_t v40 = v167[0];
          sub_2FAC4(v39, v167[0]);
          swift_bridgeObjectRelease(0x8000000000000000LL);
        }

        else
        {
          uint64_t v40 = v15;
          uint64_t v38 = 0LL;
          uint64_t v37 = (void (*)(unint64_t, uint64_t))v163[1];
          uint64_t v8 = v157;
        }

        v37(v14, v8);

        uint64_t v5 = v38;
        unint64_t v15 = v40;
        uint64_t v9 = (void (**)(uint64_t, void))v163;
        goto LABEL_7;
      }

      uint64_t v8 = (uint64_t)v25;
      uint64_t v26 = v15;
      unint64_t v15 = swift_isUniquelyReferenced_nonNull_native(v15);
      v167[0] = v26;
      unint64_t v7 = sub_2DD78(v14);
      uint64_t v28 = *(void *)(v26 + 16);
      uint64_t v19 = (v27 & 1) == 0;
      uint64_t v29 = v28 + v19;
      if (__OFADD__(v28, v19)) {
        goto LABEL_127;
      }
      char v30 = v27;
      if (*(void *)(v26 + 24) >= v29)
      {
        if ((v15 & 1) != 0)
        {
          unint64_t v15 = v167[0];
          if ((v27 & 1) == 0) {
            goto LABEL_24;
          }
        }

        else
        {
          sub_30288();
          unint64_t v15 = v167[0];
          if ((v30 & 1) == 0) {
            goto LABEL_24;
          }
        }
      }

      else
      {
        sub_2F0B4(v29, v15);
        unint64_t v31 = sub_2DD78(v14);
        if ((v30 & 1) != (v32 & 1))
        {
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v157);
          __break(1u);
          return result;
        }

        unint64_t v7 = v31;
        unint64_t v15 = v167[0];
        if ((v30 & 1) == 0)
        {
LABEL_24:
          *(void *)(v15 + 8 * (v7 >> 6) + 64) |= 1LL << v7;
          uint64_t v9 = (void (**)(uint64_t, void))v163;
          ((void (*)(unint64_t, uint64_t, uint64_t))v163[2])( *(void *)(v15 + 48) + v163[9] * v7,  v14,  v157);
          *(void *)(*(void *)(v15 + 56) + 8 * v7) = v8;
          uint64_t v41 = *(void *)(v15 + 16);
          BOOL v42 = __OFADD__(v41, 1LL);
          uint64_t v43 = v41 + 1;
          if (v42) {
            goto LABEL_128;
          }
          *(void *)(v15 + 16) = v43;
          goto LABEL_6;
        }
      }

      uint64_t v22 = *(void *)(v15 + 56);

      *(void *)(v22 + 8 * v7) = v8;
      uint64_t v9 = (void (**)(uint64_t, void))v163;
LABEL_6:
      swift_bridgeObjectRelease(0x8000000000000000LL);
      uint64_t v8 = v157;
      v9[1](v14, v157);
      unint64_t v7 = v162;
LABEL_7:

      ++v21;
      uint64_t v19 = (uint64_t)v166;
      if (v12 == v20)
      {
        swift_bridgeObjectRelease(v166);
        uint64_t v5 = v160;
        goto LABEL_32;
      }
    }
  }

  swift_bridgeObjectRelease(v19);
LABEL_32:
  id v44 = v161;
  id v45 = objc_msgSend(v161, "hiddenControllers", v138);
  uint64_t v159 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, v159);

  id v46 = [v44 games];
  uint64_t v47 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v46, v47);

  if ((unint64_t)v12 >> 62)
  {
    if (v12 < 0) {
      uint64_t v136 = v12;
    }
    else {
      uint64_t v136 = v12 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v12);
    uint64_t v137 = _CocoaArrayWrapper.endIndex.getter(v136);
    swift_bridgeObjectRelease(v12);
    uint64_t v48 = v137;
  }

  else
  {
    uint64_t v48 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v49 = v148;
  unint64_t v155 = v15;
  if (v48)
  {
    uint64_t v19 = 0LL;
    unint64_t v147 = v12 & 0xC000000000000001LL;
    uint64_t v142 = v12 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v141 = v12 + 32;
    uint64_t v50 = v14 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v156 = v14 & 0xFFFFFFFFFFFFFF8LL;
    if (v14 < 0) {
      uint64_t v50 = v14;
    }
    uint64_t v138 = v50;
    unint64_t v153 = v14 & 0xC000000000000001LL;
    uint64_t v51 = (uint64_t *)&unk_56500;
    uint64_t v145 = v48;
    uint64_t v146 = v12;
    do
    {
      if (v147)
      {
        uint64_t v52 = v19;
        id v53 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v19, v12);
      }

      else
      {
        uint64_t v52 = v19;
        id v53 = *(id *)(v141 + 8 * v19);
      }

      id v151 = v53;
      BOOL v42 = __OFADD__(v52, 1LL);
      uint64_t v54 = v52 + 1;
      if (v42) {
        goto LABEL_126;
      }
      uint64_t v150 = v54;
      id v55 = [v151 controllerToProfileMappings];
      uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v55,  &type metadata for String,  v8,  &protocol witness table for String);

      uint64_t v56 = 0LL;
      uint64_t v57 = *(void *)(v12 + 64);
      uint64_t v152 = v12 + 64;
      uint64_t v58 = 1LL << *(_BYTE *)(v12 + 32);
      if (v58 < 64) {
        uint64_t v59 = ~(-1LL << v58);
      }
      else {
        uint64_t v59 = -1LL;
      }
      unint64_t v60 = v59 & v57;
      unint64_t v61 = (unint64_t)(v58 + 63) >> 6;
      v143 = (uint8_t *)(v61 - 1);
      int64_t v154 = v61;
      v144 = (uint8_t *)(v61 - 5);
      uint64_t v158 = v12;
      uint64_t v19 = (uint64_t)&v170;
      uint64_t v149 = v12 + 104;
      while (1)
      {
        if (v60)
        {
          unint64_t v165 = (v60 - 1) & v60;
          v166 = v56;
          unint64_t v62 = __clz(__rbit64(v60)) | ((void)v56 << 6);
          goto LABEL_53;
        }

        os_log_type_t v70 = v56 + 1;
        if (__OFADD__(v56, 1LL))
        {
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
          goto LABEL_125;
        }

        if ((uint64_t)v70 >= v154)
        {
          uint64_t v72 = v56;
        }

        else
        {
          unint64_t v71 = *(void *)(v152 + 8LL * (void)v70);
          if (v71) {
            goto LABEL_57;
          }
          uint64_t v72 = v56 + 1;
          if ((uint64_t)(v56 + 2) < v154)
          {
            unint64_t v71 = *(void *)(v152 + 8LL * (void)(v56 + 2));
            if (v71)
            {
              os_log_type_t v70 = v56 + 2;
              uint64_t v9 = (void (**)(uint64_t, void))v163;
              goto LABEL_57;
            }

            uint64_t v72 = v56 + 2;
            if ((uint64_t)(v56 + 3) < v154)
            {
              unint64_t v71 = *(void *)(v152 + 8LL * (void)(v56 + 3));
              if (v71)
              {
                os_log_type_t v70 = v56 + 3;
                uint64_t v9 = (void (**)(uint64_t, void))v163;
LABEL_57:
                unint64_t v165 = (v71 - 1) & v71;
                v166 = v70;
                unint64_t v62 = __clz(__rbit64(v71)) + ((void)v70 << 6);
LABEL_53:
                uint64_t v63 = *(void *)(v158 + 56);
                v64 = (void *)(*(void *)(v158 + 48) + 16 * v62);
                uint64_t v65 = v64[1];
                void *v5 = *v64;
                v5[1] = v65;
                uint64_t v66 = v63 + (void)v9[9] * v62;
                uint64_t v67 = sub_18140(v51);
                uint64_t v68 = v9;
                uint64_t v69 = v67;
                ((void (*)(char *, uint64_t, uint64_t))v68[2])((char *)v5 + *(int *)(v67 + 48), v66, v8);
                (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56LL))( v5,  0LL,  1LL,  v69);
                swift_bridgeObjectRetain(v65);
                goto LABEL_60;
              }

              os_log_type_t v70 = v56 + 4;
              uint64_t v72 = v56 + 3;
              if ((uint64_t)(v56 + 4) < v154)
              {
                unint64_t v71 = *(void *)(v152 + 8LL * (void)v70);
                uint64_t v9 = (void (**)(uint64_t, void))v163;
                if (v71) {
                  goto LABEL_57;
                }
                while (v144 != v56)
                {
                  unint64_t v71 = *(void *)(v149 + 8LL * (void)v56++);
                  if (v71)
                  {
                    os_log_type_t v70 = v56 + 4;
                    goto LABEL_57;
                  }
                }

                uint64_t v72 = v143;
              }
            }
          }
        }

        uint64_t v73 = sub_18140(v51);
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56LL))(v5, 1LL, 1LL, v73);
        unint64_t v165 = 0LL;
        v166 = v72;
LABEL_60:
        sub_34A34((uint64_t)v5, v7, &qword_564F8);
        uint64_t v74 = sub_18140(v51);
        if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 48LL))( v7,  1LL,  v74) == 1) {
          break;
        }
        uint64_t v12 = (uint64_t)v51;
        unint64_t v75 = v14;
        uint64_t v5 = *(void **)v7;
        uint64_t v76 = *(void *)(v7 + 8);
        uint64_t v9 = (void (**)(uint64_t, void))v163;
        uint64_t v77 = v164;
        ((void (*)(uint64_t, unint64_t, uint64_t))v163[4])(v164, v7 + *(int *)(v74 + 48), v8);
        uint64_t v78 = (*(uint64_t (**)(void *, uint64_t))((char *)&stru_1A8.offset + (swift_isaMask & *v161)))( v5,  v76);
        if (!v78)
        {
          v9[1](v77, v8);
          swift_bridgeObjectRelease(v76);
          uint64_t v5 = v160;
          unint64_t v7 = v162;
          uint64_t v14 = v75;
          goto LABEL_49;
        }

        unint64_t v7 = v78;
        uint64_t v14 = v75;
        if (v75 >> 62)
        {
          swift_bridgeObjectRetain(v75);
          uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v138);
          if (!v8) {
            goto LABEL_69;
          }
        }

        else
        {
          uint64_t v8 = *(void *)(v156 + 16);
          swift_bridgeObjectRetain(v75);
          if (!v8) {
            goto LABEL_69;
          }
        }

        if (v153) {
          id v79 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v75);
        }
        else {
          id v79 = *(id *)(v75 + 32);
        }
        v80 = v79;
        char v81 = static NSObject.== infix(_:_:)(v79, v7);

        if ((v81 & 1) != 0)
        {
          swift_bridgeObjectRelease(v75);
          unint64_t v15 = v155;
          goto LABEL_108;
        }

        unint64_t v15 = v155;
        if (v8 == 1)
        {
LABEL_69:
          swift_bridgeObjectRelease(v75);
          goto LABEL_70;
        }

        if (v153)
        {
          uint64_t v9 = (void (**)(uint64_t, void))specialized _ArrayBuffer._getElementSlowPath(_:)(1LL, v75);
          char v96 = static NSObject.== infix(_:_:)(v9, v7);
          swift_unknownObjectRelease(v9);
          if ((v96 & 1) != 0) {
            goto LABEL_91;
          }
          if (v8 != 2)
          {
            unint64_t v15 = 2LL;
            while (1)
            {
              uint64_t v97 = specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v14);
              uint64_t v14 = v15 + 1;
              if (__OFADD__(v15, 1LL)) {
                goto LABEL_123;
              }
              uint64_t v9 = (void (**)(uint64_t, void))v97;
              char v98 = static NSObject.== infix(_:_:)(v97, v7);
              swift_unknownObjectRelease(v9);
              if ((v98 & 1) != 0) {
                goto LABEL_106;
              }
              ++v15;
              BOOL v99 = v14 == v8;
              uint64_t v14 = v75;
              if (v99)
              {
                unint64_t v100 = v75;
                goto LABEL_104;
              }
            }
          }
        }

        else
        {
          uint64_t v9 = (void (**)(uint64_t, void))*(id *)(v75 + 40);
          char v103 = static NSObject.== infix(_:_:)(v9, v7);

          if ((v103 & 1) != 0)
          {
LABEL_91:
            swift_bridgeObjectRelease(v75);
LABEL_107:
            uint64_t v9 = (void (**)(uint64_t, void))v163;
LABEL_108:
            uint64_t v8 = v157;
            v9[1](v164, v157);
            swift_bridgeObjectRelease(v76);

            uint64_t v5 = v160;
            unint64_t v7 = v162;
LABEL_49:
            uint64_t v51 = (uint64_t *)v12;
            goto LABEL_50;
          }

          if (v8 != 2)
          {
            unint64_t v15 = 6LL;
            while (1)
            {
              uint64_t v14 = v15 - 3;
              if (__OFADD__(v15 - 4, 1LL)) {
                goto LABEL_124;
              }
              uint64_t v9 = (void (**)(uint64_t, void))*(id *)(v75 + 8 * v15);
              char v110 = static NSObject.== infix(_:_:)(v9, v7);

              if ((v110 & 1) != 0)
              {
LABEL_106:
                uint64_t v14 = v75;
                swift_bridgeObjectRelease(v75);
                unint64_t v15 = v155;
                goto LABEL_107;
              }

              ++v15;
              if (v14 == v8)
              {
                uint64_t v14 = v75;
                unint64_t v100 = v75;
LABEL_104:
                swift_bridgeObjectRelease(v100);
                unint64_t v15 = v155;
                goto LABEL_105;
              }
            }
          }
        }

        swift_bridgeObjectRelease(v75);
LABEL_105:
        uint64_t v9 = (void (**)(uint64_t, void))v163;
LABEL_70:
        uint64_t v8 = v157;
        uint64_t v51 = (uint64_t *)v12;
        if (!*(void *)(v15 + 16) || (unint64_t v82 = sub_2DD78(v164), (v83 & 1) == 0))
        {
          v9[1](v164, v8);
          swift_bridgeObjectRelease(v76);

          uint64_t v5 = v160;
          unint64_t v7 = v162;
          goto LABEL_50;
        }

        v84 = *(void **)(*(void *)(v15 + 56) + 8 * v82);
        uint64_t v85 = *(uint64_t (**)(uint64_t *))&stru_68.segname[(swift_isaMask & *v84) - 8];
        unint64_t v86 = v84;
        unint64_t v87 = (void (*)(uint64_t *, void))v85(v167);
        sub_2E638(&v168, (uint64_t)v5, v76);
        swift_bridgeObjectRelease(v169);
        v87(v167, 0LL);
        id v88 = [v151 bundleIdentifier];
        uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)(v88);
        uint64_t v91 = v90;

        id v92 = [(id)objc_opt_self(GCSGame) defaultIdentifier];
        uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(v92);
        uint64_t v95 = v94;

        if (v89 == v93 && v91 == v95)
        {
          swift_bridgeObjectRelease_n(v91, 2LL);
          uint64_t v5 = v160;
          uint64_t v9 = (void (**)(uint64_t, void))v163;
        }

        else
        {
          char v101 = _stringCompareWithSmolCheck(_:_:expecting:)(v89, v91, v93, v95, 0LL);
          swift_bridgeObjectRelease(v91);
          swift_bridgeObjectRelease(v95);
          uint64_t v5 = v160;
          uint64_t v9 = (void (**)(uint64_t, void))v163;
          if ((v101 & 1) == 0)
          {
            id v104 = [v151 bundleIdentifier];
            uint64_t v105 = static String._unconditionallyBridgeFromObjectiveC(_:)(v104);
            uint64_t v107 = v106;

            v108 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))&stru_68.segname[(swift_isaMask & *v86) + 16])(v167);
            uint64_t v109 = v107;
            uint64_t v9 = (void (**)(uint64_t, void))v163;
            sub_2E638(&v168, v105, v109);
            swift_bridgeObjectRelease(v169);
            v108(v167, 0LL);

            uint64_t v8 = v157;
            v9[1](v164, v157);
            goto LABEL_93;
          }
        }

        uint64_t v102 = v157;
        v9[1](v164, v157);

        uint64_t v8 = v102;
LABEL_93:
        unint64_t v15 = v155;
        unint64_t v7 = v162;
LABEL_50:
        unint64_t v60 = v165;
        uint64_t v56 = v166;
      }

      swift_release(v158);
      uint64_t v19 = v150;
      uint64_t v49 = v148;
      uint64_t v9 = (void (**)(uint64_t, void))v163;
      uint64_t v12 = v146;
    }

    while (v150 != v145);
  }

  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v12);
  uint64_t v111 = type metadata accessor for GCSProfileUsageStats();
  uint64_t v112 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v15);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  id v114 = v161;
  [v161 setProfileUsageStats:isa];

  uint64_t v115 = sub_1CBE4();
  uint64_t v116 = v139;
  uint64_t v117 = v140;
  uint64_t v118 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v139 + 16))(v49, v115, v140);
  os_log_type_t v119 = static os_log_type_t.info.getter(v118);
  id v120 = v114;
  v121 = (os_log_s *)Logger.logObject.getter(v120);
  uint64_t v122 = v116;
  os_log_type_t v123 = v119;
  if (os_log_type_enabled(v121, v119))
  {
    uint64_t v124 = v8;
    v125 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v126 = swift_slowAlloc(32LL, -1LL);
    v166 = v125;
    v167[0] = v126;
    *(_DWORD *)v125 = 136315138;
    unint64_t v165 = (unint64_t)(v125 + 4);
    uint64_t v127 = v111;
    id v128 = [v120 profileUsageStats];
    uint64_t v129 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v128, v8, v127, v112);

    uint64_t v130 = Dictionary.description.getter(v129, v124, v127, v112);
    unint64_t v132 = v131;
    swift_bridgeObjectRelease(v129);
    uint64_t v168 = sub_1C304(v130, v132, v167);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v165);

    swift_bridgeObjectRelease(v132);
    v133 = v166;
    _os_log_impl(&dword_0, v121, v123, "%s", v166, 0xCu);
    swift_arrayDestroy(v126, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v126, -1LL, -1LL);
    swift_slowDealloc(v133, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v139 + 8))(v148, v140);
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v122 + 8))(v49, v117);
  }

  return swift_bridgeObjectRelease(v155);
}

void *sub_23820(uint64_t a1, uint64_t a2)
{
  return sub_23844(a1, a2, (SEL *)&selRef_games, &qword_564E8, &classRef_GCSGame, (SEL *)&selRef_bundleIdentifier);
}

void *sub_23844(uint64_t a1, uint64_t a2, SEL *a3, unint64_t *a4, void *a5, SEL *a6)
{
  id v12 = [v6 *a3];
  uint64_t v13 = sub_34D00(0LL, a4, a5);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  swift_bridgeObjectRetain(a2);
  unint64_t v15 = sub_30F30(v14, a1, a2, a6);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(a2);
  return v15;
}

id sub_23920(void *a1, uint64_t a2, uint64_t a3, SEL *a4, unint64_t *a5, void *a6, SEL *a7)
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v14 = v13;
  id v15 = a1;
  id v16 = [v15 *a4];
  uint64_t v17 = sub_34D00(0LL, a5, a6);
  uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

  swift_bridgeObjectRetain(v14);
  uint64_t v19 = sub_30F30(v18, v12, v14, a7);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease_n(v14, 2LL);
  return v19;
}

void *sub_239FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [v3 games];
  uint64_t v8 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  swift_bridgeObjectRetain(a2);
  uint64_t v10 = sub_30F30(v9, a1, a2, (SEL *)&selRef_bundleIdentifier);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(a2);
  if (v10 && ([v10 profileExistsFor:a3 with:v3] & 1) == 0)
  {

    return 0LL;
  }

  return v10;
}

uint64_t sub_23C08()
{
  return 1LL;
}

uint64_t sub_23C10(void *a1, void *a2, char a3)
{
  return sub_26028(a1, a2, a3, (uint64_t)&unk_4D470, (uint64_t)sub_33520, (uint64_t)&unk_4D488);
}

uint64_t sub_23CA4()
{
  return 1LL;
}

uint64_t sub_23CAC(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D4C0, (uint64_t)sub_3371C, (uint64_t)&unk_4D4D8);
}

uint64_t sub_23D24()
{
  return 1LL;
}

uint64_t sub_23D2C(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D510, (uint64_t)sub_33858, (uint64_t)&unk_4D528);
}

uint64_t sub_23D48(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a5;
  uint64_t v8 = v5;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v31 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v29 = *(void *)(v14 - 8);
  uint64_t v30 = v14;
  __chkstk_darwin(v14);
  id v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  uint64_t v17 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v18 = swift_allocObject(a3, 33LL, 7LL);
  *(void *)(v18 + 16) = v5;
  *(void *)(v18 + 24) = a1;
  *(_BYTE *)(v18 + 32) = a2;
  aBlock[4] = a4;
  uint64_t v33 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1BA68;
  aBlock[3] = v28;
  uint64_t v19 = _Block_copy(aBlock);
  uint64_t v20 = v33;
  id v21 = v8;
  id v22 = a1;
  uint64_t v23 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v23);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v24 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v25 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v26 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v11, v24);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v16, v13, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v30);
}

uint64_t sub_23F64(void *a1, void *a2, int a3)
{
  int v47 = a3;
  uint64_t v45 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  id v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = [a1 games];
  uint64_t v46 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v46);

  uint64_t v50 = v9;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"games");
  uint64_t v12 = v11;
  swift_bridgeObjectRetain(v9);
  id v13 = [a1 tombstones];
  uint64_t v14 = sub_18140(&qword_56620);
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v13,  &type metadata for String,  v14,  &protocol witness table for String);

  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_19588(v10, v12), (v17 & 1) != 0))
  {
    uint64_t v18 = *(void **)(*(void *)(v15 + 56) + 8 * v16);
    swift_bridgeObjectRetain(v18);
  }

  else
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  uint64_t v49 = (uint64_t)v18;
  unint64_t v19 = sub_2437C((uint64_t)a2, v9, &qword_564E8, &classRef_GCSGame);
  char v21 = v20;
  swift_bridgeObjectRelease(v9);
  if ((v21 & 1) != 0)
  {
    swift_bridgeObjectRelease(v18);
    if ((v47 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v42 = swift_bridgeObjectRetain(v9);
    sub_2A4FC(v42, (uint64_t)j_nullsub_1_0, 0LL);
    swift_bridgeObjectRelease(v9);
    goto LABEL_12;
  }

  id v22 = [a2 bundleIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v24 = v23;

  Date.init()();
  id v25 = objc_allocWithZone(&OBJC_CLASS___GCSTombstone);
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v28 = [v25 initWithIdentifier:v26 creationDate:isa recordType:3];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v45);
  id v29 = v28;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v31 = *(void *)((char *)&dword_10 + (v49 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v30 = *(void *)((char *)&dword_18 + (v49 & 0xFFFFFFFFFFFFFF8LL));
  if (v31 >= v30 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1LL);
  }
  uint64_t v32 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
  specialized Array._endMutation()(v32);
  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"games");
  uint64_t v35 = v34;
  uint64_t v36 = v49;
  id v37 = [a1 tombstones];
  uint64_t v38 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v37,  &type metadata for String,  v14,  &protocol witness table for String);

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v38);
  uint64_t v48 = v38;
  sub_2FF60(v36, v33, v35, isUniquelyReferenced_nonNull_native);
  uint64_t v40 = v48;
  swift_bridgeObjectRelease(v35);
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v41 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v40);
  [a1 setTombstones:v41];

  uint64_t v9 = v50;
  if ((v47 & 1) != 0) {
    goto LABEL_11;
  }
LABEL_12:
  Class v43 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  [a1 setGames:v43];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *a1) + 16])();
}

uint64_t sub_2437C(uint64_t result, uint64_t a2, unint64_t *a3, void *a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
  while (v8)
  {
    if ((a2 & 0xC000000000000001LL) != 0)
    {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
    }

    else
    {
      if (!*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL)))
      {
        __break(1u);
        return result;
      }

      id v9 = *(id *)(a2 + 32);
    }

    uint64_t v10 = v9;
    a4 = (void *)sub_34D00(0LL, a3, a4);
    char v11 = static NSObject.== infix(_:_:)(v10, v7);

    if ((v11 & 1) != 0) {
      return 0LL;
    }
    for (uint64_t i = 0LL; ; ++i)
    {
      a3 = (unint64_t *)(i + 1);
      if (__OFADD__(i, 1LL)) {
        break;
      }
      if ((a2 & 0xC000000000000001LL) != 0)
      {
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i + 1, a2);
      }

      else
      {
        id v13 = *(id *)(a2 + 32 + 8LL * (void)a3);
      }

      uint64_t v14 = v13;
      char v15 = static NSObject.== infix(_:_:)(v13, v7);

      if ((v15 & 1) != 0) {
        return (uint64_t)a3;
      }
    }

    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    if (a2 < 0) {
      uint64_t v16 = a2;
    }
    else {
      uint64_t v16 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v16);
    uint64_t result = swift_bridgeObjectRelease(a2);
  }

  return 0LL;
}

uint64_t sub_24514(unint64_t a1)
{
  uint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000LL) != 0)
  {
    uint64_t v3 = sub_308C0(v3);
    *uint64_t v1 = v3;
  }

  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8LL;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }

  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      char v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }

  char v13 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v13,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_24650()
{
  return 1LL;
}

uint64_t sub_24658(void *a1, void *a2, char a3)
{
  return sub_26028(a1, a2, a3, (uint64_t)&unk_4D560, (uint64_t)sub_33868, (uint64_t)&unk_4D578);
}

uint64_t sub_246EC()
{
  return 1LL;
}

uint64_t sub_246F4(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D5B0, (uint64_t)sub_33A0C, (uint64_t)&unk_4D5C8);
}

uint64_t sub_24770(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4DCB8, (uint64_t)sub_34DB8, (uint64_t)&unk_4DCD0);
}

uint64_t sub_2478C(void *a1, void *a2, int a3)
{
  int v48 = a3;
  uint64_t v46 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  unint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = [a1 copilotFusedControllers];
  uint64_t v47 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v47);

  uint64_t v51 = v9;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"copilotFusedControllers");
  uint64_t v12 = v11;
  swift_bridgeObjectRetain(v9);
  id v13 = [a1 tombstones];
  uint64_t v14 = sub_18140(&qword_56620);
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v13,  &type metadata for String,  v14,  &protocol witness table for String);

  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_19588(v10, v12), (v17 & 1) != 0))
  {
    uint64_t v18 = *(void **)(*(void *)(v15 + 56) + 8 * v16);
    swift_bridgeObjectRetain(v18);
  }

  else
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  uint64_t v50 = (uint64_t)v18;
  unint64_t v19 = sub_2437C((uint64_t)a2, v9, &qword_564E0, &classRef_GCSCopilotFusedController);
  char v21 = v20;
  swift_bridgeObjectRelease(v9);
  if ((v21 & 1) != 0)
  {
    swift_bridgeObjectRelease(v18);
    if ((v48 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v43 = swift_bridgeObjectRetain(v9);
    sub_29EE8(v43, (uint64_t)j_nullsub_1_3, 0LL);
    swift_bridgeObjectRelease(v9);
    goto LABEL_12;
  }

  id v22 = [a2 fusedControllerIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v24 = v23;

  Date.init()(v25);
  id v26 = objc_allocWithZone(&OBJC_CLASS___GCSTombstone);
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v29 = [v26 initWithIdentifier:v27 creationDate:isa recordType:4];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v46);
  id v30 = v29;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v32 = *(void *)((char *)&dword_10 + (v50 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v31 = *(void *)((char *)&dword_18 + (v50 & 0xFFFFFFFFFFFFFF8LL));
  if (v32 >= v31 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1LL);
  }
  uint64_t v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v30);
  specialized Array._endMutation()(v33);
  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"copilotFusedControllers");
  uint64_t v36 = v35;
  uint64_t v37 = v50;
  id v38 = [a1 tombstones];
  uint64_t v39 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v38,  &type metadata for String,  v14,  &protocol witness table for String);

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v39);
  uint64_t v49 = v39;
  sub_2FF60(v37, v34, v36, isUniquelyReferenced_nonNull_native);
  uint64_t v41 = v49;
  swift_bridgeObjectRelease(v36);
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v42 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v41);
  [a1 setTombstones:v42];

  uint64_t v9 = v51;
  if ((v48 & 1) != 0) {
    goto LABEL_11;
  }
LABEL_12:
  Class v44 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  [a1 setCopilotFusedControllers:v44];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *a1) + 16])();
}

uint64_t sub_24BA4()
{
  return 1LL;
}

uint64_t sub_24BAC(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D600, (uint64_t)sub_33B68, (uint64_t)&unk_4D618);
}

uint64_t sub_24C24()
{
  return 1LL;
}

uint64_t sub_24C2C(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D650, (uint64_t)sub_33CC4, (uint64_t)&unk_4D668);
}

uint64_t sub_24C48(void *a1, void *a2, int a3)
{
  int v108 = a3;
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v102 = *(void *)(v5 - 8);
  uint64_t v103 = v5;
  __chkstk_darwin(v5);
  char v101 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v99 = type metadata accessor for UUID(0LL);
  uint64_t v98 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  uint64_t v97 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v111 = type metadata accessor for Logger(0LL);
  id v8 = *(uint8_t **)(v111 - 8);
  uint64_t v9 = __chkstk_darwin(v111);
  uint64_t v107 = (char *)&v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v96 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v96 - v14;
  id v16 = [a1 profiles];
  uint64_t v110 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v110);

  v118[0] = v17;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"profiles");
  uint64_t v20 = v19;
  uint64_t v109 = a1;
  id v21 = [a1 tombstones];
  uint64_t v100 = sub_18140(&qword_56620);
  uint64_t v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v21,  &type metadata for String,  v100,  &protocol witness table for String);

  if (*(void *)(v22 + 16) && (unint64_t v23 = sub_19588(v18, v20), (v24 & 1) != 0))
  {
    uint64_t v25 = *(void **)(*(void *)(v22 + 56) + 8 * v23);
    swift_bridgeObjectRetain(v25);
  }

  else
  {
    uint64_t v25 = _swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v22);
  uint64_t v117 = (uint64_t)v25;
  uint64_t v26 = sub_1CBE4();
  NSString v27 = (uint64_t (*)(char *, uint64_t, uint64_t))*((void *)v8 + 2);
  uint64_t v28 = v27(v15, v26, v111);
  os_log_type_t v29 = static os_log_type_t.info.getter(v28);
  id v30 = a2;
  unint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
  BOOL v32 = os_log_type_enabled(v31, v29);
  uint64_t v105 = v27;
  uint64_t v106 = v13;
  uint64_t v104 = (uint64_t)v15;
  if (v32)
  {
    char v96 = v8;
    uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v34 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v33 = 138412290;
    uint64_t v115 = (uint64_t)v30;
    id v35 = v30;
    id v8 = v96;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, &v116, v33 + 4);
    void *v34 = v30;

    NSString v27 = v105;
    _os_log_impl(&dword_0, v31, v29, "Remove %@", v33, 0xCu);
    uint64_t v36 = sub_18140(&qword_566E8);
    swift_arrayDestroy(v34, 1LL, v36);
    id v13 = v106;
    swift_slowDealloc(v34, -1LL, -1LL);
    swift_slowDealloc(v33, -1LL, -1LL);
  }

  else
  {

    unint64_t v31 = (os_log_s *)v30;
  }

  uint64_t v37 = (void (*)(uint64_t, uint64_t))*((void *)v8 + 1);
  uint64_t v38 = v111;
  v37(v104, v111);
  uint64_t v39 = v27(v13, v26, v38);
  uint64_t v40 = static os_log_type_t.info.getter(v39);
  os_log_type_t v41 = v40;
  Class v42 = (os_log_s *)Logger.logObject.getter(v40);
  if (os_log_type_enabled(v42, v41))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v104 = swift_slowAlloc(32LL, -1LL);
    uint64_t v115 = v104;
    *(_DWORD *)uint64_t v43 = 136315138;
    char v96 = v43 + 4;
    swift_beginAccess(v118, v112, 0LL, 0LL);
    id v44 = v30;
    uint64_t v45 = v118[0];
    uint64_t v46 = swift_bridgeObjectRetain(v118[0]);
    uint64_t v47 = v26;
    uint64_t v48 = Array.description.getter(v46, v110);
    unint64_t v50 = v49;
    uint64_t v51 = v45;
    id v30 = v44;
    swift_bridgeObjectRelease(v51);
    uint64_t v52 = v48;
    uint64_t v26 = v47;
    uint64_t v113 = sub_1C304(v52, v50, &v115);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v113, v114, v96);
    unint64_t v53 = v50;
    NSString v27 = v105;
    swift_bridgeObjectRelease(v53);
    _os_log_impl(&dword_0, v42, v41, "New profiles = %s", v43, 0xCu);
    uint64_t v54 = v104;
    swift_arrayDestroy(v104, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v54, -1LL, -1LL);
    swift_slowDealloc(v43, -1LL, -1LL);

    id v55 = v106;
  }

  else
  {

    id v55 = v13;
  }

  v37((uint64_t)v55, v111);
  uint64_t v56 = v109;
  swift_beginAccess(v118, &v115, 0LL, 0LL);
  uint64_t v57 = v118[0];
  swift_bridgeObjectRetain(v118[0]);
  unint64_t v58 = sub_2437C((uint64_t)v30, v57, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  char v60 = v59;
  swift_bridgeObjectRelease(v57);
  if ((v60 & 1) != 0)
  {
    swift_bridgeObjectRelease(v117);
    if ((v108 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_19:
    uint64_t v91 = v118[0];
    uint64_t v92 = swift_bridgeObjectRetain(v118[0]);
    sub_29F50(v92, (uint64_t)j_nullsub_1_5, 0LL);
    swift_bridgeObjectRelease(v91);
    goto LABEL_20;
  }

  uint64_t v61 = v27(v107, v26, v111);
  uint64_t v62 = static os_log_type_t.debug.getter(v61);
  os_log_type_t v63 = v62;
  v64 = (os_log_s *)Logger.logObject.getter(v62);
  os_log_type_t v65 = v63;
  if (os_log_type_enabled(v64, v63))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v66 = 134217984;
    uint64_t v113 = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v113, v114, v66 + 4);
    _os_log_impl(&dword_0, v64, v65, "Removing at %ld", v66, 0xCu);
    swift_slowDealloc(v66, -1LL, -1LL);
  }

  v37((uint64_t)v107, v111);
  swift_beginAccess(v118, &v113, 33LL, 0LL);
  uint64_t v67 = (void *)sub_24514(v58);
  swift_endAccess(&v113);

  id v68 = [v30 uuid];
  uint64_t v69 = v97;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  UUID.uuidString.getter();
  uint64_t v71 = v70;
  uint64_t v72 = (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v69, v99);
  uint64_t v73 = v101;
  Date.init()(v72);
  id v74 = objc_allocWithZone(&OBJC_CLASS___GCSTombstone);
  NSString v75 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v71);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v77 = [v74 initWithIdentifier:v75 creationDate:isa recordType:2];

  (*(void (**)(char *, uint64_t))(v102 + 8))(v73, v103);
  id v78 = v77;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v80 = *(void *)((char *)&dword_10 + (v117 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v79 = *(void *)((char *)&dword_18 + (v117 & 0xFFFFFFFFFFFFFF8LL));
  if (v80 >= v79 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v79 > 1, v80 + 1, 1LL);
  }
  uint64_t v81 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v80, v78);
  specialized Array._endMutation()(v81);
  uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"profiles");
  uint64_t v84 = v83;
  uint64_t v85 = v117;
  id v86 = [v56 tombstones];
  uint64_t v87 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v86,  &type metadata for String,  v100,  &protocol witness table for String);

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v87);
  uint64_t v113 = v87;
  sub_2FF60(v85, v82, v84, isUniquelyReferenced_nonNull_native);
  uint64_t v89 = v113;
  swift_bridgeObjectRelease(v84);
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v90 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v89);
  [v56 setTombstones:v90];

  if ((v108 & 1) != 0) {
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v93 = v118[0];
  swift_bridgeObjectRetain(v118[0]);
  Class v94 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v93);
  [v56 setProfiles:v94];

  (*(void (**)(void))&stru_248.segname[(swift_isaMask & *v56) + 16])();
  return swift_bridgeObjectRelease(v93);
}

void *sub_255AC(uint64_t a1, uint64_t a2)
{
  return sub_23844( a1,  a2,  (SEL *)&selRef_mouseProfiles,  &qword_56530,  &classRef_GCSMouseProfile,  (SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_255F4()
{
  return 1LL;
}

uint64_t sub_255FC(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D6A0, (uint64_t)sub_33CD0, (uint64_t)&unk_4D6B8);
}

uint64_t sub_25674()
{
  return 1LL;
}

uint64_t sub_2567C(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D6F0, (uint64_t)sub_33E00, (uint64_t)&unk_4D708);
}

void sub_25698(void *a1, void *a2, char a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = [a1 mouseProfiles];
  uint64_t v11 = sub_34D00(0LL, &qword_56530, &classRef_GCSMouseProfile);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  uint64_t v40 = v12;
  uint64_t v13 = sub_1CBE4();
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  os_log_type_t v15 = static os_log_type_t.info.getter(v14);
  id v16 = a2;
  uint64_t v38 = v9;
  uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  if (os_log_type_enabled(v17, v15))
  {
    uint64_t v35 = v6;
    uint64_t v18 = swift_slowAlloc(12LL, -1LL);
    uint64_t v37 = a1;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc(8LL, -1LL);
    uint64_t v36 = v11;
    uint64_t v34 = (void *)v20;
    *(_DWORD *)uint64_t v19 = 138412290;
    id v39 = v16;
    uint64_t v21 = v7;
    id v22 = v16;
    uint64_t v6 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v19 + 4);
    unint64_t v23 = v34;
    void *v34 = v16;

    uint64_t v7 = v21;
    _os_log_impl(&dword_0, v17, v15, "Remove %@", v19, 0xCu);
    uint64_t v24 = sub_18140(&qword_566E8);
    swift_arrayDestroy(v23, 1LL, v24);
    uint64_t v11 = v36;
    swift_slowDealloc(v23, -1LL, -1LL);
    uint64_t v25 = v19;
    a1 = v37;
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {

    uint64_t v17 = (os_log_s *)v16;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v38, v6);
  id v26 = [a1 mouseProfiles];
  uint64_t v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v26, v11);

  unint64_t v28 = sub_2437C((uint64_t)v16, v27, &qword_56530, &classRef_GCSMouseProfile);
  LOBYTE(v26) = v29;
  swift_bridgeObjectRelease(v27);
  uint64_t v30 = v40;
  if ((a3 & 1) != 0)
  {
    uint64_t v31 = swift_bridgeObjectRetain(v40);
    sub_29F6C(v31);
    swift_bridgeObjectRelease(v30);
  }

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v30);
  [a1 setMouseProfiles:isa];
}

uint64_t sub_259E8()
{
  return 1LL;
}

uint64_t sub_259F0(void *a1, void *a2, char a3)
{
  return sub_26028(a1, a2, a3, (uint64_t)&unk_4D740, (uint64_t)sub_33E10, (uint64_t)&unk_4D758);
}

uint64_t sub_25A84()
{
  return 1LL;
}

uint64_t sub_25A8C(void *a1, char a2)
{
  return sub_23D48(a1, a2, (uint64_t)&unk_4D790, (uint64_t)sub_33FC0, (uint64_t)&unk_4D7A8);
}

void sub_25AA8(void *a1, void *a2, char a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v56 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_18140(&qword_566C0);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v55 - v13;
  id v15 = [a1 allControllers];
  uint64_t v16 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);

  uint64_t v60 = v17;
  id v18 = a2;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v20 = *(void *)((char *)&dword_10 + (v60 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v19 = *(void *)((char *)&dword_18 + (v60 & 0xFFFFFFFFFFFFFF8LL));
  if (v20 >= v19 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1LL);
  }
  uint64_t v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v18);
  specialized Array._endMutation()(v21);
  uint64_t v22 = v60;
  if ((a3 & 1) != 0)
  {
    uint64_t v23 = swift_bridgeObjectRetain(v60);
    sub_29F34(v23, (uint64_t)j_nullsub_1_6, 0LL);
    swift_bridgeObjectRelease(v22);
  }

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22);
  [a1 setAllControllers:isa];

  uint64_t v25 = (void *)(*(uint64_t (**)(void))&stru_1F8.segname[swift_isaMask & *a1])();
  id v26 = [v25 controllerToProfileMappings];
  uint64_t v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v26,  &type metadata for String,  v6,  &protocol witness table for String);

  unint64_t v59 = v27;
  id v28 = [v18 persistentIdentifier];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  BOOL v32 = (void *)(*(uint64_t (**)(void))&stru_1F8.segname[(swift_isaMask & *a1) + 8])();
  id v33 = [v32 uuid];

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0LL, 1LL, v6);
  int v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1LL, v6);
  uint64_t v57 = v6;
  if (v34 == 1)
  {
    sub_34D38((uint64_t)v14, &qword_566C0);
    sub_2E508(v29, v31, (uint64_t)v12);
    swift_bridgeObjectRelease(v31);
    sub_34D38((uint64_t)v12, &qword_566C0);
  }

  else
  {
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v36 = (uint64_t)v56;
    v35(v56, v14, v6);
    unint64_t v37 = v59;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v59);
    unint64_t v58 = v37;
    unint64_t v59 = 0x8000000000000000LL;
    sub_300BC(v36, v29, v31, isUniquelyReferenced_nonNull_native);
    unint64_t v39 = v59;
    unint64_t v59 = v58;
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(v39);
  }

  id v40 = [v25 bundleIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  uint64_t v42 = v41;

  id v43 = [v25 title];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
  uint64_t v45 = v44;

  unint64_t v46 = v59;
  unint64_t v47 = sub_18C58((uint64_t)_swiftEmptyArrayStorage);
  id v48 = objc_allocWithZone(&OBJC_CLASS___GCSGame);
  NSString v49 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v42);
  NSString v50 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v45);
  Class v51 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v46);
  type metadata accessor for GCSCompatibilityMode();
  Class v52 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v47);
  id v53 = [v48 initWithBundleIdentifier:v49 title:v50 controllerToProfileMappings:v51 controllerToCompatibilityModeMappings:v52];

  uint64_t v54 = (*(uint64_t (**)(void *, id, uint64_t))((char *)&stru_248.reloff + (swift_isaMask & *a1)))( v25,  v53,  1LL);
  (*(void (**)(uint64_t))&stru_248.segname[(swift_isaMask & *a1) + 16])(v54);
}

uint64_t sub_26004()
{
  return 1LL;
}

uint64_t sub_2600C(void *a1, void *a2, char a3)
{
  return sub_26028(a1, a2, a3, (uint64_t)&unk_4D7E0, (uint64_t)sub_34004, (uint64_t)&unk_4D7F8);
}

uint64_t sub_26028(void *a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  uint64_t v8 = v6;
  uint64_t v12 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v35 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v33 = *(void *)(v15 - 8);
  uint64_t v34 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  id v18 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v19 = swift_allocObject(a4, 41LL, 7LL);
  *(void *)(v19 + 16) = v6;
  *(void *)(v19 + 24) = a1;
  *(void *)(v19 + 32) = a2;
  *(_BYTE *)(v19 + 40) = a3;
  aBlock[4] = v31;
  uint64_t v37 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1BA68;
  aBlock[3] = v32;
  unint64_t v20 = _Block_copy(aBlock);
  uint64_t v21 = v37;
  id v22 = v8;
  id v23 = a1;
  id v24 = a2;
  uint64_t v25 = swift_release(v21);
  static DispatchQoS.unspecified.getter(v25);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v26 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v27 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v28 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v12, v26);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v17, v14, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v17, v34);
}

uint64_t sub_262C8()
{
  return 1LL;
}

uint64_t sub_262D0(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_18140(&qword_56430);
  uint64_t v7 = swift_allocObject(v6, 40LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_47BF0;
  *(void *)(v7 + 32) = a1;
  uint64_t v21 = v7;
  specialized Array._endMutation()(v7);
  uint64_t v8 = v21;
  uint64_t v9 = (void *)(*(uint64_t (**)(void *))&stru_248.sectname[swift_isaMask & *v2])(a1);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = [v9 fusedControllerIdentifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v14 = v13;

    uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))((char *)&stru_1A8.offset + (swift_isaMask & *v3)))( v12,  v14);
    swift_bridgeObjectRelease(v14);
    if (v15)
    {
      id v16 = v15;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v18 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v17 = *(void *)((char *)&dword_18 + (v21 & 0xFFFFFFFFFFFFFF8LL));
      if (v18 >= v17 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1LL);
      }
      uint64_t v19 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v16);
      specialized Array._endMutation()(v19);

      uint64_t v8 = v21;
    }

    sub_24770(v10, a2 & 1);
  }

  (*(void (**)(uint64_t, uint64_t))&stru_2E8.segname[swift_isaMask & *v3])(v8, 1LL);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_2646C()
{
  return 1LL;
}

uint64_t sub_264D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v9 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  uint64_t v12 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v13 = swift_allocObject(&unk_4D830, 33LL, 7LL);
  *(void *)(v13 + 16) = v2;
  *(void *)(v13 + 24) = a1;
  *(_BYTE *)(v13 + 32) = a2;
  aBlock[4] = sub_341D4;
  uint64_t v25 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1BA68;
  aBlock[3] = &unk_4D848;
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = v25;
  id v16 = v3;
  swift_bridgeObjectRetain(a1);
  uint64_t v17 = swift_release(v15);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v18 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v19 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v20 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v6, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v22);
}

uint64_t sub_266F8(void *a1, unint64_t a2, int a3)
{
  LODWORD(v149) = a3;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(char **)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v154 = (char *)&v141 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_18140(&qword_566C0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v152 = (uint64_t)&v141 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v162 = (uint64_t)&v141 - v12;
  __chkstk_darwin(v11);
  uint64_t v161 = (uint64_t)&v141 - v13;
  uint64_t v158 = (void *)type metadata accessor for Date(0LL);
  unint64_t v156 = *(v158 - 1);
  __chkstk_darwin(v158);
  *(void *)&__int128 v151 = (char *)&v141 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v15 = [a1 allControllers];
  id v166 = (id)sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v166);

  uint64_t v170 = v16;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"controllers");
  uint64_t v19 = v18;
  id v143 = a1;
  id v20 = [a1 tombstones];
  unint64_t v148 = sub_18140(&qword_56620);
  uint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v20,  &type metadata for String,  v148,  &protocol witness table for String);

  if (*(void *)(v21 + 16))
  {
    unint64_t v22 = sub_19588(v17, v19);
    if ((v23 & 1) != 0)
    {
      Class v24 = *(Class *)(*(void *)(v21 + 56) + 8 * v22);
      swift_bridgeObjectRetain(v24);
    }

    else
    {
      Class v24 = (Class)_swiftEmptyArrayStorage;
    }
  }

  else
  {
    Class v24 = (Class)_swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v21);
  uint64_t v169 = v24;
  if (a2 >> 62) {
    goto LABEL_98;
  }
  uint64_t v25 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a2);
  while (1)
  {
    uint64_t v26 = v154;
    unint64_t v159 = a2;
    uint64_t v155 = v5;
    unint64_t v153 = v6;
    uint64_t v157 = v25;
    if (v25)
    {
      int v27 = 0;
      unint64_t v28 = 0LL;
      uint64_t v163 = a2 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v164 = a2 & 0xC000000000000001LL;
      unint64_t v160 = a2 + 32;
      while (1)
      {
        LODWORD(v150) = v27;
        while (1)
        {
          if (v164)
          {
            uint64_t v29 = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(v28, a2);
          }

          else
          {
            if (v28 >= *(void *)(v163 + 16)) {
              goto LABEL_96;
            }
            uint64_t v29 = (objc_class *)*(id *)(v160 + 8 * v28);
          }

          Class v24 = v29;
          BOOL v30 = __OFADD__(v28, 1LL);
          unint64_t v31 = v28 + 1;
          if (v30) {
            goto LABEL_92;
          }
          unint64_t v165 = v31;
          uint64_t v32 = v5;
          uint64_t v33 = v170;
          uint64_t v6 = *(char **)((char *)&dword_10 + (v170 & 0xFFFFFFFFFFFFF8LL));
          swift_bridgeObjectRetain(v170);
          if (v6) {
            goto LABEL_19;
          }
LABEL_11:

          swift_bridgeObjectRelease(v33);
          uint64_t v25 = v157;
          unint64_t v28 = v165;
          a2 = v159;
          uint64_t v6 = v153;
          uint64_t v26 = v154;
          uint64_t v5 = v32;
          if (v165 == v157)
          {
            unint64_t v57 = v159;
            swift_bridgeObjectRelease(v159);
            Class v24 = v169;
            goto LABEL_54;
          }
        }

        if (v170 < 0) {
          uint64_t v44 = v170;
        }
        else {
          uint64_t v44 = v170 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(v170);
        uint64_t v6 = (char *)_CocoaArrayWrapper.endIndex.getter(v44);
        if (!v6) {
          goto LABEL_11;
        }
LABEL_19:
        a2 = v33 & 0xC000000000000001LL;
        if ((v33 & 0xC000000000000001LL) != 0)
        {
          id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v33);
        }

        else
        {
          id v34 = *(id *)(v33 + 32);
        }

        uint64_t v35 = v34;
        char v36 = static NSObject.== infix(_:_:)(v34, v24);

        if ((v36 & 1) != 0)
        {
          unint64_t v43 = 0LL;
          goto LABEL_46;
        }

        if (v6 == (_BYTE *)&dword_0 + 1) {
          goto LABEL_11;
        }
        if (a2)
        {
          id v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(1LL, v33);
        }

        else
        {
          id v37 = *(id *)(v33 + 40);
        }

        uint64_t v38 = v37;
        char v39 = static NSObject.== infix(_:_:)(v37, v24);

        if ((v39 & 1) == 0)
        {
          uint64_t v5 = 1LL;
          while (1)
          {
            unint64_t v43 = v5 + 1;
            if (__OFADD__(v5, 1LL)) {
              break;
            }
            uint64_t v32 = v155;
            if (a2)
            {
              id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 + 1, v33);
            }

            else
            {
              if ((v43 & 0x8000000000000000LL) != 0) {
                goto LABEL_89;
              }
              id v40 = *(id *)(v33 + 32 + 8 * v43);
            }

            uint64_t v41 = v40;
            char v42 = static NSObject.== infix(_:_:)(v40, v24);

            ++v5;
            if ((v42 & 1) != 0) {
              goto LABEL_46;
            }
          }

          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
          goto LABEL_91;
        }

        unint64_t v43 = 1LL;
LABEL_46:
        swift_bridgeObjectRelease(v33);

        id v45 = -[objc_class persistentIdentifier](v24, "persistentIdentifier");
        static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
        uint64_t v47 = v46;

        uint64_t v48 = v151;
        Date.init()(v49);
        uint64_t v6 = (char *)objc_allocWithZone(&OBJC_CLASS___GCSTombstone);
        NSString v50 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v47);
        Class isa = Date._bridgeToObjectiveC()().super.isa;
        id v52 = [v6 initWithIdentifier:v50 creationDate:isa recordType:1];

        (*(void (**)(uint64_t, void *))(v156 + 8))(v48, v158);
        id v53 = v52;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v55 = *(void *)((char *)&dword_10 + ((unint64_t)v169 & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v54 = *(void *)((char *)&dword_18 + ((unint64_t)v169 & 0xFFFFFFFFFFFFFF8LL));
        if (v55 >= v54 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v54 > 1, v55 + 1, 1LL);
        }
        uint64_t v56 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v55, v53);
        specialized Array._endMutation()(v56);

        int v27 = 1;
        uint64_t v25 = v157;
        unint64_t v28 = v165;
        a2 = v159;
        uint64_t v5 = v155;
        if (v165 == v157)
        {
          unint64_t v57 = v159;
          swift_bridgeObjectRelease(v159);
          Class v24 = v169;
LABEL_54:
          uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"controllers");
          uint64_t v60 = v59;
          id v61 = v143;
          id v62 = [v143 tombstones];
          uint64_t v63 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v62,  &type metadata for String,  v148,  &protocol witness table for String);

          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v63);
          uint64_t v168 = v63;
          uint64_t v5 = v155;
          sub_2FF60((uint64_t)v24, v58, v60, isUniquelyReferenced_nonNull_native);
          uint64_t v65 = v168;
          uint64_t v66 = v60;
          uint64_t v26 = v154;
          swift_bridgeObjectRelease(v66);
          swift_bridgeObjectRelease(0x8000000000000000LL);
          uint64_t v6 = v153;
          Class v67 = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v65);
          [v61 setTombstones:v67];

          goto LABEL_55;
        }
      }
    }

    unint64_t v57 = a2;
    swift_bridgeObjectRelease(a2);
LABEL_53:
    swift_bridgeObjectRelease(v24);
LABEL_55:
    uint64_t v68 = v170;
    if ((v149 & 1) != 0)
    {
      uint64_t v69 = swift_bridgeObjectRetain(v170);
      sub_29F34(v69, (uint64_t)j_nullsub_1_8, 0LL);
      swift_bridgeObjectRelease(v68);
    }

    Class v70 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v68);
    id v71 = v143;
    [v143 setAllControllers:v70];

    uint64_t v168 = (uint64_t)_swiftEmptyArrayStorage;
    id v72 = [v71 games];
    uint64_t v142 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
    uint64_t v73 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v72, v142);

    uint64_t v146 = v73;
    uint64_t v75 = *(void *)((char *)&dword_10 + (v73 & 0xFFFFFFFFFFFFF8LL));
    unint64_t v76 = v57;
    if (!v75) {
      goto LABEL_106;
    }
LABEL_59:
    a2 = 0LL;
    unint64_t v148 = v146 & 0xC000000000000001LL;
    uint64_t v145 = v146 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v144 = v146 + 32;
    unint64_t v156 = v76 & 0xC000000000000001LL;
    *(void *)&__int128 v74 = 136315394LL;
    __int128 v151 = v74;
    uint64_t v150 = (char *)&type metadata for Any + 8;
    uint64_t v147 = v75;
    while (1)
    {
      if (v148)
      {
        id v77 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, v146);
      }

      else
      {
        if (a2 >= *(void *)(v145 + 16)) {
          goto LABEL_95;
        }
        id v77 = *(id *)(v144 + 8 * a2);
      }

      id v78 = v77;
      BOOL v30 = __OFADD__(a2++, 1LL);
      if (v30) {
        break;
      }
      id v79 = [v77 controllerToProfileMappings];
      uint64_t v80 = type metadata accessor for UUID(0LL);
      uint64_t v163 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v79,  &type metadata for String,  v80,  &protocol witness table for String);

      unint64_t v164 = v80;
      unint64_t v149 = a2;
      if (v25)
      {
        if (v25 < 1) {
          goto LABEL_93;
        }
        uint64_t v158 = v78;
        swift_bridgeObjectRetain(v76);
        unint64_t v81 = 0LL;
        do
        {
          unint64_t v165 = v81;
          if (v156) {
            id v82 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v81, v76);
          }
          else {
            id v82 = *(id *)(v76 + 8 * v81 + 32);
          }
          uint64_t v83 = v163;
          id v166 = v82;
          id v84 = [v82 persistentIdentifier];
          uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
          uint64_t v87 = v86;

          swift_bridgeObjectRetain(v83);
          unint64_t v88 = sub_19588(v85, v87);
          LOBYTE(v84) = v89;
          swift_bridgeObjectRelease(v83);
          if ((v84 & 1) != 0)
          {
            char v90 = swift_isUniquelyReferenced_nonNull_native(v83);
            uint64_t v167 = v83;
            if ((v90 & 1) == 0)
            {
              sub_30664();
              uint64_t v83 = v167;
            }

            swift_bridgeObjectRelease(*(void *)(*(void *)(v83 + 48) + 16 * v88 + 8));
            uint64_t v91 = *(void *)(v80 - 8);
            uint64_t v92 = v161;
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v91 + 32))( v161,  *(void *)(v83 + 56) + *(void *)(v91 + 72) * v88,  v80);
            uint64_t v163 = v83;
            sub_2FD64(v88, v83);
            swift_bridgeObjectRelease(0x8000000000000000LL);
            uint64_t v93 = 0LL;
          }

          else
          {
            uint64_t v91 = *(void *)(v80 - 8);
            uint64_t v93 = 1LL;
            uint64_t v92 = v161;
          }

          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v91 + 56))(v92, v93, 1LL, v80);
          swift_bridgeObjectRelease(v87);
          uint64_t v94 = sub_1CBE4();
          uint64_t v95 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v6 + 2))(v26, v94, v5);
          int v96 = static os_log_type_t.debug.getter(v95);
          uint64_t v97 = v6;
          uint64_t v98 = v5;
          uint64_t v99 = v162;
          sub_352F0(v92, v162, &qword_566C0);
          uint64_t v100 = v92;
          char v101 = v26;
          uint64_t v102 = v158;
          uint64_t v103 = (os_log_s *)Logger.logObject.getter(v102);
          LODWORD(v160) = v96;
          if (os_log_type_enabled(v103, (os_log_type_t)v96))
          {
            uint64_t v104 = swift_slowAlloc(22LL, -1LL);
            uint64_t v105 = swift_slowAlloc(64LL, -1LL);
            uint64_t v167 = v105;
            *(_DWORD *)uint64_t v104 = v151;
            uint64_t v106 = v152;
            sub_352F0(v99, v152, &qword_566C0);
            unint64_t v107 = v164;
            if ((*(unsigned int (**)(uint64_t, uint64_t, unint64_t))(v91 + 48))(v106, 1LL, v164) == 1)
            {
              sub_34D38(v106, &qword_566C0);
              unint64_t v108 = 0xE300000000000000LL;
              uint64_t v109 = 7104878LL;
              uint64_t v110 = v162;
            }

            else
            {
              uint64_t v111 = v106;
              uint64_t v109 = UUID.description.getter();
              unint64_t v108 = v112;
              uint64_t v113 = *(void (**)(uint64_t, unint64_t))(v91 + 8);
              uint64_t v110 = v162;
              v113(v111, v107);
            }

            *(void *)(v104 + 4) = sub_1C304(v109, v108, &v167);
            swift_bridgeObjectRelease(v108);
            sub_34D38(v110, &qword_566C0);
            *(_WORD *)(v104 + 12) = 2080;
            id v114 = [v102 description];
            uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
            unint64_t v117 = v116;

            *(void *)(v104 + 14) = sub_1C304(v115, v117, &v167);
            swift_bridgeObjectRelease(v117);
            _os_log_impl(&dword_0, v103, (os_log_type_t)v160, "removing %s from %s", (uint8_t *)v104, 0x16u);
            swift_arrayDestroy(v105, 2LL, v150);
            swift_slowDealloc(v105, -1LL, -1LL);
            swift_slowDealloc(v104, -1LL, -1LL);

            uint64_t v6 = v153;
            uint64_t v26 = v154;
            uint64_t v5 = v155;
            (*((void (**)(char *, uint64_t))v153 + 1))(v154, v155);
            sub_34D38(v161, &qword_566C0);
            unint64_t v76 = v159;
          }

          else
          {

            sub_34D38(v99, &qword_566C0);
            (*((void (**)(char *, uint64_t))v97 + 1))(v101, v98);
            sub_34D38(v100, &qword_566C0);
            uint64_t v6 = v97;
            uint64_t v26 = v101;
            unint64_t v76 = v159;
            uint64_t v5 = v98;
          }

          uint64_t v80 = v164;
          unint64_t v81 = v165 + 1;
          uint64_t v25 = v157;
        }

        while (v157 != v165 + 1);
        swift_bridgeObjectRelease(v76);
        id v78 = v158;
      }

      id v118 = [v78 bundleIdentifier];
      static String._unconditionallyBridgeFromObjectiveC(_:)(v118);
      uint64_t v120 = v119;

      id v121 = [v78 title];
      static String._unconditionallyBridgeFromObjectiveC(_:)(v121);
      uint64_t v123 = v122;

      uint64_t v124 = v78;
      unint64_t v125 = sub_18C58((uint64_t)_swiftEmptyArrayStorage);
      id v126 = objc_allocWithZone(&OBJC_CLASS___GCSGame);
      NSString v127 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v120);
      NSString v128 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v123);
      uint64_t v129 = v163;
      Class v24 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v129);
      type metadata accessor for GCSCompatibilityMode();
      Class v130 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v125);
      id v131 = [v126 initWithBundleIdentifier:v127 title:v128 controllerToProfileMappings:v24 controllerToCompatibilityModeMappings:v130];

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      unint64_t v133 = *(void *)((char *)&dword_10 + (v168 & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v132 = *(void *)((char *)&dword_18 + (v168 & 0xFFFFFFFFFFFFFF8LL));
      if (v133 >= v132 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v132 > 1, v133 + 1, 1LL);
      }
      uint64_t v134 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v133, v131);
      specialized Array._endMutation()(v134);

      a2 = v149;
      uint64_t v6 = v153;
      uint64_t v26 = v154;
      unint64_t v76 = v159;
      uint64_t v5 = v155;
      if (v149 == v147) {
        goto LABEL_106;
      }
    }

LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    if ((a2 & 0x8000000000000000LL) != 0LL) {
      uint64_t v135 = a2;
    }
    else {
      uint64_t v135 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter(v135);
  }

  if (v73 < 0) {
    uint64_t v136 = v73;
  }
  else {
    uint64_t v136 = v73 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v73);
  uint64_t v75 = _CocoaArrayWrapper.endIndex.getter(v136);
  swift_bridgeObjectRelease(v73);
  unint64_t v76 = v57;
  if (v75) {
    goto LABEL_59;
  }
LABEL_106:
  swift_bridgeObjectRelease(v146);
  uint64_t v137 = v168;
  Class v138 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v137);
  uint64_t v139 = v143;
  [v143 setGames:v138];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v139) + 16])();
}

id sub_276B4()
{
  return [objc_allocWithZone(v0) init];
}

char *sub_276D4()
{
  uint64_t v1 = sub_18140(&qword_56498);
  uint64_t v85 = *(void *)(v1 - 8);
  uint64_t v86 = v1;
  __chkstk_darwin(v1);
  id v84 = (char *)&v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_18140(&qword_56480);
  uint64_t v82 = *(void *)(v3 - 8);
  uint64_t v83 = v3;
  __chkstk_darwin(v3);
  unint64_t v81 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_18140(&qword_56468);
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v80 = v5;
  __chkstk_darwin(v5);
  id v78 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v77 = sub_18140(&qword_56450);
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v75 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v74 = sub_18140(&qword_56438);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  id v72 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)&__int128 v71 = sub_18140(&qword_56418);
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = sub_18140(&qword_56400);
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_18140(&qword_563E8);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = &v0[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_preferencesVersion];
  *(void *)uint64_t v17 = 0x31322E312E3031LL;
  *((void *)v17 + 1) = 0xE700000000000000LL;
  id v18 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  uint64_t v19 = v0;
  NSString v20 = String._bridgeToObjectiveC()();
  id v21 = [v18 initWithSuiteName:v20];

  if (!v21) {
    id v21 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  }
  *(void *)&v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] = v21;
  unint64_t v22 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__connectedControllerIdentifiers[0]];
  aBlock = _swiftEmptyArrayStorage;
  uint64_t v23 = sub_18140(&qword_563E0);
  Published.init(initialValue:)(&aBlock, v23);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v22, v16, v13);
  Class v24 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__allControllers[0]];
  aBlock = _swiftEmptyArrayStorage;
  uint64_t v25 = sub_18140(&qword_563F8);
  Published.init(initialValue:)(&aBlock, v25);
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v24, v12, v69);
  uint64_t v26 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__tombstones[0]];
  aBlock = (void *)sub_1DE08((uint64_t)_swiftEmptyArrayStorage, &qword_566A0);
  uint64_t v27 = sub_18140(&qword_56410);
  Published.init(initialValue:)(&aBlock, v27);
  (*(void (**)(char *, char *, void))(v70 + 32))(v26, v10, v71);
  unint64_t v28 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profiles];
  uint64_t v29 = sub_18140(&qword_56430);
  uint64_t v30 = swift_allocObject(v29, 40LL, 7LL);
  __int128 v71 = xmmword_47BF0;
  *(_OWORD *)(v30 + 16) = xmmword_47BF0;
  id v31 = [(id)objc_opt_self(GCSProfile) defaultProfile];
  *(void *)(v30 + 32) = v31;
  aBlock = (void *)v30;
  specialized Array._endMutation()(v31);
  uint64_t v32 = sub_18140(&qword_56428);
  uint64_t v33 = v72;
  Published.init(initialValue:)(&aBlock, v32);
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v28, v33, v74);
  id v34 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__mouseProfiles[0]];
  aBlock = _swiftEmptyArrayStorage;
  uint64_t v35 = sub_18140(&qword_56448);
  char v36 = v75;
  Published.init(initialValue:)(&aBlock, v35);
  (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v34, v36, v77);
  id v37 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__games[0]];
  uint64_t v38 = swift_allocObject(v29, 40LL, 7LL);
  *(_OWORD *)(v38 + 16) = v71;
  id v39 = [(id)objc_opt_self(GCSGame) defaultGame];
  *(void *)(v38 + 32) = v39;
  aBlock = (void *)v38;
  specialized Array._endMutation()(v39);
  uint64_t v40 = sub_18140(&qword_56460);
  uint64_t v41 = v78;
  Published.init(initialValue:)(&aBlock, v40);
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v37, v41, v80);
  char v42 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__copilotFusedControllers[0]];
  aBlock = _swiftEmptyArrayStorage;
  uint64_t v43 = sub_18140(&qword_56478);
  uint64_t v44 = v81;
  Published.init(initialValue:)(&aBlock, v43);
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v42, v44, v83);
  id v45 = &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profileUsageStats];
  aBlock = (void *)sub_1DC74((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v46 = sub_18140(&qword_56490);
  uint64_t v47 = v84;
  Published.init(initialValue:)(&aBlock, v46);
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v45, v47, v86);
  swift_beginAccess( &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__longPressMenuOpensLaunchPad[0]],  &aBlock,  33LL,  0LL);
  LOBYTE(v94[0]) = 1;
  Published.init(initialValue:)(v94, &type metadata for Bool);
  swift_endAccess(&aBlock);
  swift_beginAccess( &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__naturalThumbstickScrollDirection[0]],  &aBlock,  33LL,  0LL);
  LOBYTE(v94[0]) = 1;
  Published.init(initialValue:)(v94, &type metadata for Bool);
  swift_endAccess(&aBlock);
  swift_beginAccess( &v19[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__thumbstickScrollingSpeed[0]],  &aBlock,  33LL,  0LL);
  v94[0] = 0x4000000000000000LL;
  Published.init(initialValue:)(v94, &type metadata for Double);
  swift_endAccess(&aBlock);

  uint64_t v48 = (objc_class *)type metadata accessor for GCSPreferencesStore(0LL);
  v93.receiver = v19;
  v93.super_class = v48;
  uint64_t v49 = objc_msgSendSuper2(&v93, "init");
  uint64_t v50 = sub_2D580();
  (*(void (**)(uint64_t))&stru_2E8.segname[(swift_isaMask & *v49) + 8])(v50);
  Class v51 = (void *)objc_opt_self(&OBJC_CLASS___NSNotificationCenter);
  id v52 = [v51 defaultCenter];
  uint64_t v53 = swift_allocObject(&unk_4D880, 24LL, 7LL);
  *(void *)(v53 + 16) = v49;
  uint64_t v91 = sub_34240;
  uint64_t v92 = v53;
  aBlock = _NSConcreteStackBlock;
  uint64_t v88 = 1107296256LL;
  char v89 = sub_280AC;
  char v90 = &unk_4D898;
  unint64_t v54 = _Block_copy(&aBlock);
  uint64_t v55 = v92;
  uint64_t v56 = v49;
  swift_release(v55);
  id v57 =  [v52 addObserverForName:GCControllerDidConnectNotification object:0 queue:0 usingBlock:v54];
  _Block_release(v54);
  swift_unknownObjectRelease(v57);

  id v58 = [v51 defaultCenter];
  uint64_t v59 = swift_allocObject(&unk_4D8D0, 24LL, 7LL);
  *(void *)(v59 + 16) = v56;
  uint64_t v91 = sub_34244;
  uint64_t v92 = v59;
  aBlock = _NSConcreteStackBlock;
  uint64_t v88 = 1107296256LL;
  char v89 = sub_280AC;
  char v90 = &unk_4D8E8;
  uint64_t v60 = _Block_copy(&aBlock);
  uint64_t v61 = v92;
  id v62 = v56;
  swift_release(v61);
  id v63 =  [v58 addObserverForName:GCControllerDidDisconnectNotification object:0 queue:0 usingBlock:v60];
  _Block_release(v60);
  swift_unknownObjectRelease(v63);

  uint64_t v64 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults;
  [*(id *)&v62[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] addObserver:v62 forKeyPath:@"bluetoothPrefsMenuLongPressAction" options:1 context:0];
  [*(id *)&v62[v64] addObserver:v62 forKeyPath:@"games" options:1 context:0];
  [*(id *)&v62[v64] addObserver:v62 forKeyPath:@"profiles" options:1 context:0];
  [*(id *)&v62[v64] addObserver:v62 forKeyPath:@"controllers" options:1 context:0];
  [*(id *)&v62[v64] addObserver:v62 forKeyPath:@"copilotFusedControllers" options:1 context:0];
  [*(id *)&v62[v64] addObserver:v62 forKeyPath:@"settingsVersion" options:1 context:0];
  id v65 = *(id *)&v62[v64];
  [v65 addObserver:v62 forKeyPath:@"settingsVersion" options:1 context:0];

  return v62;
}

uint64_t sub_280AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Notification(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void (**)(char *))(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_28170()
{
  uint64_t v1 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults;
  [*(id *)&v0[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] removeObserver:v0 forKeyPath:@"bluetoothPrefsMenuLongPressAction" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"games" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"profiles" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"controllers" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"copilotFusedControllers" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"settingsVersion" context:0];
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for GCSPreferencesStore(0LL);
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_284A0(uint64_t a1, uint64_t a2, uint64_t a3, Class isa, uint64_t a5)
{
  uint64_t v52 = a5;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a2)
  {
    NSString v30 = 0LL;
    goto LABEL_8;
  }

  if (!isa)
  {
    NSString v30 = String._bridgeToObjectiveC()();
LABEL_8:
    uint64_t v32 = v52;
    id v31 = v53;
    sub_352F0(a3, (uint64_t)aBlock, &qword_561F0);
    uint64_t v33 = v55;
    if (v55)
    {
      id v34 = sub_3429C(aBlock, (uint64_t)v55);
      uint64_t v35 = *(v33 - 1);
      __chkstk_darwin(v34);
      id v37 = (char *)&v51 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v35 + 16))(v37);
      uint64_t v38 = _bridgeAnythingToObjectiveC<A>(_:)(v37, v33);
      (*(void (**)(char *, void *))(v35 + 8))(v37, v33);
      sub_1AA58(aBlock);
      if (!isa)
      {
LABEL_11:
        id v39 = (objc_class *)type metadata accessor for GCSPreferencesStore(0LL);
        v60.receiver = v31;
        v60.super_class = v39;
        objc_msgSendSuper2(&v60, "observeValueForKeyPath:ofObject:change:context:", v30, v38, isa, v32);

        swift_unknownObjectRelease(v38);
        return;
      }
    }

    else
    {
      uint64_t v38 = 0LL;
      if (!isa) {
        goto LABEL_11;
      }
    }

    type metadata accessor for NSKeyValueChangeKey(0LL);
    sub_336DC( &qword_56548,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_48248);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    goto LABEL_11;
  }

  sub_352F0(a3, (uint64_t)aBlock, &qword_561F0);
  if (v55)
  {
    uint64_t v51 = v10;
    uint64_t v17 = sub_34D00(0LL, &qword_56550, &classRef_NSUserDefaults);
    swift_bridgeObjectRetain(a2);
    if ((swift_dynamicCast(&v58, aBlock, (char *)&type metadata for Any + 8, v17, 6LL) & 1) != 0)
    {
      id v18 = v58;
      sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
      uint64_t v52 = static OS_dispatch_queue.main.getter();
      uint64_t v19 = (void *)swift_allocObject(&unk_4D920, 48LL, 7LL);
      v19[2] = a1;
      v19[3] = a2;
      NSString v20 = v53;
      v19[4] = v53;
      v19[5] = v18;
      uint64_t v56 = sub_342F4;
      id v57 = v19;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_1BA68;
      uint64_t v55 = &unk_4D938;
      id v21 = _Block_copy(aBlock);
      unint64_t v22 = v57;
      id v23 = v20;
      id v24 = v18;
      uint64_t v25 = swift_release(v22);
      static DispatchQoS.unspecified.getter(v25);
      aBlock[0] = _swiftEmptyArrayStorage;
      uint64_t v26 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      uint64_t v27 = sub_18140((uint64_t *)&unk_56520);
      uint64_t v28 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v9, v26);
      uint64_t v29 = (void *)v52;
      OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v16, v12, v21);
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v9);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      return;
    }
  }

  else
  {
    swift_bridgeObjectRetain(a2);
    sub_34D38((uint64_t)aBlock, &qword_561F0);
  }

  NSString v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  sub_352F0(a3, (uint64_t)aBlock, &qword_561F0);
  uint64_t v41 = v55;
  if (v55)
  {
    char v42 = sub_3429C(aBlock, (uint64_t)v55);
    uint64_t v43 = *(v41 - 1);
    __chkstk_darwin(v42);
    id v45 = (char *)&v51 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v43 + 16))(v45);
    uint64_t v46 = _bridgeAnythingToObjectiveC<A>(_:)(v45, v41);
    (*(void (**)(char *, void *))(v43 + 8))(v45, v41);
    sub_1AA58(aBlock);
  }

  else
  {
    uint64_t v46 = 0LL;
  }

  uint64_t v48 = v52;
  uint64_t v47 = v53;
  type metadata accessor for NSKeyValueChangeKey(0LL);
  sub_336DC( &qword_56548,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_48248);
  Class v49 = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v50 = (objc_class *)type metadata accessor for GCSPreferencesStore(0LL);
  v59.receiver = v47;
  v59.super_class = v50;
  objc_msgSendSuper2(&v59, "observeValueForKeyPath:ofObject:change:context:", v40, v46, v49, v48);

  swift_unknownObjectRelease(v46);
}

uint64_t sub_28B1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v20 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject(&unk_4D970, 24LL, 7LL);
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_3471C;
  uint64_t v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1BA68;
  void aBlock[3] = &unk_4D988;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = v22;
  id v13 = v1;
  uint64_t v14 = swift_release(v12);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v15 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v16 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v17 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_28D30(void *a1)
{
  uint64_t v147 = a1;
  uint64_t v2 = (uint64_t *)type metadata accessor for UUID(0LL);
  uint64_t v149 = *(v2 - 1);
  __chkstk_darwin(v2);
  uint64_t v144 = (char *)&v137 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_18140(&qword_566C0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v141 = (char *)&v137 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  unint64_t v8 = (unint64_t)&v137 - v7;
  unint64_t v9 = (unint64_t)&classRef_GCController;
  id v153 = (id)objc_opt_self(&OBJC_CLASS___GCController);
  id v10 = [v153 controllers];
  uint64_t v152 = (uint64_t (*)(void))sub_34D00(0LL, &qword_566C8, &classRef_GCController);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v152);

  uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(v11);
LABEL_3:
  uint64_t v145 = (char *)v8;
  int64_t v154 = v2;
  if (v12)
  {
    uint64_t v13 = objc_opt_self(&OBJC_CLASS___GameController_Bridge);
    if (v12 < 1) {
      goto LABEL_153;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v1 = 0LL;
    uint64_t v155 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if ((v11 & 0xC000000000000001LL) != 0) {
        id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v11);
      }
      else {
        id v15 = *(id *)(v11 + 8 * v1 + 32);
      }
      uint64_t v16 = v15;
      id v17 = objc_msgSend(v14, "gcController_persistentIdentifier:", v15);
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        uint64_t v21 = v20;

        if ((swift_isUniquelyReferenced_nonNull_native(v155) & 1) == 0) {
          uint64_t v155 = sub_1A714(0LL, *((void *)v155 + 2) + 1LL, 1, v155);
        }
        unint64_t v9 = *((void *)v155 + 2);
        unint64_t v22 = *((void *)v155 + 3);
        if (v9 >= v22 >> 1) {
          uint64_t v155 = sub_1A714((char *)(v22 > 1), v9 + 1, 1, v155);
        }
        id v23 = v155;
        *((void *)v155 + 2) = v9 + 1;
        id v24 = &v23[16 * v9];
        *((void *)v24 + 4) = v19;
        *((void *)v24 + 5) = v21;
      }

      else
      {
      }

      ++v1;
    }

    while (v12 != v1);
  }

  else
  {
    uint64_t v155 = (char *)_swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease_n(v11, 2LL);
  id v25 = [v147 allControllers];
  uint64_t v140 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v25, v140);

  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0) {
      uint64_t v75 = v11;
    }
    else {
      uint64_t v75 = v11 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v11);
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v75);
  }

  else
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(v11);
  }

  if (v12)
  {
    if (v12 < 1) {
      goto LABEL_154;
    }
    uint64_t v26 = 0LL;
    unint64_t v9 = v11 & 0xC000000000000001LL;
    unint64_t v156 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if (v9) {
        id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, v11);
      }
      else {
        id v27 = *(id *)(v11 + 8 * v26 + 32);
      }
      uint64_t v28 = v27;
      id v29 = [v27 persistentIdentifier];
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      uint64_t v32 = v31;

      if ((swift_isUniquelyReferenced_nonNull_native(v156) & 1) == 0) {
        unint64_t v156 = sub_1A714(0LL, *((void *)v156 + 2) + 1LL, 1, v156);
      }
      unint64_t v34 = *((void *)v156 + 2);
      unint64_t v33 = *((void *)v156 + 3);
      if (v34 >= v33 >> 1) {
        unint64_t v156 = sub_1A714((char *)(v33 > 1), v34 + 1, 1, v156);
      }
      ++v26;
      uint64_t v35 = v156;
      *((void *)v156 + 2) = v34 + 1;
      uint64_t v36 = &v35[16 * v34];
      *((void *)v36 + 4) = v30;
      *((void *)v36 + 5) = v32;
    }

    while (v12 != v26);
  }

  else
  {
    unint64_t v156 = (char *)_swiftEmptyArrayStorage;
  }

  swift_bridgeObjectRelease_n(v11, 2LL);
  uint64_t v159 = (uint64_t)_swiftEmptyArrayStorage;
  id v37 = [v147 allControllers];
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v37, v140);

  uint64_t v158 = v11;
  uint64_t v2 = (uint64_t *)[v153 controllers];
  uint64_t v1 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v152);

  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0) {
      unint64_t v9 = v1;
    }
    else {
      unint64_t v9 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (v38) {
      goto LABEL_35;
    }
LABEL_113:
    swift_bridgeObjectRelease(v156);
    swift_bridgeObjectRelease(v1);
    uint64_t v1 = (uint64_t)_swiftEmptyArrayStorage;
LABEL_114:
    uint64_t v76 = swift_bridgeObjectRetain(v1);
    sub_29CFC(v76);
    uint64_t v77 = v158;
    uint64_t v78 = swift_bridgeObjectRetain(v158);
    id v79 = v147;
    sub_29F34(v78, (uint64_t)j_nullsub_1_9, 0LL);
    swift_bridgeObjectRelease(v77);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v77);
    [v79 setAllControllers:isa];

    unint64_t v81 = v155;
    Class v82 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v81);
    [v79 setConnectedControllerIdentifiers:v82];

    uint64_t v12 = (unint64_t)v1 >> 62;
    if ((unint64_t)v1 >> 62)
    {
LABEL_147:
      if (v1 < 0) {
        uint64_t v120 = v1;
      }
      else {
        uint64_t v120 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v121 = _CocoaArrayWrapper.endIndex.getter(v120);
      swift_bridgeObjectRelease(v1);
      if (v121 > 0)
      {
LABEL_116:
        uint64_t v11 = (uint64_t)&swift_isaMask;
        uint64_t v150 = (uint64_t *)(*(uint64_t (**)(void))&stru_1F8.segname[swift_isaMask & *v147])();
        id v83 = [v150 controllerToProfileMappings];
        unint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v83,  &type metadata for String,  v154,  &protocol witness table for String);

        if (v12) {
          goto LABEL_155;
        }
        id v84 = *(char **)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
        if (!v84) {
          goto LABEL_159;
        }
        goto LABEL_118;
      }
    }

    else if (*(uint64_t *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL)) > 0)
    {
      goto LABEL_116;
    }

    swift_bridgeObjectRelease(v1);
    return;
  }

  uint64_t v38 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
  if (!v38) {
    goto LABEL_113;
  }
LABEL_35:
  id v153 = (id)objc_opt_self(&OBJC_CLASS___GameController_Bridge);
  unint64_t v8 = 0LL;
  unint64_t v148 = v1 & 0xC000000000000001LL;
  uint64_t v142 = v1 + 32;
  uint64_t v143 = v1 & 0xFFFFFFFFFFFFFF8LL;
  Class v138 = v156 + 72;
  uint64_t v139 = v1;
  uint64_t v146 = v38;
  while (1)
  {
    if (v148)
    {
      id v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v1);
    }

    else
    {
      if (v8 >= *(void *)(v143 + 16)) {
        goto LABEL_99;
      }
      id v39 = *(id *)(v142 + 8 * v8);
    }

    unint64_t v9 = (unint64_t)v39;
    BOOL v40 = __OFADD__(v8++, 1LL);
    if (v40) {
      goto LABEL_98;
    }
    id v41 = objc_msgSend(v153, "gcController_persistentIdentifier:", v39);
    if (!v41)
    {

      goto LABEL_37;
    }

    char v42 = v41;
    uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
    uint64_t v12 = v44;

    uint64_t v2 = (uint64_t *)v9;
    if (!sub_1C014())
    {
      swift_bridgeObjectRelease(v12);
LABEL_68:

      uint64_t v38 = v146;
      goto LABEL_37;
    }

    uint64_t v45 = *((void *)v156 + 2);
    if (!v45) {
      goto LABEL_65;
    }
    uint64_t v46 = *((void *)v156 + 4);
    uint64_t v47 = *((void *)v156 + 5);
    if ((v46 != v43 || v47 != v12) && (_stringCompareWithSmolCheck(_:_:expecting:)(v46, v47, v43, v12, 0LL) & 1) == 0)
    {
      if (v45 == 1) {
        goto LABEL_65;
      }
      uint64_t v66 = *((void *)v156 + 6);
      uint64_t v67 = *((void *)v156 + 7);
      if ((v66 != v43 || v67 != v12) && (_stringCompareWithSmolCheck(_:_:expecting:)(v66, v67, v43, v12, 0LL) & 1) == 0) {
        break;
      }
    }

LABEL_49:
    swift_bridgeObjectRelease(v12);
    uint64_t v11 = v158;
    if ((unint64_t)v158 >> 62)
    {
      if (v158 < 0) {
        uint64_t v73 = v158;
      }
      else {
        uint64_t v73 = v158 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v158);
      uint64_t v2 = (uint64_t *)_CocoaArrayWrapper.endIndex.getter(v73);
      uint64_t v38 = v146;
      if (v2)
      {
LABEL_51:
        __int128 v151 = (uint64_t *)v11;
        uint64_t v152 = (uint64_t (*)(void))(v11 & 0xC000000000000001LL);
        uint64_t v1 = 4LL;
        uint64_t v150 = v2;
        while (1)
        {
          unint64_t v48 = v1 - 4;
          if (v152) {
            id v49 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v1 - 4, v11);
          }
          else {
            id v49 = *(id *)(v11 + 8 * v1);
          }
          uint64_t v50 = v49;
          id v51 = [v49 persistentIdentifier];
          uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
          uint64_t v2 = v53;

          id v54 = [(id)v9 persistentIdentifier];
          uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
          id v57 = v56;

          if (v52 == v55 && v2 == v57)
          {
            uint64_t v11 = (uint64_t)v151;
            swift_bridgeObjectRelease(v151);

            swift_bridgeObjectRelease(v2);
            goto LABEL_71;
          }

          uint64_t v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v52, v2, v55, v57, 0LL);

          swift_bridgeObjectRelease(v2);
          swift_bridgeObjectRelease(v57);
          if ((v11 & 1) != 0) {
            break;
          }
          objc_super v59 = (uint64_t *)(v1 - 3);
          if (__OFADD__(v48, 1LL))
          {
            __break(1u);
LABEL_98:
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
LABEL_101:
            if (v11 < 0) {
              uint64_t v74 = v11;
            }
            else {
              uint64_t v74 = v11 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain(v11);
            uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v74);
            goto LABEL_3;
          }

          ++v1;
          uint64_t v11 = (uint64_t)v151;
          if (v59 == v150)
          {

            swift_bridgeObjectRelease(v11);
            goto LABEL_77;
          }
        }

        uint64_t v11 = (uint64_t)v151;
        uint64_t v2 = v151;
LABEL_71:
        swift_bridgeObjectRelease(v2);
        uint64_t v2 = (uint64_t *)objc_msgSend(v153, "gcsController_initWithController:", v9);
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v11)
          || v11 < 0
          || (v11 & 0x4000000000000000LL) != 0)
        {
          uint64_t v11 = sub_308C0(v11);
          uint64_t v158 = v11;
        }

        uint64_t v63 = v11 & 0xFFFFFFFFFFFFFF8LL;
        uint64_t v64 = *(void **)(v63 + 8 * v1);
        *(void *)(v63 + 8 * v1) = v2;

        uint64_t v2 = &v158;
        specialized Array._endMutation()(v65);

LABEL_77:
        uint64_t v1 = v139;
        uint64_t v38 = v146;
        goto LABEL_37;
      }
    }

    else
    {
      uint64_t v2 = *(uint64_t **)((char *)&dword_10 + (v158 & 0xFFFFFFFFFFFFF8LL));
      swift_bridgeObjectRetain(v158);
      uint64_t v38 = v146;
      if (v2) {
        goto LABEL_51;
      }
    }

    swift_bridgeObjectRelease(v11);
LABEL_37:
    if (v8 == v38)
    {
      swift_bridgeObjectRelease(v156);
      swift_bridgeObjectRelease(v1);
      uint64_t v1 = v159;
      goto LABEL_114;
    }
  }

  if (v45 == 2)
  {
LABEL_65:
    swift_bridgeObjectRelease(v12);
    id v60 = objc_msgSend(v153, "gcsController_initWithController:", v9);
    uint64_t v2 = &v159;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v11 = *(void *)((char *)&dword_10 + (v159 & 0xFFFFFFFFFFFFFF8LL));
    unint64_t v61 = *(void *)((char *)&dword_18 + (v159 & 0xFFFFFFFFFFFFFF8LL));
    if (v11 >= v61 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v61 > 1, v11 + 1, 1LL);
    }
    uint64_t v62 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v60);
    specialized Array._endMutation()(v62);
    goto LABEL_68;
  }

  uint64_t v11 = (uint64_t)v138;
  uint64_t v68 = 2LL;
  while (1)
  {
    uint64_t v69 = v68 + 1;
    if (__OFADD__(v68, 1LL)) {
      break;
    }
    uint64_t v70 = *(void *)(v11 - 8);
    uint64_t v71 = *(void *)v11;
    BOOL v72 = v70 == v43 && v71 == v12;
    if (v72 || (_stringCompareWithSmolCheck(_:_:expecting:)(v70, v71, v43, v12, 0LL) & 1) != 0) {
      goto LABEL_49;
    }
    v11 += 16LL;
    ++v68;
    if (v69 == v45) {
      goto LABEL_65;
    }
  }

  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  if (v1 < 0) {
    uint64_t v122 = v1;
  }
  else {
    uint64_t v122 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v1);
  id v84 = (char *)_CocoaArrayWrapper.endIndex.getter(v122);
  swift_bridgeObjectRelease(v1);
  if (!v84)
  {
LABEL_159:
    swift_bridgeObjectRelease(v1);
    uint64_t v123 = v150;
    id v124 = [v150 bundleIdentifier];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v124);
    uint64_t v126 = v125;

    id v127 = [v123 title];
    static String._unconditionallyBridgeFromObjectiveC(_:)(v127);
    uint64_t v129 = v128;

    unint64_t v130 = sub_18C58((uint64_t)_swiftEmptyArrayStorage);
    id v131 = objc_allocWithZone(&OBJC_CLASS___GCSGame);
    NSString v132 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v126);
    NSString v133 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v129);
    Class v134 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9);
    type metadata accessor for GCSCompatibilityMode();
    Class v135 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v130);
    id v136 = [v131 initWithBundleIdentifier:v132 title:v133 controllerToProfileMappings:v134 controllerToCompatibilityModeMappings:v135];

    (*(void (**)(uint64_t *, id, uint64_t))((char *)&stru_248.reloff + (swift_isaMask & *v147)))( v123,  v136,  1LL);
    return;
  }

LABEL_118:
  uint64_t v152 = *(uint64_t (**)(void))&stru_1F8.segname[(*(void *)v11 & *v147) + 8];
  id v153 = (id)(v1 & 0xC000000000000001LL);
  uint64_t v85 = 4LL;
  __int128 v151 = (uint64_t *)v84;
  while (2)
  {
    uint64_t v89 = v85 - 4;
    if (v153)
    {
      char v90 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v85 - 4, v1);
      uint64_t v91 = (char *)(v85 - 3);
      if (__OFADD__(v89, 1LL)) {
        goto LABEL_144;
      }
    }

    else
    {
      char v90 = (char *)*(id *)(v1 + 8 * v85);
      uint64_t v91 = (char *)(v85 - 3);
      if (__OFADD__(v89, 1LL))
      {
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
LABEL_146:
        __break(1u);
        goto LABEL_147;
      }
    }

    uint64_t v155 = v90;
    unint64_t v156 = v91;
    id v92 = [v90 persistentIdentifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v92);
    uint64_t v94 = v93;

    uint64_t v95 = (void *)v152();
    id v96 = [v95 uuid];

    uint64_t v97 = (uint64_t)v145;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v96);

    uint64_t v98 = v149;
    uint64_t v99 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v149 + 56);
    uint64_t v100 = v154;
    v99(v97, 0LL, 1LL, v154);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(v98 + 48))(v97, 1LL, v100) == 1)
    {
      sub_34D38(v97, &qword_566C0);
      swift_bridgeObjectRetain(v9);
      uint64_t v12 = sub_19588(v12, v94);
      char v102 = v101;
      swift_bridgeObjectRelease(v9);
      if ((v102 & 1) != 0)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
        uint64_t v157 = (void *)v9;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_30664();
          unint64_t v9 = (unint64_t)v157;
        }

        swift_bridgeObjectRelease(*(void *)(*(void *)(v9 + 48) + 16 * v12 + 8));
        uint64_t v88 = (uint64_t)v141;
        uint64_t v87 = v154;
        (*(void (**)(char *, uint64_t, uint64_t *))(v149 + 32))( v141,  *(void *)(v9 + 56) + *(void *)(v149 + 72) * v12,  v154);
        sub_2FD64(v12, v9);
        swift_bridgeObjectRelease(0x8000000000000000LL);
        uint64_t v86 = 0LL;
      }

      else
      {
        uint64_t v86 = 1LL;
        uint64_t v87 = v154;
        uint64_t v88 = (uint64_t)v141;
      }

      v99(v88, v86, 1LL, v87);
      swift_bridgeObjectRelease(v94);
      sub_34D38(v88, &qword_566C0);

LABEL_121:
      ++v85;
      if (v156 == v84) {
        goto LABEL_159;
      }
      continue;
    }

    break;
  }

  uint64_t v104 = v1;
  uint64_t v1 = *(void *)(v98 + 32);
  ((void (*)(char *, uint64_t, uint64_t *))v1)(v144, v97, v100);
  uint64_t v105 = swift_isUniquelyReferenced_nonNull_native(v9);
  uint64_t v157 = (void *)v9;
  unint64_t v107 = sub_19588(v12, v94);
  uint64_t v108 = *(void *)(v9 + 16);
  BOOL v109 = (v106 & 1) == 0;
  uint64_t v110 = v108 + v109;
  if (__OFADD__(v108, v109)) {
    goto LABEL_145;
  }
  char v111 = v106;
  if (*(void *)(v9 + 24) >= v110)
  {
    id v114 = v154;
    uint64_t v115 = v149;
    if ((v105 & 1) != 0)
    {
      unint64_t v116 = v157;
      if ((v106 & 1) == 0) {
        goto LABEL_141;
      }
    }

    else
    {
      sub_30664();
      uint64_t v115 = v149;
      id v114 = v154;
      unint64_t v116 = v157;
      if ((v111 & 1) == 0) {
        goto LABEL_141;
      }
    }

    goto LABEL_139;
  }

  sub_2F75C(v110, v105);
  unint64_t v112 = sub_19588(v12, v94);
  if ((v111 & 1) == (v113 & 1))
  {
    unint64_t v107 = v112;
    id v114 = v154;
    uint64_t v115 = v149;
    unint64_t v116 = v157;
    if ((v111 & 1) == 0)
    {
LABEL_141:
      v116[(v107 >> 6) + 8] |= 1LL << v107;
      unint64_t v117 = (uint64_t *)(v116[6] + 16 * v107);
      *unint64_t v117 = v12;
      v117[1] = v94;
      ((void (*)(unint64_t, char *, uint64_t *))v1)( v116[7] + *(void *)(v115 + 72) * v107,  v144,  v114);
      uint64_t v118 = v116[2];
      BOOL v40 = __OFADD__(v118, 1LL);
      uint64_t v119 = v118 + 1;
      if (v40) {
        goto LABEL_146;
      }
      v116[2] = v119;
      swift_bridgeObjectRetain(v94);
      goto LABEL_143;
    }

LABEL_139:
    (*(void (**)(unint64_t, char *, uint64_t *))(v115 + 40))( v116[7] + *(void *)(v115 + 72) * v107,  v144,  v114);
LABEL_143:
    unint64_t v9 = (unint64_t)v157;

    swift_bridgeObjectRelease(v94);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    uint64_t v1 = v104;
    id v84 = (char *)v151;
    goto LABEL_121;
  }

  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

uint64_t sub_29CFC(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (v4 < 0) {
    uint64_t v17 = *v1;
  }
  else {
    uint64_t v17 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*v1);
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_29;
  }
LABEL_5:
  uint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *uint64_t v1 = v4;
  uint64_t v5 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000LL) == 0 && (v4 & 0x4000000000000000LL) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v5 = 1LL;
  }

  uint64_t v9 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1LL, v4);
    swift_bridgeObjectRelease(*v1);
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8LL;
LABEL_15:
    uint64_t result = sub_30B44(v8 + 8LL * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0) {
      uint64_t v18 = v4;
    }
    else {
      uint64_t v18 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v4);
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }

  if (v11 < 1) {
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8LL));
  BOOL v13 = __OFADD__(v12, v11);
  uint64_t v14 = v12 + v11;
  if (!v13)
  {
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8LL)) = v14;
LABEL_19:
    uint64_t v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }

  __break(1u);
  return result;
}

uint64_t sub_29EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2A518(a1, a2, a3, (uint64_t)&unk_4DC18, (uint64_t)sub_34C04, (uint64_t)&unk_4DC30);
}

uint64_t sub_29F08(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_29F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2A518(a1, a2, a3, (uint64_t)&unk_4DB78, (uint64_t)sub_34B70, (uint64_t)&unk_4DB90);
}

uint64_t sub_29F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2A518(a1, a2, a3, (uint64_t)&unk_4DAD8, (uint64_t)sub_34B10, (uint64_t)&unk_4DAF0);
}

uint64_t sub_29F6C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v22 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))( v12,  enum case for DispatchQoS.QoSClass.background(_:),  v9);
  BOOL v13 = (void *)static OS_dispatch_queue.global(qos:)(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v14 = swift_allocObject(&unk_4DA88, 32LL, 7LL);
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = v1;
  aBlock[4] = sub_34B04;
  uint64_t v25 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_29F04;
  void aBlock[3] = &unk_4DAA0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain(a1);
  static DispatchQoS.unspecified.getter(v1);
  id v23 = _swiftEmptyArrayStorage;
  uint64_t v16 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v18 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v23, v17, v18, v3, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v8, v5, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v21);
  return swift_release(v25);
}

uint64_t sub_2A1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = sub_2A3BC(a1);
  uint64_t v9 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults;
  id v10 = *(id *)(a2 + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults);
  NSString v11 = String._bridgeToObjectiveC()();
  [v10 setObject:v11 forKey:@"settingsVersion"];

  id v12 = *(id *)(a2 + v9);
  sub_18140(&qword_56688);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  [v12 setObject:isa forKey:@"mouseProfiles"];

  uint64_t v14 = sub_1CBE4();
  uint64_t v15 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
  uint64_t v16 = static os_log_type_t.info.getter(v15);
  os_log_type_t v17 = v16;
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v16);
  if (os_log_type_enabled(v18, v17))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v18, v17, "Saving mouse profiles...", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

void *sub_2A3BC(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }

    uint64_t v4 = 0LL;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      id v7 = [v5 jsonObject];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v8 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
      uint64_t v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v7);
      specialized ContiguousArray._endMutation()(v9);
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_14:
    if (a1 < 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }

  return result;
}

uint64_t sub_2A4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2A518(a1, a2, a3, (uint64_t)&unk_4D9E8, (uint64_t)sub_34A7C, (uint64_t)&unk_4DA00);
}

uint64_t sub_2A518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  uint64_t v30 = a4;
  uint64_t v31 = a2;
  id v7 = v6;
  uint64_t v32 = a3;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v37 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  NSString v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  (*(void (**)(char *, void, uint64_t))(v16 + 104))( v18,  enum case for DispatchQoS.QoSClass.background(_:),  v15);
  uint64_t v19 = (void *)static OS_dispatch_queue.global(qos:)(v18);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v20 = (void *)swift_allocObject(v30, 48LL, 7LL);
  v20[2] = a1;
  v20[3] = v6;
  uint64_t v21 = v32;
  v20[4] = v31;
  v20[5] = v21;
  aBlock[4] = v33;
  BOOL v40 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_29F04;
  void aBlock[3] = v34;
  uint64_t v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain(a1);
  id v23 = v7;
  uint64_t v24 = swift_retain(v21);
  static DispatchQoS.unspecified.getter(v24);
  uint64_t v38 = _swiftEmptyArrayStorage;
  uint64_t v25 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v26 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v27 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v38, v26, v27, v9, v25);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v14, v11, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
  return swift_release(v40);
}

uint64_t sub_2A7A8( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v93 = a8;
  uint64_t v86 = a7;
  uint64_t v89 = a6;
  uint64_t v95 = a4;
  uint64_t v94 = a3;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v97 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v96 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v92 = type metadata accessor for Logger(0LL);
  uint64_t v91 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  char v90 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  aBlock[0] = _swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v48 = a1;
    }
    else {
      uint64_t v48 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v48);
  }

  else
  {
    uint64_t v20 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(a1);
  }

  uint64_t v99 = v16;
  uint64_t v100 = v14;
  uint64_t v98 = v17;
  if (v20)
  {
    if (v20 < 1)
    {
      __break(1u);
      goto LABEL_37;
    }

    uint64_t v88 = a2;
    for (uint64_t i = 0LL; i != v20; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      }
      else {
        id v23 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v24 = v23;
      id v25 = objc_msgSend(v23, "jsonObject", v86);

      if (v25)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v27 = *(void *)((char *)&dword_10 + (aBlock[0] & 0xFFFFFFFFFFFFFF8LL));
        unint64_t v26 = *(void *)((char *)&dword_18 + (aBlock[0] & 0xFFFFFFFFFFFFFF8LL));
        if (v27 >= v26 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1LL);
        }
        uint64_t v22 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v25);
        specialized Array._endMutation()(v22);
      }
    }

    swift_bridgeObjectRelease(a1);
    uint64_t v28 = (char *)aBlock[0];
    a2 = v88;
  }

  else
  {
    swift_bridgeObjectRelease(a1);
    uint64_t v28 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v31 = v30;
  id v32 = [a2 tombstones];
  uint64_t v33 = sub_18140(&qword_56620);
  uint64_t v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v32,  &type metadata for String,  v33,  &protocol witness table for String);

  uint64_t v35 = *(void *)(v34 + 16);
  uint64_t v88 = v28;
  if (v35)
  {
    unint64_t v36 = sub_19588(v29, v31);
    if ((v37 & 1) != 0)
    {
      uint64_t v17 = *(void *)(*(void *)(v34 + 56) + 8 * v36);
      swift_bridgeObjectRetain(v17);
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v34);
      aBlock[0] = _swiftEmptyArrayStorage;
      if (!((unint64_t)v17 >> 62))
      {
        uint64_t v38 = *(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8LL));
        uint64_t result = swift_bridgeObjectRetain(v17);
        if (v38)
        {
LABEL_20:
          uint64_t v87 = v13;
          if (v38 < 1)
          {
            __break(1u);
            return result;
          }

          for (uint64_t j = 0LL; j != v38; ++j)
          {
            if ((v17 & 0xC000000000000001LL) != 0) {
              id v42 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(j, v17);
            }
            else {
              id v42 = *(id *)(v17 + 8 * j + 32);
            }
            uint64_t v43 = v42;
            id v44 = objc_msgSend(v42, "jsonObject", v86);

            if (v44)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v46 = *(void *)((char *)&dword_10 + (aBlock[0] & 0xFFFFFFFFFFFFFF8LL));
              unint64_t v45 = *(void *)((char *)&dword_18 + (aBlock[0] & 0xFFFFFFFFFFFFFF8LL));
              if (v46 >= v45 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1LL);
              }
              uint64_t v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v46, v44);
              specialized Array._endMutation()(v41);
            }
          }

          swift_bridgeObjectRelease(v17);
          uint64_t v47 = (void *)aBlock[0];
          uint64_t v13 = v87;
          goto LABEL_42;
        }

LABEL_41:
        swift_bridgeObjectRelease(v17);
        uint64_t v47 = _swiftEmptyArrayStorage;
LABEL_42:
        swift_bridgeObjectRelease(v17);
        goto LABEL_43;
      }

  uint64_t result = swift_release(v8);
  void *v3 = v10;
  return result;
}

LABEL_37:
      if (v17 < 0) {
        uint64_t v49 = v17;
      }
      else {
        uint64_t v49 = v17 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v17);
      uint64_t result = _CocoaArrayWrapper.endIndex.getter(v49);
      uint64_t v38 = result;
      if (result) {
        goto LABEL_20;
      }
      goto LABEL_41;
    }
  }

  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v34);
  uint64_t v47 = _swiftEmptyArrayStorage;
LABEL_43:
  uint64_t v50 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults;
  id v51 =  objc_msgSend( *(id *)&a2[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults],  "stringForKey:",  @"settingsVersion",  v86);
  if (!v51) {
    goto LABEL_49;
  }
  uint64_t v52 = v51;
  uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
  uint64_t v55 = v54;

  uint64_t v56 = *(void *)&a2[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_preferencesVersion + 8];
  if (v53 == *(void *)&a2[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_preferencesVersion]
    && v55 == v56)
  {
    swift_bridgeObjectRelease(v55);
    goto LABEL_51;
  }

  char v58 = _stringCompareWithSmolCheck(_:_:expecting:)( v53,  v55,  *(void *)&a2[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_preferencesVersion],  v56,  0LL);
  swift_bridgeObjectRelease(v55);
  if ((v58 & 1) == 0)
  {
LABEL_49:
    id v59 = *(id *)&a2[v50];
    NSString v60 = String._bridgeToObjectiveC()();
    [v59 setObject:v60 forKey:@"settingsVersion"];
  }

LABEL_51:
  uint64_t v87 = a10;
  uint64_t v61 = sub_18140(&qword_566A8);
  uint64_t inited = swift_initStackObject(v61, v103);
  *(_OWORD *)(inited + 16) = xmmword_47C00;
  *(void *)(inited + 32) = 1635017060LL;
  *(void *)(inited + 40) = 0xE400000000000000LL;
  *(void *)(inited + 48) = v88;
  *(void *)(inited + 56) = 0x6E6F7473626D6F74LL;
  *(void *)(inited + 64) = 0xEA00000000007365LL;
  *(void *)(inited + 72) = v47;
  unint64_t v63 = sub_1DE08(inited, &qword_566B8);
  id v64 = *(id *)&a2[v50];
  sub_18140(&qword_566B0);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v63);
  [v64 setObject:isa forKey:v89];

  uint64_t v66 = sub_1CBE4();
  uint64_t v67 = v91;
  uint64_t v68 = v90;
  uint64_t v69 = v92;
  uint64_t v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 16))(v90, v66, v92);
  uint64_t v71 = static os_log_type_t.info.getter(v70);
  os_log_type_t v72 = v71;
  uint64_t v73 = (os_log_s *)Logger.logObject.getter(v71);
  if (os_log_type_enabled(v73, v72))
  {
    uint64_t v74 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v74 = 0;
    _os_log_impl(&dword_0, v73, v72, v86, v74, 2u);
    swift_slowDealloc(v74, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v69);
  sub_34D00(0LL, (unint64_t *)&qword_56510, &classRef_OS_dispatch_queue);
  uint64_t v75 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v76 = (void *)swift_allocObject(v93, 40LL, 7LL);
  uint64_t v77 = v95;
  v76[2] = v94;
  v76[3] = v77;
  v76[4] = a1;
  aBlock[4] = a9;
  char v102 = v76;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1BA68;
  void aBlock[3] = v87;
  uint64_t v78 = _Block_copy(aBlock);
  id v79 = v102;
  swift_bridgeObjectRetain(a1);
  swift_retain(v77);
  uint64_t v80 = swift_release(v79);
  unint64_t v81 = v96;
  static DispatchQoS.unspecified.getter(v80);
  aBlock[0] = _swiftEmptyArrayStorage;
  uint64_t v82 = sub_336DC( (unint64_t *)&qword_56270,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v83 = sub_18140((uint64_t *)&unk_56520);
  uint64_t v84 = sub_352B0( (unint64_t *)&qword_56280,  (uint64_t *)&unk_56520,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v85 = v99;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v83, v84, v13, v82);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v81, v85, v78);
  _Block_release(v78);

  (*(void (**)(char *, uint64_t))(v100 + 8))(v85, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v81, v98);
}

uint64_t sub_2AFDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v81 - v7;
  uint64_t v9 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v81 - v14;
  id v16 =  [*(id *)&v1[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"copilotFusedControllers"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v83 = v10;
    uint64_t v84 = v9;
    uint64_t v87 = v3;
    uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

    uint64_t v92 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v93 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v85 = v2;
    uint64_t v86 = v8;
    if (v19)
    {
      unint64_t v20 = sub_19588(1635017060LL, 0xE400000000000000LL);
      if ((v21 & 1) != 0)
      {
        sub_1AA0C(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v90);
        uint64_t v22 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
        if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v22, 6LL) & 1) != 0)
        {
          id v81 = *(id *)&v89[0];
          uint64_t v82 = v1;
          uint64_t v23 = NSArray.makeIterator()();
          NSFastEnumerationIterator.next()(&v90, v23);
          while (*((void *)&v91 + 1))
          {
            sub_1AA48(&v90, v89);
            uint64_t v26 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
            uint64_t v25 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v26, 6LL);
            if ((v25 & 1) != 0)
            {
              unint64_t v27 = v88;
              id v28 = [objc_allocWithZone(GCSCopilotFusedController) initWithJSONObject:v88];
              if (v28)
              {
                id v29 = v28;
                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v31 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                unint64_t v30 = *(void *)((char *)&dword_18 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                if (v31 >= v30 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v30 > 1,  v31 + 1,  1LL);
                }
                uint64_t v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
                specialized Array._endMutation()(v24);
              }
            }

            NSFastEnumerationIterator.next()(&v90, v25);
          }

          (*(void (**)(char *, uint64_t))(v83 + 8))(v15, v84);

          uint64_t v2 = v85;
          uint64_t v1 = v82;
        }
      }
    }

    if (*(void *)(v18 + 16) && (unint64_t v40 = sub_19588(0x6E6F7473626D6F74LL, 0xEA00000000007365LL), (v41 & 1) != 0))
    {
      sub_1AA0C(*(void *)(v18 + 56) + 32 * v40, (uint64_t)&v90);
    }

    else
    {
      __int128 v90 = 0u;
      __int128 v91 = 0u;
    }

    swift_bridgeObjectRelease(v18);
    if (*((void *)&v91 + 1))
    {
      uint64_t v42 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
      if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v42, 6LL) & 1) != 0)
      {
        id v81 = *(id *)&v89[0];
        uint64_t v82 = v1;
        uint64_t v43 = NSArray.makeIterator()();
        NSFastEnumerationIterator.next()(&v90, v43);
        while (*((void *)&v91 + 1))
        {
          sub_1AA48(&v90, v89);
          uint64_t v46 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
          uint64_t v45 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v46, 6LL);
          if ((v45 & 1) != 0)
          {
            uint64_t v47 = v88;
            id v48 = [objc_allocWithZone(GCSTombstone) initWithJSONObject:v88];
            if (v48)
            {
              id v49 = v48;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v51 = *(void *)((char *)&dword_10 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              unint64_t v50 = *(void *)((char *)&dword_18 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              if (v51 >= v50 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v50 > 1, v51 + 1, 1LL);
              }
              uint64_t v44 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v49);
              specialized Array._endMutation()(v44);
            }
          }

          NSFastEnumerationIterator.next()(&v90, v45);
        }

        (*(void (**)(char *, uint64_t))(v83 + 8))(v13, v84);

        uint64_t v2 = v85;
        uint64_t v1 = v82;
      }
    }

    else
    {
      sub_34D38((uint64_t)&v90, &qword_561F0);
    }

    unint64_t v52 = v93;
    uint64_t v84 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v52);
    [v1 setCopilotFusedControllers:isa];

    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"copilotFusedControllers");
    uint64_t v56 = v55;
    uint64_t v57 = v92;
    id v58 = [v1 tombstones];
    uint64_t v59 = sub_18140(&qword_56620);
    NSString v60 = v1;
    uint64_t v61 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v58,  &type metadata for String,  v59,  &protocol witness table for String);

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v61);
    *(void *)&__int128 v90 = v61;
    sub_2FF60(v57, v54, v56, isUniquelyReferenced_nonNull_native);
    uint64_t v63 = v90;
    swift_bridgeObjectRelease(v56);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v64 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v63);
    [v60 setTombstones:v64];

    uint64_t v65 = sub_1CBE4();
    uint64_t v67 = v86;
    uint64_t v66 = v87;
    uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 16))(v86, v65, v2);
    os_log_type_t v69 = static os_log_type_t.info.getter(v68);
    id v70 = v60;
    uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
    if (os_log_type_enabled(v71, v69))
    {
      os_log_type_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v73 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v90 = v73;
      *(_DWORD *)os_log_type_t v72 = 136315138;
      id v74 = [v70 copilotFusedControllers];
      uint64_t v75 = v84;
      uint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v74, v84);

      uint64_t v77 = Array.description.getter(v76, v75);
      unint64_t v79 = v78;
      swift_bridgeObjectRelease(v76);
      *(void *)&v89[0] = sub_1C304(v77, v79, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v89, (char *)v89 + 8, v72 + 4);

      swift_bridgeObjectRelease(v79);
      _os_log_impl(&dword_0, v71, v69, "Loaded copilot fused controllers = %s", v72, 0xCu);
      swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1LL, -1LL);
      swift_slowDealloc(v72, -1LL, -1LL);

      return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v86, v85);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v66 + 8);
    id v39 = v67;
  }

  else
  {
    uint64_t v32 = sub_1CBE4();
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v32, v2);
    uint64_t v34 = static os_log_type_t.info.getter(v33);
    os_log_type_t v35 = v34;
    unint64_t v36 = (os_log_s *)Logger.logObject.getter(v34);
    if (os_log_type_enabled(v36, v35))
    {
      char v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v37 = 0;
      _os_log_impl(&dword_0, v36, v35, "Unable to load copilot fused controllers data", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    id v39 = v6;
  }

  return v38(v39, v2);
}

uint64_t sub_2B7F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v81 - v7;
  uint64_t v9 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v81 - v14;
  id v16 =  [*(id *)&v1[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"controllers"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v83 = v10;
    uint64_t v84 = v9;
    uint64_t v87 = v3;
    uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

    uint64_t v92 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v93 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v85 = v2;
    uint64_t v86 = v8;
    if (v19)
    {
      unint64_t v20 = sub_19588(1635017060LL, 0xE400000000000000LL);
      if ((v21 & 1) != 0)
      {
        sub_1AA0C(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v90);
        uint64_t v22 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
        if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v22, 6LL) & 1) != 0)
        {
          id v81 = *(id *)&v89[0];
          uint64_t v82 = v1;
          uint64_t v23 = NSArray.makeIterator()();
          NSFastEnumerationIterator.next()(&v90, v23);
          while (*((void *)&v91 + 1))
          {
            sub_1AA48(&v90, v89);
            uint64_t v26 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
            uint64_t v25 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v26, 6LL);
            if ((v25 & 1) != 0)
            {
              unint64_t v27 = v88;
              id v28 = [objc_allocWithZone(GCSController) initWithJSONObject:v88];
              if (v28)
              {
                id v29 = v28;
                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v31 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                unint64_t v30 = *(void *)((char *)&dword_18 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                if (v31 >= v30 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v30 > 1,  v31 + 1,  1LL);
                }
                uint64_t v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
                specialized Array._endMutation()(v24);
              }
            }

            NSFastEnumerationIterator.next()(&v90, v25);
          }

          (*(void (**)(char *, uint64_t))(v83 + 8))(v15, v84);

          uint64_t v2 = v85;
          uint64_t v1 = v82;
        }
      }
    }

    if (*(void *)(v18 + 16) && (unint64_t v40 = sub_19588(0x6E6F7473626D6F74LL, 0xEA00000000007365LL), (v41 & 1) != 0))
    {
      sub_1AA0C(*(void *)(v18 + 56) + 32 * v40, (uint64_t)&v90);
    }

    else
    {
      __int128 v90 = 0u;
      __int128 v91 = 0u;
    }

    swift_bridgeObjectRelease(v18);
    if (*((void *)&v91 + 1))
    {
      uint64_t v42 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
      if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v42, 6LL) & 1) != 0)
      {
        id v81 = *(id *)&v89[0];
        uint64_t v82 = v1;
        uint64_t v43 = NSArray.makeIterator()();
        NSFastEnumerationIterator.next()(&v90, v43);
        while (*((void *)&v91 + 1))
        {
          sub_1AA48(&v90, v89);
          uint64_t v46 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
          uint64_t v45 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v46, 6LL);
          if ((v45 & 1) != 0)
          {
            uint64_t v47 = v88;
            id v48 = [objc_allocWithZone(GCSTombstone) initWithJSONObject:v88];
            if (v48)
            {
              id v49 = v48;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v51 = *(void *)((char *)&dword_10 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              unint64_t v50 = *(void *)((char *)&dword_18 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              if (v51 >= v50 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v50 > 1, v51 + 1, 1LL);
              }
              uint64_t v44 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v49);
              specialized Array._endMutation()(v44);
            }
          }

          NSFastEnumerationIterator.next()(&v90, v45);
        }

        (*(void (**)(char *, uint64_t))(v83 + 8))(v13, v84);

        uint64_t v2 = v85;
        uint64_t v1 = v82;
      }
    }

    else
    {
      sub_34D38((uint64_t)&v90, &qword_561F0);
    }

    unint64_t v52 = v93;
    uint64_t v84 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v52);
    [v1 setAllControllers:isa];

    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"controllers");
    uint64_t v56 = v55;
    uint64_t v57 = v92;
    id v58 = [v1 tombstones];
    uint64_t v59 = sub_18140(&qword_56620);
    NSString v60 = v1;
    uint64_t v61 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v58,  &type metadata for String,  v59,  &protocol witness table for String);

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v61);
    *(void *)&__int128 v90 = v61;
    sub_2FF60(v57, v54, v56, isUniquelyReferenced_nonNull_native);
    uint64_t v63 = v90;
    swift_bridgeObjectRelease(v56);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v64 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v63);
    [v60 setTombstones:v64];

    uint64_t v65 = sub_1CBE4();
    uint64_t v67 = v86;
    uint64_t v66 = v87;
    uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 16))(v86, v65, v2);
    os_log_type_t v69 = static os_log_type_t.info.getter(v68);
    id v70 = v60;
    uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
    if (os_log_type_enabled(v71, v69))
    {
      os_log_type_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v73 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v90 = v73;
      *(_DWORD *)os_log_type_t v72 = 136315138;
      id v74 = [v70 allControllers];
      uint64_t v75 = v84;
      uint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v74, v84);

      uint64_t v77 = Array.description.getter(v76, v75);
      unint64_t v79 = v78;
      swift_bridgeObjectRelease(v76);
      *(void *)&v89[0] = sub_1C304(v77, v79, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v89, (char *)v89 + 8, v72 + 4);

      swift_bridgeObjectRelease(v79);
      _os_log_impl(&dword_0, v71, v69, "Loaded controllers = %s", v72, 0xCu);
      swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1LL, -1LL);
      swift_slowDealloc(v72, -1LL, -1LL);

      return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v86, v85);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v66 + 8);
    id v39 = v67;
  }

  else
  {
    uint64_t v32 = sub_1CBE4();
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v32, v2);
    uint64_t v34 = static os_log_type_t.info.getter(v33);
    os_log_type_t v35 = v34;
    unint64_t v36 = (os_log_s *)Logger.logObject.getter(v34);
    if (os_log_type_enabled(v36, v35))
    {
      char v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v37 = 0;
      _os_log_impl(&dword_0, v36, v35, "Unable to load controllers data", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    id v39 = v6;
  }

  return v38(v39, v2);
}

uint64_t sub_2C00C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v81 - v7;
  uint64_t v9 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v81 - v14;
  id v16 =  [*(id *)&v1[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"games"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v83 = v10;
    uint64_t v84 = v9;
    uint64_t v87 = v3;
    uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

    uint64_t v92 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v93 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v85 = v2;
    uint64_t v86 = v8;
    if (v19)
    {
      unint64_t v20 = sub_19588(1635017060LL, 0xE400000000000000LL);
      if ((v21 & 1) != 0)
      {
        sub_1AA0C(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v90);
        uint64_t v22 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
        if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v22, 6LL) & 1) != 0)
        {
          id v81 = *(id *)&v89[0];
          uint64_t v82 = v1;
          uint64_t v23 = NSArray.makeIterator()();
          NSFastEnumerationIterator.next()(&v90, v23);
          while (*((void *)&v91 + 1))
          {
            sub_1AA48(&v90, v89);
            uint64_t v26 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
            uint64_t v25 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v26, 6LL);
            if ((v25 & 1) != 0)
            {
              unint64_t v27 = v88;
              id v28 = [objc_allocWithZone(GCSGame) initWithJSONObject:v88];
              if (v28)
              {
                id v29 = v28;
                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v31 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                unint64_t v30 = *(void *)((char *)&dword_18 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                if (v31 >= v30 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v30 > 1,  v31 + 1,  1LL);
                }
                uint64_t v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
                specialized Array._endMutation()(v24);
              }
            }

            NSFastEnumerationIterator.next()(&v90, v25);
          }

          (*(void (**)(char *, uint64_t))(v83 + 8))(v15, v84);

          uint64_t v2 = v85;
          uint64_t v1 = v82;
        }
      }
    }

    if (*(void *)(v18 + 16) && (unint64_t v40 = sub_19588(0x6E6F7473626D6F74LL, 0xEA00000000007365LL), (v41 & 1) != 0))
    {
      sub_1AA0C(*(void *)(v18 + 56) + 32 * v40, (uint64_t)&v90);
    }

    else
    {
      __int128 v90 = 0u;
      __int128 v91 = 0u;
    }

    swift_bridgeObjectRelease(v18);
    if (*((void *)&v91 + 1))
    {
      uint64_t v42 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
      if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v42, 6LL) & 1) != 0)
      {
        id v81 = *(id *)&v89[0];
        uint64_t v82 = v1;
        uint64_t v43 = NSArray.makeIterator()();
        NSFastEnumerationIterator.next()(&v90, v43);
        while (*((void *)&v91 + 1))
        {
          sub_1AA48(&v90, v89);
          uint64_t v46 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
          uint64_t v45 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v46, 6LL);
          if ((v45 & 1) != 0)
          {
            uint64_t v47 = v88;
            id v48 = [objc_allocWithZone(GCSTombstone) initWithJSONObject:v88];
            if (v48)
            {
              id v49 = v48;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v51 = *(void *)((char *)&dword_10 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              unint64_t v50 = *(void *)((char *)&dword_18 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              if (v51 >= v50 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v50 > 1, v51 + 1, 1LL);
              }
              uint64_t v44 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v49);
              specialized Array._endMutation()(v44);
            }
          }

          NSFastEnumerationIterator.next()(&v90, v45);
        }

        (*(void (**)(char *, uint64_t))(v83 + 8))(v13, v84);

        uint64_t v2 = v85;
        uint64_t v1 = v82;
      }
    }

    else
    {
      sub_34D38((uint64_t)&v90, &qword_561F0);
    }

    unint64_t v52 = v93;
    uint64_t v84 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v52);
    [v1 setGames:isa];

    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"games");
    uint64_t v56 = v55;
    uint64_t v57 = v92;
    id v58 = [v1 tombstones];
    uint64_t v59 = sub_18140(&qword_56620);
    NSString v60 = v1;
    uint64_t v61 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v58,  &type metadata for String,  v59,  &protocol witness table for String);

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v61);
    *(void *)&__int128 v90 = v61;
    sub_2FF60(v57, v54, v56, isUniquelyReferenced_nonNull_native);
    uint64_t v63 = v90;
    swift_bridgeObjectRelease(v56);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v64 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v63);
    [v60 setTombstones:v64];

    uint64_t v65 = sub_1CBE4();
    uint64_t v67 = v86;
    uint64_t v66 = v87;
    uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 16))(v86, v65, v2);
    os_log_type_t v69 = static os_log_type_t.info.getter(v68);
    id v70 = v60;
    uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
    if (os_log_type_enabled(v71, v69))
    {
      os_log_type_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v73 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v90 = v73;
      *(_DWORD *)os_log_type_t v72 = 136315138;
      id v74 = [v70 games];
      uint64_t v75 = v84;
      uint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v74, v84);

      uint64_t v77 = Array.description.getter(v76, v75);
      unint64_t v79 = v78;
      swift_bridgeObjectRelease(v76);
      *(void *)&v89[0] = sub_1C304(v77, v79, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v89, (char *)v89 + 8, v72 + 4);

      swift_bridgeObjectRelease(v79);
      _os_log_impl(&dword_0, v71, v69, "Loaded games = %s", v72, 0xCu);
      swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1LL, -1LL);
      swift_slowDealloc(v72, -1LL, -1LL);

      return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v86, v85);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v66 + 8);
    id v39 = v67;
  }

  else
  {
    uint64_t v32 = sub_1CBE4();
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v32, v2);
    uint64_t v34 = static os_log_type_t.info.getter(v33);
    os_log_type_t v35 = v34;
    unint64_t v36 = (os_log_s *)Logger.logObject.getter(v34);
    if (os_log_type_enabled(v36, v35))
    {
      char v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v37 = 0;
      _os_log_impl(&dword_0, v36, v35, "Unable to load games data", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    id v39 = v6;
  }

  return v38(v39, v2);
}

uint64_t sub_2C824()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v81 - v7;
  uint64_t v9 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v81 - v14;
  id v16 =  [*(id *)&v1[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"profiles"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v83 = v10;
    uint64_t v84 = v9;
    uint64_t v87 = v3;
    uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

    uint64_t v92 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v93 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v85 = v2;
    uint64_t v86 = v8;
    if (v19)
    {
      unint64_t v20 = sub_19588(1635017060LL, 0xE400000000000000LL);
      if ((v21 & 1) != 0)
      {
        sub_1AA0C(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v90);
        uint64_t v22 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
        if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v22, 6LL) & 1) != 0)
        {
          id v81 = *(id *)&v89[0];
          uint64_t v82 = v1;
          uint64_t v23 = NSArray.makeIterator()();
          NSFastEnumerationIterator.next()(&v90, v23);
          while (*((void *)&v91 + 1))
          {
            sub_1AA48(&v90, v89);
            uint64_t v26 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
            uint64_t v25 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v26, 6LL);
            if ((v25 & 1) != 0)
            {
              unint64_t v27 = v88;
              id v28 = [objc_allocWithZone(GCSProfile) initWithJSONObject:v88];
              if (v28)
              {
                id v29 = v28;
                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                unint64_t v31 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                unint64_t v30 = *(void *)((char *)&dword_18 + (v93 & 0xFFFFFFFFFFFFFF8LL));
                if (v31 >= v30 >> 1) {
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v30 > 1,  v31 + 1,  1LL);
                }
                uint64_t v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
                specialized Array._endMutation()(v24);
              }
            }

            NSFastEnumerationIterator.next()(&v90, v25);
          }

          (*(void (**)(char *, uint64_t))(v83 + 8))(v15, v84);

          uint64_t v2 = v85;
          uint64_t v1 = v82;
        }
      }
    }

    if (*(void *)(v18 + 16) && (unint64_t v40 = sub_19588(0x6E6F7473626D6F74LL, 0xEA00000000007365LL), (v41 & 1) != 0))
    {
      sub_1AA0C(*(void *)(v18 + 56) + 32 * v40, (uint64_t)&v90);
    }

    else
    {
      __int128 v90 = 0u;
      __int128 v91 = 0u;
    }

    swift_bridgeObjectRelease(v18);
    if (*((void *)&v91 + 1))
    {
      uint64_t v42 = sub_34D00(0LL, &qword_56690, &classRef_NSArray);
      if ((swift_dynamicCast(v89, &v90, (char *)&type metadata for Any + 8, v42, 6LL) & 1) != 0)
      {
        id v81 = *(id *)&v89[0];
        uint64_t v82 = v1;
        uint64_t v43 = NSArray.makeIterator()();
        NSFastEnumerationIterator.next()(&v90, v43);
        while (*((void *)&v91 + 1))
        {
          sub_1AA48(&v90, v89);
          uint64_t v46 = sub_34D00(0LL, &qword_56698, &classRef_NSDictionary);
          uint64_t v45 = swift_dynamicCast(&v88, v89, (char *)&type metadata for Any + 8, v46, 6LL);
          if ((v45 & 1) != 0)
          {
            uint64_t v47 = v88;
            id v48 = [objc_allocWithZone(GCSTombstone) initWithJSONObject:v88];
            if (v48)
            {
              id v49 = v48;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v51 = *(void *)((char *)&dword_10 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              unint64_t v50 = *(void *)((char *)&dword_18 + (v92 & 0xFFFFFFFFFFFFFF8LL));
              if (v51 >= v50 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v50 > 1, v51 + 1, 1LL);
              }
              uint64_t v44 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v49);
              specialized Array._endMutation()(v44);
            }
          }

          NSFastEnumerationIterator.next()(&v90, v45);
        }

        (*(void (**)(char *, uint64_t))(v83 + 8))(v13, v84);

        uint64_t v2 = v85;
        uint64_t v1 = v82;
      }
    }

    else
    {
      sub_34D38((uint64_t)&v90, &qword_561F0);
    }

    unint64_t v52 = v93;
    uint64_t v84 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v52);
    [v1 setProfiles:isa];

    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"profiles");
    uint64_t v56 = v55;
    uint64_t v57 = v92;
    id v58 = [v1 tombstones];
    uint64_t v59 = sub_18140(&qword_56620);
    NSString v60 = v1;
    uint64_t v61 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v58,  &type metadata for String,  v59,  &protocol witness table for String);

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v61);
    *(void *)&__int128 v90 = v61;
    sub_2FF60(v57, v54, v56, isUniquelyReferenced_nonNull_native);
    uint64_t v63 = v90;
    swift_bridgeObjectRelease(v56);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v64 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v63);
    [v60 setTombstones:v64];

    uint64_t v65 = sub_1CBE4();
    uint64_t v67 = v86;
    uint64_t v66 = v87;
    uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 16))(v86, v65, v2);
    os_log_type_t v69 = static os_log_type_t.info.getter(v68);
    id v70 = v60;
    uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
    if (os_log_type_enabled(v71, v69))
    {
      os_log_type_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v73 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v90 = v73;
      *(_DWORD *)os_log_type_t v72 = 136315138;
      id v74 = [v70 profiles];
      uint64_t v75 = v84;
      uint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v74, v84);

      uint64_t v77 = Array.description.getter(v76, v75);
      unint64_t v79 = v78;
      swift_bridgeObjectRelease(v76);
      *(void *)&v89[0] = sub_1C304(v77, v79, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v89, (char *)v89 + 8, v72 + 4);

      swift_bridgeObjectRelease(v79);
      _os_log_impl(&dword_0, v71, v69, "Loaded profiles = %s", v72, 0xCu);
      swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1LL, -1LL);
      swift_slowDealloc(v72, -1LL, -1LL);

      return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v86, v85);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v66 + 8);
    id v39 = v67;
  }

  else
  {
    uint64_t v32 = sub_1CBE4();
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v32, v2);
    uint64_t v34 = static os_log_type_t.info.getter(v33);
    os_log_type_t v35 = v34;
    unint64_t v36 = (os_log_s *)Logger.logObject.getter(v34);
    if (os_log_type_enabled(v36, v35))
    {
      char v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v37 = 0;
      _os_log_impl(&dword_0, v36, v35, "Unable to load profiles data", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    uint64_t v38 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    id v39 = v6;
  }

  return v38(v39, v2);
}

void sub_2D03C()
{
  id v1 =  [*(id *)&v0[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] arrayForKey:@"mouseProfiles"];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, (char *)&type metadata for Any + 8);

    unint64_t v18 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      uint64_t v15 = v3;
      uint64_t v5 = v3 + 32;
      do
      {
        sub_1AA0C(v5, (uint64_t)v17);
        uint64_t v7 = sub_18140(&qword_56688);
        if ((swift_dynamicCast(&v16, v17, (char *)&type metadata for Any + 8, v7, 6LL) & 1) != 0)
        {
          uint64_t v8 = v16;
          id v9 = objc_msgSend(objc_allocWithZone(GCSMouseProfile), "initWithJSONObject:", v16, v15);
          if (v9)
          {
            id v10 = v9;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v12 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8LL));
            unint64_t v11 = *(void *)((char *)&dword_18 + (v18 & 0xFFFFFFFFFFFFFF8LL));
            if (v12 >= v11 >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1LL);
            }
            uint64_t v6 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
            specialized Array._endMutation()(v6);
          }

          swift_unknownObjectRelease(v8);
        }

        v5 += 32LL;
        --v4;
      }

      while (v4);
      swift_bridgeObjectRelease(v15);
      uint64_t v13 = (void *)v18;
    }

    else
    {
      swift_bridgeObjectRelease(v3);
      uint64_t v13 = _swiftEmptyArrayStorage;
    }

    sub_34D00(0LL, &qword_56530, &classRef_GCSMouseProfile);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
    [v0 setMouseProfiles:isa];
  }

uint64_t sub_2D220()
{
  unint64_t v1 = sub_1DE08((uint64_t)_swiftEmptyArrayStorage, &qword_566A0);
  sub_18140(&qword_56620);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  [v0 setTombstones:isa];

  sub_2B7F4();
  sub_2C824();
  sub_2D03C();
  sub_2C00C();
  sub_2AFDC();
  uint64_t v3 = OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults;
  id v4 =  [*(id *)&v0[OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults] objectForKey:@"bluetoothPrefsMenuLongPressAction"];
  if (v4)
  {
    id v5 = v4;
    _bridgeAnyObjectToAny(_:)(&v20, v4);
    swift_unknownObjectRelease(v5);
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
  }

  sub_34A34((uint64_t)&v20, (uint64_t)v22, &qword_561F0);
  if (v23)
  {
  }

  else
  {
    sub_34D38((uint64_t)v22, &qword_561F0);
  }

  uint64_t v6 = *(void **)&v0[v3];
  swift_beginAccess(&qword_563B0, v19, 0LL, 0LL);
  uint64_t v7 = off_563B8;
  id v8 = v6;
  swift_bridgeObjectRetain(v7);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    _bridgeAnyObjectToAny(_:)(&v20, v10);
    swift_unknownObjectRelease(v10);
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
  }

  sub_34A34((uint64_t)&v20, (uint64_t)v22, &qword_561F0);
  if (v23)
  {
  }

  else
  {
    sub_34D38((uint64_t)v22, &qword_561F0);
  }

  unint64_t v11 = *(void **)&v0[v3];
  swift_beginAccess(&qword_563C0, v18, 0LL, 0LL);
  unint64_t v12 = off_563C8;
  id v13 = v11;
  swift_bridgeObjectRetain(v12);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  id v15 = [v13 objectForKey:v14];

  if (v15)
  {
    _bridgeAnyObjectToAny(_:)(&v20, v15);
    swift_unknownObjectRelease(v15);
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
  }

  sub_34A34((uint64_t)&v20, (uint64_t)v22, &qword_561F0);
  if (!v23) {
    return sub_34D38((uint64_t)v22, &qword_561F0);
  }
  uint64_t result = swift_dynamicCast(&v17, v22, (char *)&type metadata for Any + 8, &type metadata for Double, 6LL);
  if ((result & 1) != 0) {
    return (uint64_t)[v0 setThumbstickScrollingSpeed:v17];
  }
  return result;
}

uint64_t sub_2D580()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v6 =  [*(id *)((char *)v1 + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults) stringForKey:@"settingsVersion"];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v10 = v9;

    if (v8 == 0x302E302E30LL && v10 == 0xE500000000000000LL)
    {
      swift_bridgeObjectRelease(v10);
    }

    else
    {
      char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, 0x302E302E30LL, 0xE500000000000000LL, 0LL);
      swift_bridgeObjectRelease(v10);
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = sub_2D220();
        return (*(uint64_t (**)(uint64_t))&stru_248.segname[(swift_isaMask & *v1) + 16])(v13);
      }
    }
  }

  uint64_t v14 = sub_1CBE4();
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
  uint64_t v16 = static os_log_type_t.error.getter(v15);
  os_log_type_t v17 = v16;
  unint64_t v18 = (os_log_s *)Logger.logObject.getter(v16);
  if (os_log_type_enabled(v18, v17))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v18, v17, "Saved data is not compatible. Resetting prefs store.", v19, 2u);
    swift_slowDealloc(v19, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v20 = sub_1DE08((uint64_t)_swiftEmptyArrayStorage, &qword_566A0);
  sub_18140(&qword_56620);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v20);
  [v1 setTombstones:isa];

  sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  Class v22 = Array._bridgeToObjectiveC()().super.isa;
  [v1 setAllControllers:v22];

  uint64_t v23 = sub_18140(&qword_56430);
  uint64_t v24 = swift_allocObject(v23, 40LL, 7LL);
  __int128 v34 = xmmword_47BF0;
  *(_OWORD *)(v24 + 16) = xmmword_47BF0;
  id v25 = [(id)objc_opt_self(GCSProfile) defaultProfile];
  *(void *)(v24 + 32) = v25;
  uint64_t v35 = v24;
  specialized Array._endMutation()(v25);
  uint64_t v26 = v35;
  sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  Class v27 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  [v1 setProfiles:v27];

  uint64_t v28 = swift_allocObject(v23, 40LL, 7LL);
  *(_OWORD *)(v28 + 16) = v34;
  id v29 = [(id)objc_opt_self(GCSGame) defaultGame];
  *(void *)(v28 + 32) = v29;
  uint64_t v35 = v28;
  specialized Array._endMutation()(v29);
  uint64_t v30 = v35;
  sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  Class v31 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v30);
  [v1 setGames:v31];

  sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  Class v32 = Array._bridgeToObjectiveC()().super.isa;
  [v1 setCopilotFusedControllers:v32];

  return (*(uint64_t (**)(uint64_t))&stru_248.segname[(swift_isaMask & *v1) + 16])(v13);
}

uint64_t sub_2D974@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for GCSPreferencesStore(0LL);
  uint64_t result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_2D9B0(uint64_t a1, uint64_t a2)
{
  return sub_2DC04(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_2D9C4(uint64_t a1, uint64_t a2)
{
  return sub_2DC04(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_2D9D4(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_2DA4C(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_2DACC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_2DB14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_2DB58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2DB80(uint64_t a1)
{
  uint64_t v2 = sub_336DC( &qword_56548,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_48248);
  uint64_t v3 = sub_336DC( &qword_56618,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_4819C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_2DC04(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_2DC40(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_2DC80(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_2DCF0(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

unint64_t sub_2DD78(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_2DDE4(a1, v7);
}

unint64_t sub_2DDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      uint64_t v14 = sub_336DC( &qword_56708,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

void *sub_2DF24(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v4 = _swiftEmptyArrayStorage;
    }

    else
    {
      uint64_t v3 = sub_18140(&qword_56430);
      uint64_t v4 = (void *)swift_allocObject(v3, 8 * v2 + 32, 7LL);
      int64_t v5 = j__malloc_size_1(v4);
      uint64_t v6 = v5 - 32;
      if (v5 < 32) {
        uint64_t v6 = v5 - 25;
      }
      _OWORD v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }

    swift_bridgeObjectRetain(v1);
    uint64_t v7 = sub_30928((unint64_t)(v4 + 4), v2, v1);
    uint64_t v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    if (v1 < 0) {
      uint64_t v9 = v1;
    }
    else {
      uint64_t v9 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }

  return v4;
}

uint64_t sub_2E018(void **__src, void **a2, unint64_t a3, id *__dst, void *a5)
{
  int64_t v5 = __dst;
  uint64_t v7 = a2;
  uint64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = (char *)a2 - (char *)__src + 7;
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 7;
  uint64_t v14 = v13 >> 3;
  uint64_t v46 = __src;
  uint64_t v45 = __dst;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      if (__dst != a2 || &a2[v14] <= __dst) {
        memmove(__dst, a2, 8 * v14);
      }
      id v25 = &v5[v14];
      uint64_t v44 = v25;
      uint64_t v46 = v7;
      if (v8 < v7 && v12 >= 8)
      {
        uint64_t v26 = (void **)(a3 - 8);
        Class v27 = v7;
        uint64_t v38 = v5;
        id v39 = v8;
        while (1)
        {
          unint64_t v28 = (unint64_t)v25;
          id v29 = v25 - 1;
          uint64_t v43 = *(v25 - 1);
          uint64_t v30 = *--v27;
          id v42 = v30;
          Class v31 = v43;
          id v32 = v30;
          char v33 = sub_21628(&v43, &v42, a5);
          if (v41) {
            break;
          }
          char v34 = v33;
          uint64_t v35 = v26 + 1;

          if ((v34 & 1) != 0)
          {
            if (v35 != v7 || v26 >= v7) {
              *uint64_t v26 = *v27;
            }
            uint64_t v46 = v27;
            unint64_t v36 = v38;
            id v25 = (id *)v28;
            if (v27 <= v39) {
              goto LABEL_48;
            }
          }

          else
          {
            uint64_t v44 = v29;
            Class v27 = v7;
            id v25 = v29;
            unint64_t v36 = v38;
            if (v7 <= v39) {
              goto LABEL_48;
            }
          }

          --v26;
          uint64_t v7 = v27;
          if (v25 <= v36) {
            goto LABEL_48;
          }
        }
      }

      goto LABEL_48;
    }
  }

  else if (v9 >= -7)
  {
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, 8 * v11);
    }
    char v15 = &v5[v11];
    uint64_t v44 = v15;
    if ((unint64_t)v7 < a3 && v9 >= 8)
    {
      while (1)
      {
        uint64_t v16 = v8;
        uint64_t v43 = *v7;
        uint64_t v17 = v5;
        id v42 = *v5;
        id v18 = v42;
        uint64_t v19 = v43;
        id v20 = v18;
        char v21 = sub_21628(&v43, &v42, a5);
        if (v41) {
          break;
        }
        char v22 = v21;

        if ((v22 & 1) != 0)
        {
          uint64_t v23 = v7 + 1;
          uint64_t v24 = v16;
          if (v16 < v7 || v16 >= v23 || v16 != v7) {
            char *v16 = *v7;
          }
          int64_t v5 = v17;
        }

        else
        {
          uint64_t v24 = v16;
          if (v16 != v17) {
            char *v16 = *v17;
          }
          int64_t v5 = v17 + 1;
          uint64_t v45 = v17 + 1;
          uint64_t v23 = v7;
        }

        uint64_t v8 = v24 + 1;
        uint64_t v46 = v8;
        if (v5 < v15)
        {
          uint64_t v7 = v23;
        }

        goto LABEL_48;
      }
    }

LABEL_48:
    sub_2E44C((void **)&v46, (const void **)&v45, &v44);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_2E354(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_18140(&qword_56718);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size_1(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  char v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_2E44C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7]) {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }

  return result;
}

char *sub_2E4F4(uint64_t a1)
{
  return sub_2E354(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2E508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_19588(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v12 = *v4;
    uint64_t v19 = *v4;
    uint64_t *v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_30664();
      uint64_t v12 = v19;
    }

    swift_bridgeObjectRelease(*(void *)(*(void *)(v12 + 48) + 16 * v9 + 8));
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = type metadata accessor for UUID(0LL);
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v13 + *(void *)(v15 + 72) * v9, v14);
    sub_2FD64(v9, v12);
    uint64_t v16 = *v4;
    uint64_t *v4 = v12;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a3, 0LL, 1LL, v14);
  }

  else
  {
    uint64_t v18 = type metadata accessor for UUID(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))( a3,  1LL,  1LL,  v18);
  }

uint64_t sub_2E638(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v24, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0LL;
    }

    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v19 = (void *)(v11 + 16 * v10);
      uint64_t v20 = v19[1];
      BOOL v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0LL) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  void *v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_2EAC0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

Swift::Int sub_2E7E4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_18140((uint64_t *)&unk_566F8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    id v32 = v2;
    char v33 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v13 = 0LL;
    while (1)
    {
      if (v9)
      {
        unint64_t v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v10) {
          goto LABEL_36;
        }
        unint64_t v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v19 = v33[v13];
          if (!v19)
          {
            int64_t v13 = v18 + 2;
            if (v18 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v19 = v33[v13];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v32;
                uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v33 = -1LL << v31;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v13 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v33[v13];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v20;
            }
          }
        }

LABEL_26:
        unint64_t v9 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      BOOL v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      Swift::Int result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0LL;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      uint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      *uint64_t v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    int64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    BOOL v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    Swift::Int result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    uint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    *uint64_t v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v13 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

  Swift::Int result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  Swift::Int result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_2EAC0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_2E7E4(v11);
  }

  else
  {
    if (v10 > v9)
    {
      Swift::Int result = (uint64_t)sub_2EC58();
      goto LABEL_22;
    }

    sub_2EE08(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  Swift::Int result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    unint64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(void *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v20 = (void *)(v15 + 16 * a3);
        uint64_t v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

void *sub_2EC58()
{
  uint64_t v1 = v0;
  sub_18140((uint64_t *)&unk_566F8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    Swift::Int result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }

Swift::Int sub_2EE08(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_18140((uint64_t *)&unk_566F8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  uint64_t v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v13);
        if (!v19) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

    __break(1u);
LABEL_41:
    if (v3 < 0) {
      unint64_t v28 = v3;
    }
    else {
      unint64_t v28 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
  }

  return _swiftEmptyArrayStorage;
}

  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  Swift::Int result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_2F0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v2;
  if (*(void *)(*v2 + 24) > a1) {
    a1 = *(void *)(*v2 + 24);
  }
  sub_18140(&qword_566F0);
  int v45 = a2;
  uint64_t v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_43;
  }
  uint64_t v13 = 1LL << *(_BYTE *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v43 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1LL << v13);
  }
  else {
    uint64_t v15 = -1LL;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v17 = v11 + 64;
  uint64_t result = swift_retain(v10);
  int64_t v19 = 0LL;
  for (i = v10; ; uint64_t v10 = i)
  {
    if (v16)
    {
      unint64_t v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_24;
    }

    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v23 >= v42) {
      break;
    }
    uint64_t v24 = v43;
    unint64_t v25 = v43[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v42) {
        goto LABEL_36;
      }
      unint64_t v25 = v43[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_36:
          swift_release(v10);
          uint64_t v3 = v41;
          if ((v45 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1LL)) {
              goto LABEL_45;
            }
            if (v19 >= v42) {
              goto LABEL_36;
            }
            unint64_t v25 = v43[v19];
            ++v26;
            if (v25) {
              goto LABEL_23;
            }
          }
        }

        int64_t v19 = v26;
      }
    }

Swift::Int sub_2F448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_18140(&qword_566A0);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v35) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v35) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }

    Hasher.init(_seed:)(v38, *(void *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    int64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  int64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v23 = -1LL << v34;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      uint64_t v34 = v33;
    }

    Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    int64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  int64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  int64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v23 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

Swift::Int sub_2F75C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  int v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_18140((uint64_t *)&unk_566D0);
  int v44 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v41 = v3;
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v43 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v42 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  Swift::Int result = swift_retain(v8);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v22 >= v42) {
      goto LABEL_36;
    }
    unint64_t v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_36;
      }
      unint64_t v23 = v43[v17];
      if (!v23) {
        break;
      }
    }

LABEL_36:
  swift_release(v8);
  uint64_t v3 = v41;
  if ((v44 & 1) != 0)
  {
    uint64_t v39 = 1LL << *(_BYTE *)(v8 + 32);
    if (v39 >= 64) {
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
    }
    else {
      *uint64_t v43 = -1LL << v39;
    }
    *(void *)(v8 + 16) = 0LL;
  }

unint64_t sub_2FAC4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v38 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1LL << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1LL << v10)) != 0)
    {
      unint64_t v37 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v38 + 72);
      unint64_t v36 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
      uint64_t v13 = v11;
      do
      {
        uint64_t v14 = v8;
        uint64_t v15 = v12;
        int64_t v16 = v12 * v10;
        uint64_t v17 = v13;
        v36(v7, *(void *)(a2 + 48) + v12 * v10, v4);
        uint64_t v18 = *(void *)(a2 + 40);
        uint64_t v19 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v20 = dispatch thunk of Hashable._rawHashValue(seed:)(v18, v4, v19);
        unint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v7, v4);
        uint64_t v13 = v17;
        unint64_t v21 = v20 & v17;
        if (a1 >= (uint64_t)v37)
        {
          if (v21 >= v37 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v24 = *(void *)(a2 + 48);
            unint64_t result = v24 + v15 * a1;
            uint64_t v25 = v24 + v16;
            uint64_t v8 = v14;
            if (v15 * a1 < v16 || (uint64_t v12 = v15, result >= v25 + v15))
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack(result, v25, 1LL, v4);
LABEL_21:
              uint64_t v13 = v17;
              uint64_t v12 = v15;
            }

            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }

            uint64_t v26 = *(void *)(a2 + 56);
            unint64_t v27 = (void *)(v26 + 8 * a1);
            uint64_t v28 = (void *)(v26 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v27 >= v28 + 1))
            {
              void *v27 = *v28;
              a1 = v10;
            }

            goto LABEL_5;
          }
        }

        else if (v21 >= v37 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }

        uint64_t v8 = v14;
        uint64_t v12 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v13;
      }

      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
    }

    uint64_t v29 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1LL << a1) - 1;
  }

  else
  {
    uint64_t v29 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1LL << a1) - 1;
  }

  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1LL);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

unint64_t sub_2FD64(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        uint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v29, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v29, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        unint64_t result = swift_bridgeObjectRelease(v11);
        unint64_t v13 = v12 & v7;
        if (v13 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v14 = *(void *)(a2 + 48);
        uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
        int64_t v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1) {
          *uint64_t v15 = *v16;
        }
        uint64_t v17 = *(void *)(a2 + 56);
        uint64_t v18 = *(void *)(*(void *)(type metadata accessor for UUID(0LL) - 8) + 72LL);
        int64_t v19 = v18 * v3;
        unint64_t result = v17 + v18 * v3;
        int64_t v20 = v18 * v6;
        unint64_t v21 = v17 + v18 * v6 + v18;
        if (v19 < v20 || result >= v21)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }

        else
        {
          int64_t v3 = v6;
          if (v19 == v20) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }

        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }

      if (v13 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      goto LABEL_12;
    }

uint64_t sub_2FF60(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_19588(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_304B0();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease(*(void *)(v19 + 8 * v12));
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }

LABEL_11:
    v18[(v12 >> 6) + 8] |= 1LL << v12;
    unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
    uint64_t *v23 = a2;
    v23[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v24 = v18[2];
    BOOL v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }

    goto LABEL_14;
  }

  sub_2F448(v15, a4 & 1);
  unint64_t v21 = sub_19588(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    unint64_t v12 = v21;
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

uint64_t sub_300BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_19588(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = v18[7];
        uint64_t v20 = type metadata accessor for UUID(0LL);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40LL))( v19 + *(void *)(*(void *)(v20 - 8) + 72LL) * v12,  a1,  v20);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_30664();
      goto LABEL_7;
    }

    sub_2F75C(v15, a4 & 1);
    unint64_t v22 = sub_19588(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_301F8(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_301F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))( v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * a1,  a4,  v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

id sub_30288()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18140(&qword_566F0);
  uint64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v5);
    uint64_t *v24 = v7;
    return result;
  }

  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v25 = v5 + 64;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_304B0()
{
  uint64_t v1 = v0;
  sub_18140(&qword_566A0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

void *sub_30664()
{
  uint64_t v34 = type metadata accessor for UUID(0LL);
  uint64_t v1 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18140((uint64_t *)&unk_566D0);
  uint64_t v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v35 = v5;
  if (!v6)
  {
    id result = (void *)swift_release(v4);
    uint64_t v29 = v35;
    uint64_t v28 = v31;
LABEL_28:
    uint64_t *v28 = v29;
    return result;
  }

  uint64_t v7 = v5;
  id result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    id result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v35;
  }

  uint64_t v32 = v4 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = v34;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }

uint64_t sub_308C0(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0LL, v2, 0LL, a1);
}

uint64_t sub_30928(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7) {
      return a3;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
    if (!v7) {
      return a3;
    }
  }

  if (!a1) {
    goto LABEL_25;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8LL;
  if (v6)
  {
    if (a3 < 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_352B0(&qword_56710, &qword_56428, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_18140(&qword_56428);
          uint64_t v13 = sub_30DB8(v18, i, a3);
          id v15 = *v14;
          ((void (*)(void (**)(id *), void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

uint64_t sub_30B44(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7) {
      return a3;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
    if (!v7) {
      return a3;
    }
  }

  if (!a1) {
    goto LABEL_25;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8LL;
  if (v6)
  {
    if (a3 < 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_352B0(&qword_566E0, &qword_563F8, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (unint64_t i = 0LL; i != v7; ++i)
        {
          sub_18140(&qword_563F8);
          uint64_t v13 = sub_30D60(v18, i, a3);
          id v15 = *v14;
          ((void (*)(uint64_t (**)(), void))v13)(v18, 0LL);
          *(void *)(a1 + 8 * i) = v15;
        }

        swift_bridgeObjectRelease(a3);
        return a3;
      }

      goto LABEL_24;
    }

void (*sub_30D60(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_30E3C(v6, a2, a3);
  return sub_30DB4;
}

uint64_t (*sub_30DB8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_30EA8(v6, a2, a3);
  return sub_30E0C;
}

void sub_30E10(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

uint64_t (*sub_30E3C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_354F8;
  }

  __break(1u);
  return result;
}

void (*sub_30EA8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_30F14;
  }

  __break(1u);
  return result;
}

void sub_30F14(id *a1)
{
}

uint64_t sub_30F1C(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16),  0LL,  a1);
}

void *sub_30F30(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v6 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v19))
  {
    uint64_t v7 = 4LL;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1LL)) {
        break;
      }
      uint64_t v11 = v6;
      id v12 = [v8 *a4];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      uint64_t v15 = v14;

      uint64_t v16 = a3;
      if (v13 == a2 && v15 == a3)
      {
        swift_bridgeObjectRelease(a1);
LABEL_17:
        swift_bridgeObjectRelease(v16);
        return v9;
      }

      char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, a2, a3, 0LL);
      swift_bridgeObjectRelease(v15);
      if ((v18 & 1) != 0)
      {
        uint64_t v16 = a1;
        goto LABEL_17;
      }

      ++v7;
      uint64_t v6 = v11;
      if (v10 == v11) {
        goto LABEL_23;
      }
    }

    __break(1u);
LABEL_19:
    if (a1 < 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

void *sub_310C4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v36 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_41;
  }
  for (uint64_t i = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL)); i; uint64_t i = _CocoaArrayWrapper.endIndex.getter(v28))
  {
    uint64_t v30 = v3;
    unint64_t v5 = 0LL;
    unint64_t v6 = v3 & 0xC000000000000001LL;
    uint64_t v34 = v3 + 32;
    uint64_t v35 = v3 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8LL;
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    uint64_t v29 = v7;
    uint64_t v32 = i;
    unint64_t v33 = a2 & 0xC000000000000001LL;
    unint64_t v31 = v3 & 0xC000000000000001LL;
    while (1)
    {
      if (v6)
      {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v30);
      }

      else
      {
        if (v5 >= *(void *)(v35 + 16)) {
          goto LABEL_38;
        }
        id v8 = *(id *)(v34 + 8 * v5);
      }

      uint64_t v9 = v8;
      if (__OFADD__(v5++, 1LL)) {
        goto LABEL_39;
      }
      if ((unint64_t)a2 >> 62)
      {
        swift_bridgeObjectRetain(a2);
        uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v29);
        if (!v11) {
          goto LABEL_18;
        }
      }

      else
      {
        uint64_t v11 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8LL));
        swift_bridgeObjectRetain(a2);
        if (!v11) {
          goto LABEL_18;
        }
      }

      id v12 = v33 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2) : *(id *)(a2 + 32);
      uint64_t v13 = v12;
      uint64_t v3 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
      char v14 = static NSObject.== infix(_:_:)(v13, v9);

      if ((v14 & 1) == 0) {
        break;
      }

      swift_bridgeObjectRelease(a2);
LABEL_7:
      if (v5 == i) {
        return v36;
      }
    }

    if (v11 == 1)
    {
LABEL_18:
      uint64_t v15 = swift_bridgeObjectRelease(a2);
LABEL_19:
      uint64_t v3 = (uint64_t)&v36;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v15);
      uint64_t v16 = v36[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
      uint64_t v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v9);
      specialized ContiguousArray._endMutation()(v17);
      goto LABEL_7;
    }

    if (v33)
    {
      uint64_t v18 = 1LL;
      while (1)
      {
        uint64_t v19 = specialized _ArrayBuffer._getElementSlowPath(_:)(v18, a2);
        uint64_t v20 = v18 + 1;
        if (__OFADD__(v18, 1LL)) {
          break;
        }
        uint64_t v21 = v19;
        char v22 = static NSObject.== infix(_:_:)(v19, v9);
        swift_unknownObjectRelease(v21);
        if ((v22 & 1) != 0) {
          goto LABEL_31;
        }
        ++v18;
        if (v20 == v11) {
          goto LABEL_30;
        }
      }

      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    uint64_t v23 = 5LL;
    while (1)
    {
      uint64_t v24 = v23 - 3;
      if (__OFADD__(v23 - 4, 1LL)) {
        break;
      }
      id v25 = *(id *)(a2 + 8 * v23);
      char v26 = static NSObject.== infix(_:_:)(v25, v9);

      if ((v26 & 1) != 0)
      {
LABEL_31:

        swift_bridgeObjectRelease(a2);
        unint64_t v6 = v31;
        uint64_t i = v32;
        goto LABEL_7;
      }

      ++v23;
      if (v24 == v11)
      {
LABEL_30:
        uint64_t v15 = swift_bridgeObjectRelease(a2);
        unint64_t v6 = v31;
        uint64_t i = v32;
        goto LABEL_19;
      }
    }

void *sub_3137C(unint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_40;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0LL;
      unint64_t v6 = v3 & 0xC000000000000001LL;
      uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v34 = v3;
      uint64_t v8 = v3 + 32;
      uint64_t v37 = v4;
      uint64_t v38 = a2;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v36 = v3 & 0xC000000000000001LL;
      uint64_t v39 = v3 + 32;
      while (v6)
      {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v34);
LABEL_9:
        uint64_t v11 = v10;
        if (__OFADD__(v5++, 1LL)) {
          goto LABEL_39;
        }
        uint64_t v13 = (uint64_t)[v10 isHidden];
        if ((v13 & 1) != 0)
        {
LABEL_4:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v13);
          uint64_t v3 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v3);
          uint64_t v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v3, v11);
          specialized ContiguousArray._endMutation()(v9);
        }

        else
        {
          id v14 = [a2 copilotFusedControllers];
          uint64_t v15 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
          uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);

          if ((unint64_t)v16 >> 62)
          {
            if (v16 < 0) {
              uint64_t v30 = v16;
            }
            else {
              uint64_t v30 = v16 & 0xFFFFFFFFFFFFFF8LL;
            }
            id v31 = v11;
            swift_bridgeObjectRetain(v16);
            uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v30);
            if (v3)
            {
LABEL_13:
              unint64_t v40 = v5;
              uint64_t v41 = v3;
              id v42 = v11;
              uint64_t v18 = 4LL;
              while (1)
              {
                if ((v16 & 0xC000000000000001LL) != 0) {
                  id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, v16);
                }
                else {
                  id v19 = *(id *)(v16 + 8 * v18);
                }
                uint64_t v20 = v19;
                uint64_t v3 = v18 - 3;
                if (__OFADD__(v18 - 4, 1LL))
                {
                  __break(1u);
                  goto LABEL_38;
                }

                id v21 = [v19 fusedControllerIdentifier];
                uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
                uint64_t v24 = v23;

                id v25 = [v42 persistentIdentifier];
                uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
                a2 = v27;

                if (v22 == v26 && v24 == a2)
                {
                  uint64_t v3 = (uint64_t)v42;

                  swift_bridgeObjectRelease(v16);
                  swift_bridgeObjectRelease(v24);
                  goto LABEL_27;
                }

                char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v24, v26, a2, 0LL);

                swift_bridgeObjectRelease(v24);
                swift_bridgeObjectRelease(a2);
                if ((v29 & 1) != 0) {
                  break;
                }
                ++v18;
                if (v3 == v41)
                {
                  uint64_t v3 = (uint64_t)v42;

                  swift_bridgeObjectRelease_n(v16, 2LL);
                  uint64_t v4 = v37;
                  a2 = v38;
                  unint64_t v5 = v40;
                  uint64_t v7 = v35;
                  unint64_t v6 = v36;
                  goto LABEL_35;
                }
              }

              uint64_t v3 = (uint64_t)v42;

              uint64_t v24 = (void *)v16;
LABEL_27:
              swift_bridgeObjectRelease(v24);
              swift_bridgeObjectRelease(v16);
              a2 = v38;
              uint64_t v13 = (*(uint64_t (**)(uint64_t))((char *)&stru_1F8.reloff + (swift_isaMask & *v38)))(v3);
              unint64_t v6 = v36;
              uint64_t v4 = v37;
              uint64_t v8 = v39;
              unint64_t v5 = v40;
              uint64_t v7 = v35;
              uint64_t v11 = (void *)v3;
              if ((v13 & 1) == 0) {
                goto LABEL_4;
              }

              goto LABEL_5;
            }
          }

          else
          {
            uint64_t v3 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL));
            id v17 = v11;
            swift_bridgeObjectRetain(v16);
            if (v3) {
              goto LABEL_13;
            }
          }

          swift_bridgeObjectRelease_n(v16, 2LL);
LABEL_35:
          uint64_t v8 = v39;
        }

void *sub_316F8(unint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v33 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (v4)
  {
    while (1)
    {
      uint64_t v27 = v3;
      unint64_t v5 = 0LL;
      uint64_t v31 = v3 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v32 = v3 & 0xC000000000000001LL;
      uint64_t v29 = v4;
      uint64_t v30 = v3 + 32;
      uint64_t v28 = a2 + 7;
      while (1)
      {
        if (v32)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v27);
        }

        else
        {
          if (v5 >= *(void *)(v31 + 16))
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }

          id v6 = *(id *)(v30 + 8 * v5);
        }

        uint64_t v7 = v6;
        if (__OFADD__(v5++, 1LL)) {
          goto LABEL_31;
        }
        id v9 = [v6 persistentIdentifier];
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
        uint64_t v3 = v11;

        id v12 = (void *)a2[2];
        if (v12) {
          break;
        }

        swift_bridgeObjectRelease(v3);
LABEL_5:
        if (v5 == v4) {
          return v33;
        }
      }

      uint64_t v13 = a2[4];
      uint64_t v14 = a2[5];
      uint64_t v15 = a2;
      BOOL v16 = v13 == v10 && v14 == v3;
      if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, v10, v3, 0LL) & 1) != 0) {
        break;
      }
      if (v12 == (void *)((char *)&dword_0 + 1))
      {
LABEL_27:

        swift_bridgeObjectRelease(v3);
        goto LABEL_17;
      }

      uint64_t v20 = v28;
      uint64_t v21 = 1LL;
      while (1)
      {
        a2 = (void *)(v21 + 1);
        if (__OFADD__(v21, 1LL)) {
          break;
        }
        uint64_t v22 = *(v20 - 1);
        uint64_t v23 = *v20;
        BOOL v24 = v22 == v10 && v23 == v3;
        if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, v10, v3, 0LL) & 1) != 0) {
          goto LABEL_16;
        }
        v20 += 2;
        ++v21;
        if (a2 == v12) {
          goto LABEL_27;
        }
      }

LABEL_32:
      __break(1u);
LABEL_33:
      if (v3 < 0) {
        uint64_t v26 = v3;
      }
      else {
        uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v26);
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }

void *sub_3191C(unint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a1;
  uint64_t v59 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_59;
  }
  for (uint64_t i = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL)); i; uint64_t i = _CocoaArrayWrapper.endIndex.getter(v51))
  {
    unint64_t v6 = 0LL;
    uint64_t v56 = v4 & 0xFFFFFFFFFFFFFF8LL;
    unint64_t v57 = v4 & 0xC000000000000001LL;
    uint64_t v55 = v4 + 32;
    uint64_t v52 = v4;
    while (1)
    {
      if (v57)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v52);
      }

      else
      {
        if (v6 >= *(void *)(v56 + 16))
        {
          __break(1u);
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }

        id v7 = *(id *)(v55 + 8 * v6);
      }

      uint64_t v8 = v7;
      if (__OFADD__(v6++, 1LL)) {
        goto LABEL_55;
      }
      id v10 = [v7 persistentIdentifier];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      uint64_t v4 = v12;

      uint64_t v13 = a2[2];
      if (v13)
      {
        uint64_t v14 = a2[4];
        uint64_t v15 = a2[5];
        BOOL v16 = v14 == v11 && v15 == v4;
        if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, v11, v4, 0LL) & 1) != 0) {
          goto LABEL_4;
        }
        if (v13 != 1)
        {
          uint64_t v17 = a2 + 7;
          uint64_t v18 = 1LL;
          while (1)
          {
            uint64_t v19 = v18 + 1;
            if (__OFADD__(v18, 1LL)) {
              break;
            }
            uint64_t v20 = *(v17 - 1);
            uint64_t v21 = *v17;
            BOOL v22 = v20 == v11 && v21 == v4;
            if (v22 || (_stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, v11, v4, 0LL) & 1) != 0) {
              goto LABEL_4;
            }
            v17 += 2;
            ++v18;
            if (v19 == v13) {
              goto LABEL_25;
            }
          }

LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
      }

void *sub_31CB0(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v31 = a2;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v30 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = _swiftEmptyArrayStorage;
  uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (v8)
  {
    while (1)
    {
      unint64_t v9 = 0LL;
      unint64_t v29 = a1 & 0xC000000000000001LL;
      v27[1] = v3;
      uint64_t v28 = a1 & 0xFFFFFFFFFFFFFF8LL;
      while (v29)
      {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, a1);
LABEL_10:
        uint64_t v3 = v10;
        unint64_t v11 = v9 + 1;
        if (__OFADD__(v9, 1LL)) {
          goto LABEL_18;
        }
        id v12 = [v10 uuid];
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        id v13 = [v31 profileUsageStats];
        uint64_t v14 = type metadata accessor for GCSProfileUsageStats();
        uint64_t v15 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, v5, v14, v15);

        if (*(void *)(v16 + 16) && (unint64_t v17 = sub_2DD78((uint64_t)v7), (v18 & 1) != 0))
        {
          uint64_t v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
          swift_bridgeObjectRelease(v16);
          uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v7, v5);
          char v21 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v19)))(v20);

          if ((v21 & 1) != 0)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v22);
            uint64_t v23 = v32[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
            uint64_t v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v3);
            specialized ContiguousArray._endMutation()(v24);
            goto LABEL_6;
          }
        }

        else
        {
          swift_bridgeObjectRelease(v16);
          (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v5);
        }

LABEL_6:
        ++v9;
        if (v11 == v8) {
          return v32;
        }
      }

      if (v9 < *(void *)(v28 + 16)) {
        break;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      if (a1 < 0) {
        uint64_t v26 = a1;
      }
      else {
        uint64_t v26 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v26);
      if (!v8) {
        return _swiftEmptyArrayStorage;
      }
    }

    id v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_10;
  }

  return _swiftEmptyArrayStorage;
}

void *sub_31F30(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v31 = a2;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v30 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = _swiftEmptyArrayStorage;
  uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (v8)
  {
    while (1)
    {
      unint64_t v9 = 0LL;
      unint64_t v29 = a1 & 0xC000000000000001LL;
      v27[1] = v3;
      uint64_t v28 = a1 & 0xFFFFFFFFFFFFFF8LL;
      while (v29)
      {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, a1);
LABEL_10:
        uint64_t v3 = v10;
        unint64_t v11 = v9 + 1;
        if (__OFADD__(v9, 1LL)) {
          goto LABEL_18;
        }
        id v12 = [v10 uuid];
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        id v13 = [v31 profileUsageStats];
        uint64_t v14 = type metadata accessor for GCSProfileUsageStats();
        uint64_t v15 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
        uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, v5, v14, v15);

        if (*(void *)(v16 + 16) && (unint64_t v17 = sub_2DD78((uint64_t)v7), (v18 & 1) != 0))
        {
          uint64_t v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
          swift_bridgeObjectRelease(v16);
          uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v7, v5);
          char v21 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v19)))(v20);

          if ((v21 & 1) == 0)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v22);
            uint64_t v23 = v32[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
            uint64_t v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v3);
            specialized ContiguousArray._endMutation()(v24);
            goto LABEL_6;
          }
        }

        else
        {
          swift_bridgeObjectRelease(v16);
          (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v5);
        }

LABEL_6:
        ++v9;
        if (v11 == v8) {
          return v32;
        }
      }

      if (v9 < *(void *)(v28 + 16)) {
        break;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      if (a1 < 0) {
        uint64_t v26 = a1;
      }
      else {
        uint64_t v26 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v26);
      if (!v8) {
        return _swiftEmptyArrayStorage;
      }
    }

    id v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_10;
  }

  return _swiftEmptyArrayStorage;
}

void *sub_321B0(unint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (v3)
  {
    while (1)
    {
      uint64_t v23 = v2;
      unint64_t v4 = 0LL;
      uint64_t v24 = v2 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v25 = v2 & 0xC000000000000001LL;
      while (v25)
      {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v2);
LABEL_9:
        uint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1LL)) {
          goto LABEL_23;
        }
        id v8 =  objc_msgSend( (id)objc_opt_self(GameController_Bridge),  "gcController_persistentIdentifier:",  v5);
        if (v8)
        {
          unint64_t v9 = v8;
          uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
          uint64_t v12 = v11;
        }

        else
        {
          uint64_t v10 = 0LL;
          uint64_t v12 = 0LL;
        }

        id v13 = [a2 persistentIdentifier];
        uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
        uint64_t v16 = v15;

        if (v12)
        {
          if (v10 == v14 && v12 == v16)
          {
            swift_bridgeObjectRelease(v12);
            uint64_t v17 = swift_bridgeObjectRelease(v16);
          }

          else
          {
            char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, v14, v16, 0LL);
            swift_bridgeObjectRelease(v12);
            uint64_t v17 = swift_bridgeObjectRelease(v16);
            if ((v18 & 1) == 0)
            {

              goto LABEL_5;
            }
          }

          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
          uint64_t v19 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v19);
          uint64_t v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v6);
          specialized ContiguousArray._endMutation()(v20);
        }

        else
        {

          swift_bridgeObjectRelease(v16);
        }

Swift::Int sub_323D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_18140((uint64_t *)&unk_566F8);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v27 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v27 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v28, *(void *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        uint64_t v17 = v16[1];
        BOOL v18 = *v16 == v8 && v17 == v7;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0LL), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v19 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v19;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          uint64_t v20 = (void *)(v15 + 16 * v11);
          uint64_t v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0LL);
            if ((result & 1) == 0) {
              continue;
            }
          }

          goto LABEL_3;
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v23 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v23 = v8;
      v23[1] = v7;
      uint64_t v24 = *(void *)(v3 + 16);
      BOOL v25 = __OFADD__(v24, 1LL);
      uint64_t v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_32570(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_32660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  if (a3 != a2)
  {
    uint64_t v7 = a3;
    uint64_t v8 = a1;
    uint64_t v9 = *a4;
    uint64_t v10 = *a4 + 8 * a3 - 8;
LABEL_4:
    unint64_t v11 = *(void **)(v9 + 8 * v7);
    uint64_t v19 = v10;
    while (1)
    {
      uint64_t v21 = v11;
      id v20 = *(id *)v10;
      id v12 = v20;
      id v13 = v11;
      id v14 = v12;
      char v15 = sub_21628(&v21, &v20, a5);

      if (v5) {
        break;
      }
      if ((v15 & 1) != 0)
      {
        if (!v9)
        {
          __break(1u);
          return;
        }

        id v16 = *(id *)v10;
        unint64_t v11 = *(void **)(v10 + 8);
        *(void *)uint64_t v10 = v11;
        *(void *)(v10 + 8) = v16;
        v10 -= 8LL;
        if (v7 != ++v8) {
          continue;
        }
      }

      ++v7;
      uint64_t v10 = v19 + 8;
      uint64_t v8 = a1;
      if (v7 != a2) {
        goto LABEL_4;
      }
      return;
    }
  }

void sub_32750(uint64_t *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v175 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  v174 = (char *)&v163 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v176 = (char *)&v163 - v9;
  Swift::Int v10 = a1[1];
  id v182 = a2;
  Swift::Int v11 = _minimumMergeRunLength(_:)(v10);
  if (v11 >= v10)
  {
    if (v10 < 0) {
      goto LABEL_156;
    }
    if (v10)
    {
      id v16 = v182;
      sub_32660(0LL, v10, 1LL, a1, v16);
    }

    else
    {
      id v16 = v182;
    }

    return;
  }

  if (v10 >= 0) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 + 1;
  }
  if (v10 < -1) {
    goto LABEL_164;
  }
  Swift::Int v168 = v11;
  Swift::Int v171 = v10;
  unint64_t v165 = a1;
  if (v10 < 2)
  {
    uint64_t v17 = (char *)_swiftEmptyArrayStorage;
    uint64_t v186 = (uint64_t)_swiftEmptyArrayStorage;
    v173 = (id *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 32);
    if (v10 != 1)
    {
      unint64_t v89 = _swiftEmptyArrayStorage[2];
LABEL_120:
      if (v89 >= 2)
      {
        uint64_t v145 = (void **)*v165;
        v181 = (void **)*v165;
        do
        {
          unint64_t v146 = v89 - 2;
          if (v89 < 2) {
            goto LABEL_150;
          }
          if (!v145) {
            goto LABEL_163;
          }
          uint64_t v147 = (uint64_t)v17;
          uint64_t v148 = *(void *)&v17[16 * v146 + 32];
          uint64_t v149 = *(void *)&v17[16 * v89 + 24];
          uint64_t v150 = *(void *)&v17[16 * v89 + 16];
          v183 = &v145[v148];
          __int128 v151 = &v145[v150];
          unint64_t v152 = (unint64_t)&v145[v149];
          id v153 = v182;
          sub_2E018(v183, v151, v152, v173, v153);
          if (v3)
          {
            uint64_t v144 = swift_bridgeObjectRelease(v147);
            goto LABEL_134;
          }

          if (v149 < v148) {
            goto LABEL_152;
          }
          uint64_t v17 = (char *)v147;
          if ((swift_isUniquelyReferenced_nonNull_native(v147) & 1) == 0) {
            uint64_t v17 = sub_2E4F4(v147);
          }
          if (v146 >= *((void *)v17 + 2)) {
            goto LABEL_153;
          }
          int64_t v154 = &v17[16 * v146 + 32];
          *(void *)int64_t v154 = v148;
          *((void *)v154 + 1) = v149;
          unint64_t v155 = *((void *)v17 + 2);
          if (v89 > v155) {
            goto LABEL_154;
          }
          memmove(&v17[16 * v89 + 16], &v17[16 * v89 + 32], 16 * (v155 - v89));
          *((void *)v17 + 2) = v155 - 1;
          unint64_t v89 = v155 - 1;
          uint64_t v145 = v181;
        }

        while (v155 > 2);
      }

      uint64_t v144 = swift_bridgeObjectRelease(v17);
      goto LABEL_134;
    }
  }

  else
  {
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
    uint64_t v15 = static Array._allocateBufferUninitialized(minimumCapacity:)(v13, v14);
    *(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8LL)) = v13;
    v173 = (id *)((v15 & 0xFFFFFFFFFFFFFF8LL) + 32);
    uint64_t v186 = v15;
  }

  Swift::Int v18 = 0LL;
  uint64_t v19 = *a1;
  uint64_t v166 = *a1 + 16;
  uint64_t v17 = (char *)_swiftEmptyArrayStorage;
  uint64_t v167 = v19 - 8;
  uint64_t v178 = v19;
  uint64_t v179 = v6;
  Swift::Int v20 = v171;
  while (1)
  {
    Swift::Int v21 = v18;
    Swift::Int v22 = v18 + 1;
    Swift::Int v170 = v18;
    if (v18 + 1 >= v20) {
      goto LABEL_30;
    }
    uint64_t v23 = *(void **)(v19 + 8 * v22);
    id v184 = *(id *)(v19 + 8 * v18);
    id v24 = v184;
    v185[0] = v23;
    id v25 = v23;
    id v26 = v24;
    int v27 = sub_21628(v185, &v184, v182);
    if (v3)
    {
      swift_bridgeObjectRelease(v17);

LABEL_134:
      *(void *)((char *)&dword_10 + (v186 & 0xFFFFFFFFFFFFF8LL)) = 0LL;
      specialized Array._endMutation()(v144);
      uint64_t v156 = v186;
      uint64_t v157 = v182;

      swift_bridgeObjectRelease(v156);
      return;
    }

    int v28 = v27;

    Swift::Int v22 = v21 + 2;
    if (v21 + 2 < v171)
    {
      Swift::Int v29 = v21;
      uint64_t v30 = v17;
      id v31 = (void **)(v166 + 8 * v29);
      while (1)
      {
        Swift::Int v32 = v22;
        uint64_t v33 = *v31;
        id v184 = *(v31 - 1);
        id v34 = v184;
        v185[0] = v33;
        id v35 = v33;
        id v36 = v34;
        int v37 = sub_21628(v185, &v184, v182);

        if (((v28 ^ v37) & 1) != 0) {
          break;
        }
        Swift::Int v22 = v32 + 1;
        ++v31;
        if (v171 == v32 + 1)
        {
          Swift::Int v22 = v171;
          uint64_t v3 = 0LL;
          uint64_t v17 = v30;
          uint64_t v19 = v178;
          goto LABEL_21;
        }
      }

      uint64_t v3 = 0LL;
      uint64_t v17 = v30;
      uint64_t v19 = v178;
      Swift::Int v22 = v32;
LABEL_21:
      Swift::Int v21 = v170;
    }

    if ((v28 & 1) != 0)
    {
      if (v22 < v21) {
        goto LABEL_159;
      }
      if (v21 < v22)
      {
        uint64_t v38 = (uint64_t *)(v167 + 8 * v22);
        Swift::Int v39 = v22;
        Swift::Int v40 = v21;
        uint64_t v41 = (uint64_t *)(v19 + 8 * v21);
        do
        {
          if (v40 != --v39)
          {
            if (!v19) {
              goto LABEL_162;
            }
            uint64_t v42 = *v41;
            *uint64_t v41 = *v38;
            uint64_t *v38 = v42;
          }

          ++v40;
          --v38;
          ++v41;
        }

        while (v40 < v39);
      }
    }

LABEL_57:
        id v76 = [v75 name];
        uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(v76);
        uint64_t v79 = v78;

        id v80 = [v183 name];
        uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(v80);
        uint64_t v83 = v82;

        if (v77 == v81 && v79 == v83)
        {

          swift_bridgeObjectRelease_n(v79, 2LL);
          uint64_t v6 = v179;
          goto LABEL_40;
        }

        char v84 = _stringCompareWithSmolCheck(_:_:expecting:)(v77, v79, v81, v83, 1LL);

        swift_bridgeObjectRelease(v79);
        swift_bridgeObjectRelease(v83);
        uint64_t v6 = v179;
        if ((v84 & 1) == 0) {
          goto LABEL_40;
        }
LABEL_60:
        uint64_t v19 = v178;
        if (!v178) {
          goto LABEL_160;
        }
        uint64_t v85 = *(void **)v50;
        uint64_t v48 = *(void **)(v50 + 8);
        *(void *)uint64_t v50 = v48;
        *(void *)(v50 + 8) = v85;
        v50 -= 8LL;
        ++v49;
        Swift::Int v46 = v177;
        if (v177 == v49) {
          goto LABEL_41;
        }
      }

      os_log_type_t v72 = *(id *)(*(void *)(v69 + 56) + 8 * v70);
      swift_bridgeObjectRelease(v69);
      uint64_t v6 = v179;
      uint64_t v73 = v64(v67, v179);
      char v74 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v72)))(v73);

      uint64_t v45 = (uint64_t)v176;
      if ((v180 & 1) != 0)
      {
        uint64_t v75 = v181;
        if ((v74 & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_57;
      }

      uint64_t v75 = v181;
      if ((v74 & 1) == 0) {
        goto LABEL_57;
      }

LABEL_40:
      Swift::Int v46 = v177;
      uint64_t v19 = v178;
LABEL_41:
      Swift::Int v22 = v46 + 1;
      uint64_t v44 = v172 + 8;
      Swift::Int v21 = v170;
      if (v22 != v169) {
        continue;
      }
      break;
    }

    Swift::Int v22 = v169;
    uint64_t v3 = v164;
    uint64_t v17 = v163;
LABEL_65:
    if (v22 < v21) {
      goto LABEL_151;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v17);
    Swift::Int v177 = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v17 = sub_2E354(0LL, *((void *)v17 + 2) + 1LL, 1, v17);
    }
    unint64_t v88 = *((void *)v17 + 2);
    unint64_t v87 = *((void *)v17 + 3);
    unint64_t v89 = v88 + 1;
    if (v88 >= v87 >> 1) {
      uint64_t v17 = sub_2E354((char *)(v87 > 1), v88 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v89;
    __int128 v90 = v17 + 32;
    __int128 v91 = &v17[16 * v88 + 32];
    Swift::Int v92 = v177;
    *(void *)__int128 v91 = v21;
    *((void *)v91 + 1) = v92;
    if (v88)
    {
      v180 = v17 + 32;
      while (1)
      {
        unint64_t v93 = v89 - 1;
        if (v89 >= 4)
        {
          uint64_t v98 = &v90[16 * v89];
          uint64_t v99 = *((void *)v98 - 8);
          uint64_t v100 = *((void *)v98 - 7);
          BOOL v104 = __OFSUB__(v100, v99);
          uint64_t v101 = v100 - v99;
          if (v104) {
            goto LABEL_139;
          }
          uint64_t v103 = *((void *)v98 - 6);
          uint64_t v102 = *((void *)v98 - 5);
          BOOL v104 = __OFSUB__(v102, v103);
          uint64_t v96 = v102 - v103;
          char v97 = v104;
          if (v104) {
            goto LABEL_140;
          }
          unint64_t v105 = v89 - 2;
          char v106 = &v90[16 * v89 - 32];
          uint64_t v108 = *(void *)v106;
          uint64_t v107 = *((void *)v106 + 1);
          BOOL v104 = __OFSUB__(v107, v108);
          uint64_t v109 = v107 - v108;
          if (v104) {
            goto LABEL_142;
          }
          BOOL v104 = __OFADD__(v96, v109);
          uint64_t v110 = v96 + v109;
          if (v104) {
            goto LABEL_145;
          }
          if (v110 >= v101)
          {
            uint64_t v128 = &v90[16 * v93];
            uint64_t v130 = *(void *)v128;
            uint64_t v129 = *((void *)v128 + 1);
            BOOL v104 = __OFSUB__(v129, v130);
            uint64_t v131 = v129 - v130;
            if (v104) {
              goto LABEL_149;
            }
            BOOL v121 = v96 < v131;
            goto LABEL_103;
          }
        }

        else
        {
          if (v89 != 3)
          {
            uint64_t v122 = *((void *)v17 + 4);
            uint64_t v123 = *((void *)v17 + 5);
            BOOL v104 = __OFSUB__(v123, v122);
            uint64_t v115 = v123 - v122;
            char v116 = v104;
            goto LABEL_97;
          }

          uint64_t v95 = *((void *)v17 + 4);
          uint64_t v94 = *((void *)v17 + 5);
          BOOL v104 = __OFSUB__(v94, v95);
          uint64_t v96 = v94 - v95;
          char v97 = v104;
        }

        if ((v97 & 1) != 0) {
          goto LABEL_141;
        }
        unint64_t v105 = v89 - 2;
        char v111 = &v90[16 * v89 - 32];
        uint64_t v113 = *(void *)v111;
        uint64_t v112 = *((void *)v111 + 1);
        BOOL v114 = __OFSUB__(v112, v113);
        uint64_t v115 = v112 - v113;
        char v116 = v114;
        if (v114) {
          goto LABEL_144;
        }
        unint64_t v117 = &v90[16 * v93];
        uint64_t v119 = *(void *)v117;
        uint64_t v118 = *((void *)v117 + 1);
        BOOL v104 = __OFSUB__(v118, v119);
        uint64_t v120 = v118 - v119;
        if (v104) {
          goto LABEL_147;
        }
        if (__OFADD__(v115, v120)) {
          goto LABEL_148;
        }
        if (v115 + v120 >= v96)
        {
          BOOL v121 = v96 < v120;
LABEL_103:
          if (v121) {
            unint64_t v93 = v105;
          }
          goto LABEL_105;
        }

LABEL_97:
        if ((v116 & 1) != 0) {
          goto LABEL_143;
        }
        id v124 = &v90[16 * v93];
        uint64_t v126 = *(void *)v124;
        uint64_t v125 = *((void *)v124 + 1);
        BOOL v104 = __OFSUB__(v125, v126);
        uint64_t v127 = v125 - v126;
        if (v104) {
          goto LABEL_146;
        }
        if (v127 < v115) {
          goto LABEL_114;
        }
LABEL_105:
        unint64_t v132 = v93 - 1;
        if (v93 - 1 >= v89)
        {
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
          goto LABEL_158;
        }

        if (!v19) {
          goto LABEL_161;
        }
        NSString v133 = v17;
        Class v134 = v90;
        Class v135 = &v90[16 * v132];
        uint64_t v136 = *(void *)v135;
        unint64_t v137 = v93;
        Class v138 = &v134[16 * v93];
        uint64_t v139 = *(void *)v138;
        uint64_t v140 = *((void *)v138 + 1);
        v183 = (void **)(v19 + 8LL * *(void *)v135);
        v181 = (void **)(v19 + 8 * v139);
        id v141 = v182;
        sub_2E018(v183, v181, v19 + 8 * v140, v173, v141);
        if (v3)
        {
          uint64_t v144 = swift_bridgeObjectRelease(v133);
          goto LABEL_134;
        }

        if (v140 < v136) {
          goto LABEL_136;
        }
        if (v137 > *((void *)v133 + 2)) {
          goto LABEL_137;
        }
        unint64_t v142 = v137;
        *(void *)Class v135 = v136;
        __int128 v90 = v180;
        *(void *)&v180[16 * v132 + 8] = v140;
        unint64_t v143 = *((void *)v133 + 2);
        if (v142 >= v143) {
          goto LABEL_138;
        }
        uint64_t v17 = v133;
        unint64_t v89 = v143 - 1;
        memmove(v138, v138 + 16, 16 * (v143 - 1 - v142));
        *((void *)v17 + 2) = v143 - 1;
        uint64_t v19 = v178;
        uint64_t v6 = v179;
        if (v143 <= 2) {
          goto LABEL_114;
        }
      }
    }

    unint64_t v89 = 1LL;
LABEL_114:
    Swift::Int v20 = v171;
    Swift::Int v18 = v177;
    if (v177 >= v171) {
      goto LABEL_120;
    }
  }

LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t v158 = v182;

  __break(1u);
LABEL_161:
  uint64_t v159 = v182;

  __break(1u);
LABEL_162:
  unint64_t v160 = v182;

  __break(1u);
LABEL_163:
  uint64_t v161 = v182;

  __break(1u);
LABEL_164:
  uint64_t v162 = v182;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
  __break(1u);
}

void sub_33364(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_30F1C(v3);
    *a1 = v3;
  }

  uint64_t v6 = *(void *)(v3 + 16);
  v9[0] = v3 + 32;
  v9[1] = v6;
  id v7 = v4;
  sub_32750(v9, v7);

  specialized ContiguousArray._endMutation()(v8);
}

uint64_t sub_33400(void *a1)
{
  id v2 = [(id)objc_opt_self(GCController) controllers];
  uint64_t v3 = sub_34D00(0LL, &qword_566C8, &classRef_GCController);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  id v5 = a1;
  uint64_t v6 = (uint64_t)sub_321B0(v4, v5);
  swift_bridgeObjectRelease(v4);

  if (!((unint64_t)v6 >> 62))
  {
    uint64_t result = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8LL));
    if (result) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 0LL;
  }

  if (v6 < 0) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8LL;
  }
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v10);
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v6 & 0xC000000000000001LL) != 0)
  {
    id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v6);
    goto LABEL_6;
  }

  if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v8 = *(id *)(v6 + 32);
LABEL_6:
    id v9 = v8;
    swift_bridgeObjectRelease(v6);
    return (uint64_t)v9;
  }

  __break(1u);
  return result;
}

uint64_t sub_33520()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 games];
  uint64_t v6 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  id v8 = v2;
  uint64_t v9 = swift_bridgeObjectRetain(v7);
  unint64_t v10 = sub_34DC4(v9);
  LOBYTE(v2) = v11;

  swift_bridgeObjectRelease(v7);
  if ((v2 & 1) == 0)
  {
    id v12 = v3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(v7);
    uint64_t v18 = v7;
    if (!(_DWORD)result || v7 < 0 || (v7 & 0x4000000000000000LL) != 0)
    {
      uint64_t result = sub_308C0(v7);
      uint64_t v7 = result;
      uint64_t v18 = result;
    }

    if ((v10 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (v10 < *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8LL)))
    {
      uint64_t v14 = *(void **)((char *)&stru_20.cmd + 8 * v10 + (v7 & 0xFFFFFFFFFFFFFF8LL));
      *(void *)((char *)&stru_20.cmd + 8 * v10 + (v7 & 0xFFFFFFFFFFFFFF8LL)) = v12;

      specialized Array._endMutation()(v15);
      uint64_t v7 = v18;
      goto LABEL_9;
    }

    __break(1u);
    return result;
  }

uint64_t sub_336C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_336D4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_336DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void sub_3371C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 games];
  uint64_t v5 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  uint64_t v13 = v6;
  id v7 = v2;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v9 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v8 = *(void *)((char *)&dword_18 + (v13 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 >= v8 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1LL);
  }
  uint64_t v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
  specialized Array._endMutation()(v10);
  if (v3)
  {
    uint64_t v11 = swift_bridgeObjectRetain(v13);
    sub_2A4FC(v11, (uint64_t)j_nullsub_1_2, 0LL);
    swift_bridgeObjectRelease(v13);
  }

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  [v1 setGames:isa];
}

uint64_t sub_33858()
{
  return sub_23F64(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_33868()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 profiles];
  uint64_t v6 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  id v8 = v2;
  uint64_t v9 = swift_bridgeObjectRetain(v7);
  unint64_t v10 = sub_34F30(v9, v8);
  LOBYTE(v2) = v11;

  swift_bridgeObjectRelease(v7);
  if ((v2 & 1) == 0)
  {
    id v12 = v3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(v7);
    uint64_t v18 = v7;
    if (!(_DWORD)result || v7 < 0 || (v7 & 0x4000000000000000LL) != 0)
    {
      uint64_t result = sub_308C0(v7);
      uint64_t v7 = result;
      uint64_t v18 = result;
    }

    if ((v10 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (v10 < *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8LL)))
    {
      uint64_t v14 = *(void **)((char *)&stru_20.cmd + 8 * v10 + (v7 & 0xFFFFFFFFFFFFFF8LL));
      *(void *)((char *)&stru_20.cmd + 8 * v10 + (v7 & 0xFFFFFFFFFFFFFF8LL)) = v12;

      specialized Array._endMutation()(v15);
      uint64_t v7 = v18;
      goto LABEL_9;
    }

    __break(1u);
    return result;
  }

uint64_t sub_33A0C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 copilotFusedControllers];
  uint64_t v5 = sub_34D00(0LL, &qword_564E0, &classRef_GCSCopilotFusedController);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  uint64_t v14 = v6;
  id v7 = v2;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v9 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v8 = *(void *)((char *)&dword_18 + (v14 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 >= v8 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1LL);
  }
  uint64_t v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
  specialized Array._endMutation()(v10);
  if (v3)
  {
    uint64_t v11 = swift_bridgeObjectRetain(v14);
    sub_29EE8(v11, (uint64_t)nullsub_1, 0LL);
    swift_bridgeObjectRelease(v14);
  }

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  [v1 setCopilotFusedControllers:isa];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v1) + 16])();
}

uint64_t sub_33B68()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 profiles];
  uint64_t v5 = sub_34D00(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  uint64_t v14 = v6;
  id v7 = v2;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v9 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v8 = *(void *)((char *)&dword_18 + (v14 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 >= v8 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1LL);
  }
  uint64_t v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
  specialized Array._endMutation()(v10);
  if (v3)
  {
    uint64_t v11 = swift_bridgeObjectRetain(v14);
    sub_29F50(v11, (uint64_t)j_nullsub_1_4, 0LL);
    swift_bridgeObjectRelease(v14);
  }

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  [v1 setProfiles:isa];

  return (*(uint64_t (**)(void))&stru_248.segname[(swift_isaMask & *v1) + 16])();
}

uint64_t sub_33CC4()
{
  return sub_24C48(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

void sub_33CD0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 mouseProfiles];
  uint64_t v5 = sub_34D00(0LL, &qword_56530, &classRef_GCSMouseProfile);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  uint64_t v13 = v6;
  id v7 = v2;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  unint64_t v9 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v8 = *(void *)((char *)&dword_18 + (v13 & 0xFFFFFFFFFFFFFF8LL));
  if (v9 >= v8 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1LL);
  }
  uint64_t v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
  specialized Array._endMutation()(v10);
  if (v3)
  {
    uint64_t v11 = swift_bridgeObjectRetain(v13);
    sub_29F6C(v11);
    swift_bridgeObjectRelease(v13);
  }

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  [v1 setMouseProfiles:isa];
}

void sub_33E00()
{
}

void sub_33E10()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  int v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 mouseProfiles];
  uint64_t v6 = sub_34D00(0LL, &qword_56530, &classRef_GCSMouseProfile);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  swift_bridgeObjectRetain(v7);
  unint64_t v8 = sub_2437C(v2, v7, &qword_56530, &classRef_GCSMouseProfile);
  LOBYTE(v2) = v9;
  swift_bridgeObjectRelease(v7);
  if ((v2 & 1) == 0)
  {
    id v10 = v3;
    uint64_t v15 = v7;
    if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v7)
      || v7 < 0
      || (v7 & 0x4000000000000000LL) != 0)
    {
      uint64_t v7 = sub_308C0(v7);
      uint64_t v15 = v7;
    }

    if ((v8 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (v8 < *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8LL)))
    {
      uint64_t v11 = *(void **)((char *)&stru_20.cmd + 8 * v8 + (v7 & 0xFFFFFFFFFFFFFF8LL));
      *(void *)((char *)&stru_20.cmd + 8 * v8 + (v7 & 0xFFFFFFFFFFFFFF8LL)) = v10;

      specialized Array._endMutation()(v12);
      uint64_t v7 = v15;
      goto LABEL_9;
    }

    __break(1u);
    return;
  }

uint64_t sub_33F94()
{
  return swift_deallocObject(v0, 33LL, 7LL);
}

void sub_33FC0()
{
}

uint64_t sub_33FD0()
{
  return swift_deallocObject(v0, 41LL, 7LL);
}

uint64_t sub_34004()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 allControllers];
  uint64_t v6 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  id v8 = v2;
  uint64_t v9 = swift_bridgeObjectRetain(v7);
  unint64_t v10 = sub_3510C(v9, v8);
  LOBYTE(v2) = v11;

  swift_bridgeObjectRelease(v7);
  if ((v2 & 1) == 0)
  {
    id v12 = v3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject(v7);
    uint64_t v18 = v7;
    if (!(_DWORD)result || v7 < 0 || (v7 & 0x4000000000000000LL) != 0)
    {
      uint64_t result = sub_308C0(v7);
      uint64_t v7 = result;
      uint64_t v18 = result;
    }

    if ((v10 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (v10 < *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8LL)))
    {
      uint64_t v14 = *(void **)((char *)&stru_20.cmd + 8 * v10 + (v7 & 0xFFFFFFFFFFFFFF8LL));
      *(void *)((char *)&stru_20.cmd + 8 * v10 + (v7 & 0xFFFFFFFFFFFFFF8LL)) = v12;

      specialized Array._endMutation()(v15);
      uint64_t v7 = v18;
      goto LABEL_9;
    }

    __break(1u);
    return result;
  }

uint64_t sub_341A8()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 33LL, 7LL);
}

uint64_t sub_341D4()
{
  return sub_266F8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t type metadata accessor for GCSPreferencesStore(uint64_t a1)
{
  uint64_t result = qword_56F20;
  if (!qword_56F20) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for GCSPreferencesStore);
  }
  return result;
}

uint64_t sub_3421C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_34248()
{
  return (*(uint64_t (**)(void))&stru_2E8.segname[(swift_isaMask & **(void **)(v0 + 16)) + 8])();
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

void *sub_3429C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_342C0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_342F4()
{
  uint64_t v1 = v0;
  uint64_t v3 = v0[2];
  uint64_t v2 = (void *)v0[3];
  int v4 = (void *)v0[4];
  id v5 = (void *)v1[5];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"profiles");
  if (v6 == v3 && v7 == v2)
  {
    swift_bridgeObjectRelease(v2);
    return sub_2C824();
  }

  uint64_t v9 = v7;
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, v3, v2, 0LL);
  swift_bridgeObjectRelease(v9);
  if ((v10 & 1) != 0) {
    return sub_2C824();
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"games");
  uint64_t v14 = v13;
  if (v12 == v3 && v13 == v2)
  {
    swift_bridgeObjectRelease(v2);
    return sub_2C00C();
  }

  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, v3, v2, 0LL);
  swift_bridgeObjectRelease(v14);
  if ((v15 & 1) != 0) {
    return sub_2C00C();
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"controllers");
  uint64_t v18 = v17;
  if (v16 == v3 && v17 == v2)
  {
    swift_bridgeObjectRelease(v2);
    return sub_2B7F4();
  }

  char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v3, v2, 0LL);
  swift_bridgeObjectRelease(v18);
  if ((v19 & 1) != 0) {
    return sub_2B7F4();
  }
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"copilotFusedControllers");
  Swift::Int v22 = v21;
  if (v20 == v3 && v21 == v2)
  {
    swift_bridgeObjectRelease(v2);
    return sub_2AFDC();
  }

  char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, v3, v2, 0LL);
  swift_bridgeObjectRelease(v22);
  if ((v23 & 1) != 0) {
    return sub_2AFDC();
  }
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"settingsVersion");
  id v26 = v25;
  if (v24 == v3 && v25 == v2)
  {
    swift_bridgeObjectRelease(v2);
    return sub_2D580();
  }

  char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, v3, v2, 0LL);
  swift_bridgeObjectRelease(v26);
  if ((v27 & 1) != 0) {
    return sub_2D580();
  }
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"bluetoothPrefsMenuLongPressAction");
  uint64_t v30 = v29;
  if (v28 == v3 && v29 == v2)
  {
    swift_bridgeObjectRelease(v2);
    goto LABEL_32;
  }

  char v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v3, v2, 0LL);
  swift_bridgeObjectRelease(v30);
  if ((v31 & 1) != 0)
  {
LABEL_32:
    id v32 = [v5 BOOLForKey:@"bluetoothPrefsMenuLongPressAction"];
    uint64_t result = (uint64_t)[v4 longPressMenuOpensLaunchPad];
    if ((_DWORD)v32 != (_DWORD)result) {
      return (uint64_t)[v4 setLongPressMenuOpensLaunchPad:v32];
    }
    return result;
  }

  swift_beginAccess(&qword_563B0, v42, 0LL, 0LL);
  uint64_t v33 = off_563B8;
  if (qword_563B0 == v3 && off_563B8 == v2
    || (_stringCompareWithSmolCheck(_:_:expecting:)(qword_563B0, off_563B8, v3, v2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRetain(v33);
    NSString v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v33);
    unsigned int v35 = [v5 BOOLForKey:v34];

    uint64_t result = (uint64_t)[v4 naturalThumbstickScrollDirection];
    if (v35 == (_DWORD)result) {
      return (uint64_t)[v4 setNaturalThumbstickScrollDirection:v35 ^ 1];
    }
  }

  else
  {
    swift_beginAccess(&qword_563C0, &v41, 0LL, 0LL);
    id v36 = off_563C8;
    if (qword_563C0 == v3 && off_563C8 == v2
      || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(qword_563C0, off_563C8, v3, v2, 0LL), (result & 1) != 0))
    {
      swift_bridgeObjectRetain(v36);
      NSString v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v36);
      [v5 doubleForKey:v37];
      double v39 = v38;

      uint64_t result = (uint64_t)[v4 thumbstickScrollingSpeed];
      if (v39 != v40) {
        return (uint64_t)[v4 setThumbstickScrollingSpeed:v39];
      }
    }
  }

  return result;
}

void sub_3471C()
{
}

void *sub_34724()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_34730()
{
  return type metadata accessor for GCSPreferencesStore(0LL);
}

void sub_34738(uint64_t a1)
{
  v22[0] = &unk_480E8;
  v22[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_34964(319LL, &qword_565A8, &qword_563E0);
  if (v3 <= 0x3F)
  {
    _OWORD v22[2] = *(void *)(v2 - 8) + 64LL;
    sub_34964(319LL, &qword_565B0, &qword_563F8);
    if (v5 <= 0x3F)
    {
      v22[3] = *(void *)(v4 - 8) + 64LL;
      sub_34964(319LL, &qword_565B8, &qword_56410);
      if (v7 <= 0x3F)
      {
        v22[4] = *(void *)(v6 - 8) + 64LL;
        sub_34964(319LL, &qword_565C0, &qword_56428);
        if (v9 <= 0x3F)
        {
          v22[5] = *(void *)(v8 - 8) + 64LL;
          sub_34964(319LL, &qword_565C8, &qword_56448);
          if (v11 <= 0x3F)
          {
            v22[6] = *(void *)(v10 - 8) + 64LL;
            sub_34964(319LL, &qword_565D0, &qword_56460);
            if (v13 <= 0x3F)
            {
              v22[7] = *(void *)(v12 - 8) + 64LL;
              sub_34964(319LL, &qword_565D8, &qword_56478);
              if (v15 <= 0x3F)
              {
                v22[8] = *(void *)(v14 - 8) + 64LL;
                sub_34964(319LL, &qword_565E0, &qword_56490);
                if (v17 <= 0x3F)
                {
                  v22[9] = *(void *)(v16 - 8) + 64LL;
                  sub_34D74( 319LL,  &qword_565E8,  (uint64_t)&type metadata for Bool,  (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
                  if (v19 <= 0x3F)
                  {
                    uint64_t v23 = *(void *)(v18 - 8) + 64LL;
                    uint64_t v24 = v23;
                    sub_34D74( 319LL,  &qword_565F0,  (uint64_t)&type metadata for Double,  (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
                    if (v21 <= 0x3F)
                    {
                      uint64_t v25 = *(void *)(v20 - 8) + 64LL;
                      swift_updateClassMetadata2(a1, 256LL, 13LL, v22, a1 + 80);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void sub_34964(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    uint64_t v5 = sub_1CAC0(a3);
    unint64_t v6 = type metadata accessor for Published(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

uint64_t sub_349B0()
{
  return sub_336DC( &qword_56600,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_48160);
}

uint64_t sub_349DC()
{
  return sub_336DC( &qword_56608,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_48134);
}

uint64_t sub_34A08()
{
  return sub_336DC( &qword_56610,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_481D0);
}

uint64_t sub_34A34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_18140(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_34A7C()
{
  return sub_2A7A8( *(void *)(v0 + 16),  *(char **)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  (uint64_t)@"games",  (uint64_t)@"games",  "Saving games...",  (uint64_t)&unk_4DA38,  (uint64_t)sub_34AD4,  (uint64_t)&unk_4DA50);
}

uint64_t sub_34AD8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_34B04()
{
  return sub_2A1EC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_34B10()
{
  return sub_2A7A8( *(void *)(v0 + 16),  *(char **)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  (uint64_t)@"profiles",  (uint64_t)@"profiles",  "Saving profiles...",  (uint64_t)&unk_4DB28,  (uint64_t)sub_34B68,  (uint64_t)&unk_4DB40);
}

uint64_t sub_34B70()
{
  return sub_2A7A8( *(void *)(v0 + 16),  *(char **)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  (uint64_t)@"controllers",  (uint64_t)@"controllers",  "Saving controllers...",  (uint64_t)&unk_4DBC8,  (uint64_t)sub_34BC8,  (uint64_t)&unk_4DBE0);
}

uint64_t sub_34BD0()
{
  swift_release(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_34C04()
{
  return sub_2A7A8( *(void *)(v0 + 16),  *(char **)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  (uint64_t)@"copilotFusedControllers",  (uint64_t)@"copilotFusedControllers",  "Saving copilot fused controllers...",  (uint64_t)&unk_4DC68,  (uint64_t)sub_34C88,  (uint64_t)&unk_4DC80);
}

uint64_t sub_34C5C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_34C8C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v5 = *(void *)(v0 + 32);
    }
    else {
      uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v5);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
  }

  return v1(v3, 0LL);
}

uint64_t sub_34D00(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_34D38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_18140(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void sub_34D74(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0LL, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }

uint64_t sub_34DB8()
{
  return sub_2478C(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_34DC4(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  while (v2)
  {
    for (uint64_t i = 0LL; ; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      }
      else {
        id v4 = *(id *)(a1 + 8 * i + 32);
      }
      unint64_t v5 = v4;
      uint64_t v6 = GCSGame.id.getter();
      uint64_t v8 = v7;
      uint64_t v10 = GCSGame.id.getter();
      uint64_t v11 = v9;
      if (v6 == v10 && v8 == v9)
      {

        swift_bridgeObjectRelease_n(v8, 2LL);
        return i;
      }

      char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, v10, v9, 0LL);

      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRelease(v11);
      if ((v12 & 1) != 0) {
        return i;
      }
      uint64_t v13 = i + 1;
      if (__OFADD__(i, 1LL)) {
        break;
      }
      if (v13 == v2) {
        return 0LL;
      }
    }

    __break(1u);
LABEL_16:
    if (a1 < 0) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(a1);
  }

  return 0LL;
}

uint64_t sub_34F30(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v24 = a2;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v21 - v9;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    if (v11) {
      goto LABEL_3;
    }
    return 0LL;
  }

uint64_t sub_3510C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  while (v5)
  {
    uint64_t v6 = 0LL;
    uint64_t v21 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, "persistentIdentifier", v21);
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      uint64_t v12 = v11;

      id v13 = [a2 persistentIdentifier];
      uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      uint64_t v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n(v12, 2LL);
        return v6;
      }

      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, v3, v15, 0LL);

      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v15);
      if ((v17 & 1) != 0) {
        return v6;
      }
      uint64_t v18 = v6 + 1;
      if (__OFADD__(v6, 1LL)) {
        break;
      }
      ++v6;
      if (v18 == v5) {
        return 0LL;
      }
    }

    __break(1u);
LABEL_18:
    if (a1 < 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v19);
    swift_bridgeObjectRelease(a1);
  }

  return 0LL;
}

uint64_t sub_352B0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_1CAC0(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_352F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_18140(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_35334()
{
  return sub_336DC( (unint64_t *)&unk_56730,  (uint64_t (*)(uint64_t))type metadata accessor for GCSCompatibilityMode,  (uint64_t)&unk_47A04);
}

uint64_t sub_35360()
{
  return sub_336DC( &qword_56138,  (uint64_t (*)(uint64_t))type metadata accessor for GCSCompatibilityMode,  (uint64_t)"}X");
}

uint64_t sub_3538C()
{
  return sub_336DC( (unint64_t *)&unk_56740,  (uint64_t (*)(uint64_t))type metadata accessor for GCSCompatibilityMode,  (uint64_t)&unk_47A6C);
}

void sub_353B8()
{
}

uint64_t sub_35500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t sub_35538(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40LL))(v1, a1, v3);
}

uint64_t (*sub_35570())()
{
  return nullsub_2;
}

uint64_t sub_35584()
{
  return sub_199DC(0xD000000000000020LL, (void *)0x8000000000041DA0LL);
}

uint64_t sub_355A0()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 20));
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t type metadata accessor for GCSProfileParams(uint64_t a1)
{
  uint64_t result = qword_576B0;
  if (!qword_576B0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for GCSProfileParams);
  }
  return result;
}

uint64_t sub_35618(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 20));
  uint64_t result = swift_bridgeObjectRelease(v5[1]);
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_3565C())()
{
  return nullsub_3;
}

uint64_t sub_35688()
{
  return 0LL;
}

uint64_t sub_35694()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 24));
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t sub_356D0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 24));
  uint64_t result = swift_bridgeObjectRelease(v5[1]);
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_35714())()
{
  return nullsub_4;
}

uint64_t sub_35740()
{
  return 0LL;
}

uint64_t sub_3574C()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 28));
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t sub_35788(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 28));
  uint64_t result = swift_bridgeObjectRelease(v5[1]);
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_357CC())()
{
  return nullsub_5;
}

uint64_t sub_357F8()
{
  return 0LL;
}

uint64_t sub_35800()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 32));
}

uint64_t sub_35820(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(_BYTE *)(v1 + *(int *)(result + swift_bridgeObjectRelease(*(void *)(v0 + 32)) = a1;
  return result;
}

uint64_t (*sub_3584C())()
{
  return nullsub_6;
}

uint64_t sub_35878()
{
  return 1LL;
}

uint64_t sub_35880()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 36));
}

uint64_t sub_358A0(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(_BYTE *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*sub_358CC())()
{
  return nullsub_7;
}

unint64_t sub_358F8()
{
  return 0xD000000000000013LL;
}

uint64_t sub_35914()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 40));
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t sub_35950(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 40));
  uint64_t result = swift_bridgeObjectRelease(v5[1]);
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_35994())()
{
  return nullsub_8;
}

unint64_t sub_359C0()
{
  return sub_359CC((uint64_t)_swiftEmptyArrayStorage);
}

unint64_t sub_359CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    id v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_18140(&qword_56830);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  id v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v6 - 2);
    uint64_t v8 = (uint64_t)*(v6 - 1);
    id v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_19588(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v13 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    _OWORD v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_35AE4()
{
  uint64_t v1 = type metadata accessor for GCSProfileParams(0LL);
  return swift_bridgeObjectRetain(*(void *)(v0 + *(int *)(v1 + 44)));
}

uint64_t sub_35B04(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GCSProfileParams(0LL) + 44);
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + v3));
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*sub_35B40())()
{
  return nullsub_9;
}

uint64_t sub_35B6C()
{
  return 0LL;
}

uint64_t sub_35B74()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 48));
}

uint64_t sub_35B94(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(_BYTE *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*sub_35BC0())()
{
  return nullsub_10;
}

double sub_35BEC()
{
  return 1.0;
}

double sub_35BF4()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 52));
}

uint64_t sub_35C14(double a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(double *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*sub_35C40())()
{
  return nullsub_11;
}

uint64_t sub_35C6C()
{
  return 1LL;
}

uint64_t sub_35C74()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 56));
}

uint64_t sub_35C94(uint64_t a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(void *)(v1 + *(int *)(result + 56)) = a1;
  return result;
}

uint64_t (*sub_35CC0())()
{
  return nullsub_12;
}

uint64_t sub_35CEC()
{
  return 2LL;
}

uint64_t sub_35CF4()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 60));
}

uint64_t sub_35D14(uint64_t a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(void *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*sub_35D40())()
{
  return nullsub_13;
}

uint64_t sub_35D6C()
{
  return 0LL;
}

uint64_t sub_35D74()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 64));
}

uint64_t sub_35D94(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(_BYTE *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

uint64_t (*sub_35DC0())()
{
  return nullsub_14;
}

uint64_t sub_35DEC()
{
  return 0LL;
}

uint64_t sub_35DF4()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 68));
}

uint64_t sub_35E14(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(_BYTE *)(v1 + *(int *)(result + 68)) = a1;
  return result;
}

uint64_t (*sub_35E40())()
{
  return nullsub_15;
}

uint64_t sub_35E6C()
{
  return 0LL;
}

uint64_t sub_35E74()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 72));
}

uint64_t sub_35E94(uint64_t a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams(0LL);
  *(void *)(v1 + *(int *)(result + 72)) = a1;
  return result;
}

uint64_t (*sub_35EC0())()
{
  return nullsub_16;
}

uint64_t sub_35EEC(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + *(int *)(type metadata accessor for GCSProfileParams(0LL) + 44));
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(a1);
  int64_t v9 = 0LL;
  int64_t v41 = v8;
  while (v7)
  {
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    BOOL v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v16);
    id v19 = v18;
    if ([v19 isCustomized])
    {
      id v24 = v19;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
      unint64_t v27 = sub_19588(v17, v16);
      uint64_t v28 = v3[2];
      BOOL v29 = (v26 & 1) == 0;
      uint64_t v30 = v28 + v29;
      if (__OFADD__(v28, v29)) {
        goto LABEL_41;
      }
      char v31 = v26;
      if (v3[3] >= v30)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          int64_t v8 = v41;
          if ((v26 & 1) != 0) {
            goto LABEL_33;
          }
        }

        else
        {
          sub_37898();
          int64_t v8 = v41;
          if ((v31 & 1) != 0) {
            goto LABEL_33;
          }
        }
      }

      else
      {
        sub_373B8(v30, isUniquelyReferenced_nonNull_native);
        unint64_t v32 = sub_19588(v17, v16);
        if ((v31 & 1) != (v33 & 1)) {
          goto LABEL_43;
        }
        unint64_t v27 = v32;
        int64_t v8 = v41;
        if ((v31 & 1) != 0)
        {
LABEL_33:
          uint64_t v34 = v3[7];
          uint64_t v35 = 8 * v27;

          *(void *)(v34 + v35) = v24;
          goto LABEL_37;
        }
      }

      v3[(v27 >> 6) + 8] |= 1LL << v27;
      id v36 = (uint64_t *)(v3[6] + 16 * v27);
      uint64_t *v36 = v17;
      v36[1] = v16;
      *(void *)(v3[7] + 8 * v27) = v24;
      uint64_t v37 = v3[2];
      BOOL v38 = __OFADD__(v37, 1LL);
      uint64_t v39 = v37 + 1;
      if (v38) {
        goto LABEL_42;
      }
      v3[2] = v39;
      swift_bridgeObjectRetain(v16);
LABEL_37:

      swift_bridgeObjectRelease(v16);
      swift_bridgeObjectRelease(0x8000000000000000LL);
      uint64_t v4 = a1 + 64;
    }

    else
    {
      swift_bridgeObjectRetain(v3);
      unint64_t v20 = sub_19588(v17, v16);
      char v22 = v21;
      swift_bridgeObjectRelease(v3);
      if ((v22 & 1) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0) {
          sub_37898();
        }
        swift_bridgeObjectRelease(*(void *)(v3[6] + 16 * v20 + 8));
        uint64_t v23 = *(void **)(v3[7] + 8 * v20);
        sub_376C4(v20, (uint64_t)v3);
        swift_bridgeObjectRelease(v16);

        swift_bridgeObjectRelease(0x8000000000000000LL);
      }

      else
      {
        swift_bridgeObjectRelease(v16);
      }
    }
  }

  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1LL))
  {
    __break(1u);
    goto LABEL_40;
  }

  if (v12 >= v8) {
    goto LABEL_38;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v8) {
    goto LABEL_38;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v8) {
    goto LABEL_38;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v7 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }

  int64_t v14 = v12 + 3;
  if (v14 >= v8)
  {
LABEL_38:
    swift_release(a1);
    return (uint64_t)v3;
  }

  unint64_t v13 = *(void *)(v4 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_38;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }

void sub_3624C(uint64_t a1, uint64_t a2)
{
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v4 = 0LL;
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v7 = -1LL;
  if (v6 < 64) {
    uint64_t v7 = ~(-1LL << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }

    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1LL))
    {
      __break(1u);
      goto LABEL_31;
    }

    if (v12 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }

LABEL_31:
  __break(1u);
}

unint64_t sub_36440@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (int *)type metadata accessor for GCSProfileParams(0LL);
  uint64_t v3 = (uint64_t *)(a1 + v2[5]);
  uint64_t *v3 = sub_199DC(0xD000000000000020LL, (void *)0x8000000000041DA0LL);
  v3[1] = v4;
  uint64_t v5 = (void *)(a1 + v2[6]);
  void *v5 = 0LL;
  v5[1] = 0LL;
  uint64_t v6 = (void *)(a1 + v2[7]);
  void *v6 = 0LL;
  v6[1] = 0LL;
  *(_BYTE *)(a1 + v2[8]) = 0;
  *(_BYTE *)(a1 + v2[9]) = 1;
  uint64_t v7 = (void *)(a1 + v2[10]);
  void *v7 = 0xD000000000000013LL;
  v7[1] = 0x8000000000041DD0LL;
  uint64_t v8 = v2[11];
  unint64_t result = sub_359CC((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(a1 + v8) = result;
  *(_BYTE *)(a1 + v2[12]) = 0;
  *(void *)(a1 + v2[13]) = 0x3FF0000000000000LL;
  *(void *)(a1 + v2[14]) = 1LL;
  *(void *)(a1 + v2[15]) = 2LL;
  *(_BYTE *)(a1 + v2[16]) = 0;
  *(_BYTE *)(a1 + v2[17]) = 0;
  *(void *)(a1 + v2[18]) = 0LL;
  return result;
}

uint64_t sub_36540()
{
  return sub_199DC(0xD000000000000020LL, (void *)0x8000000000041DA0LL);
}

uint64_t sub_3655C()
{
  return 0LL;
}

uint64_t sub_36568()
{
  return 0LL;
}

uint64_t sub_36574()
{
  return 0LL;
}

uint64_t sub_3657C()
{
  return 1LL;
}

unint64_t sub_36584()
{
  return 0xD000000000000013LL;
}

unint64_t sub_365A0()
{
  return sub_359CC((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_365AC()
{
  return 0LL;
}

double sub_365B4()
{
  return 1.0;
}

uint64_t sub_365BC()
{
  return 1LL;
}

uint64_t sub_365C4()
{
  return 2LL;
}

uint64_t sub_365CC()
{
  return 0LL;
}

uint64_t sub_365D4()
{
  return 0LL;
}

uint64_t sub_365DC()
{
  return 0LL;
}

int *sub_365E4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, char a19, uint64_t a20)
{
  uint64_t v27 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32LL))(a9, a1, v27);
  unint64_t result = (int *)type metadata accessor for GCSProfileParams(0LL);
  BOOL v29 = (void *)(a9 + result[5]);
  *BOOL v29 = a2;
  v29[1] = a3;
  uint64_t v30 = (void *)(a9 + result[6]);
  *uint64_t v30 = a4;
  v30[1] = a5;
  char v31 = (void *)(a9 + result[7]);
  *char v31 = a6;
  v31[1] = a7;
  *(_BYTE *)(a9 + result[8]) = a8;
  *(_BYTE *)(a9 + result[9]) = a11;
  unint64_t v32 = (void *)(a9 + result[10]);
  *unint64_t v32 = a12;
  v32[1] = a13;
  *(void *)(a9 + result[11]) = a14;
  *(_BYTE *)(a9 + result[12]) = a15;
  *(double *)(a9 + result[13]) = a10;
  *(void *)(a9 + result[14]) = a16;
  *(void *)(a9 + result[15]) = a17;
  *(_BYTE *)(a9 + result[16]) = a18;
  *(_BYTE *)(a9 + result[17]) = a19;
  *(void *)(a9 + result[18]) = a20;
  return result;
}

uint64_t sub_3675C(void *a1, void *a2)
{
  uint64_t v26 = type metadata accessor for Date(0LL);
  uint64_t v28 = *(void *)(v26 - 8);
  uint64_t v4 = __chkstk_darwin(v26);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  BOOL v15 = (char *)&v25 - v14;
  id v16 = [a1 uuid];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  id v27 = a2;
  id v17 = [a2 uuid];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v17) = static UUID.== infix(_:_:)(v15, v13);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
  if ((v17 & 1) != 0)
  {
    id v19 = [a1 modifiedDate];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    id v20 = [v27 modifiedDate];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    char v21 = static Date.== infix(_:_:)(v8, v6);
    char v22 = *(void (**)(char *, uint64_t))(v28 + 8);
    uint64_t v23 = v26;
    v22(v6, v26);
    v22(v8, v23);
  }

  else
  {
    char v21 = 0;
  }

  return v21 & 1;
}

id sub_3695C(uint64_t a1)
{
  uint64_t v2 = v1;
  v21.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
  uint64_t v4 = (int *)type metadata accessor for GCSProfileParams(0LL);
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t v6 = a1 + v4[6];
  uint64_t v7 = *(void *)(v6 + 8);
  if (v7)
  {
    swift_bridgeObjectRetain(*(void *)(v6 + 8));
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    NSString v8 = 0LL;
  }

  uint64_t v9 = a1 + v4[7];
  uint64_t v10 = *(void *)(v9 + 8);
  if (v10)
  {
    swift_bridgeObjectRetain(*(void *)(v9 + 8));
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }

  else
  {
    NSString v11 = 0LL;
  }

  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  uint64_t v13 = *(unsigned __int8 *)(a1 + v4[8]);
  uint64_t v14 = *(unsigned __int8 *)(a1 + v4[9]);
  NSString v15 = String._bridgeToObjectiveC()();
  sub_3860C(0LL, &qword_56760, &classRef_GCSElementMapping);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  BYTE1(v20) = *(_BYTE *)(a1 + v4[17]);
  LOBYTE(v20) = *(_BYTE *)(a1 + v4[16]);
  LOBYTE(v19) = *(_BYTE *)(a1 + v4[12]);
  id v17 = objc_msgSend( v12,  "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:e lementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOve rride:lightbarCustomColorEnabled:lightbarColor:",  v21.super.isa,  v5,  v8,  v11,  v13,  v14,  *(double *)(a1 + v4[13]),  v15,  isa,  v19,  *(void *)(a1 + v4[14]),  *(void *)(a1 + v4[15]),  v20,  *(void *)(a1 + v4[18]));

  sub_37C58(a1);
  return v17;
}

int *sub_36B4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = [v1 uuid];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v7);

  id v8 = [v2 name];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v48 = v10;
  uint64_t v49 = v9;

  id v11 = [v2 persistentControllerIdentifier];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v46 = v14;
    uint64_t v47 = v13;
  }

  else
  {
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
  }

  id v15 = [v2 gameBundleIdentifier];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    uint64_t v44 = v18;
    uint64_t v45 = v17;
  }

  else
  {
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
  }

  unsigned int v43 = [v2 isBaseProfile];
  unsigned int v42 = [v2 customizable];
  id v19 = [v2 sfSymbolsName];
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  uint64_t v21 = v20;

  id v22 = [v2 elementMappings];
  uint64_t v23 = sub_3860C(0LL, &qword_56760, &classRef_GCSElementMapping);
  uint64_t v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v22,  &type metadata for String,  v23,  &protocol witness table for String);

  unsigned __int8 v25 = [v2 hapticFeedbackOverride];
  [v2 hapticStrength];
  uint64_t v27 = v26;
  id v28 = [v2 doublePressShareGesture];
  id v29 = [v2 longPressShareGesture];
  unsigned __int8 v30 = [v2 lightbarOverride];
  unsigned __int8 v31 = [v2 lightbarCustomColorEnabled];
  id v32 = [v2 lightbarColor];
  (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(a1, v6, v51);
  unint64_t result = (int *)type metadata accessor for GCSProfileParams(0LL);
  uint64_t v34 = (uint64_t *)(a1 + result[5]);
  uint64_t v35 = v48;
  uint64_t *v34 = v49;
  v34[1] = v35;
  id v36 = (uint64_t *)(a1 + result[6]);
  uint64_t v37 = v46;
  uint64_t *v36 = v47;
  v36[1] = v37;
  BOOL v38 = (uint64_t *)(a1 + result[7]);
  uint64_t v39 = v44;
  uint64_t *v38 = v45;
  v38[1] = v39;
  *(_BYTE *)(a1 + result[8]) = v43;
  *(_BYTE *)(a1 + result[9]) = v42;
  double v40 = (uint64_t *)(a1 + result[10]);
  *double v40 = v41;
  v40[1] = v21;
  *(void *)(a1 + result[11]) = v24;
  *(_BYTE *)(a1 + result[12]) = v25;
  *(void *)(a1 + result[13]) = v27;
  *(void *)(a1 + result[14]) = v28;
  *(void *)(a1 + result[15]) = v29;
  *(_BYTE *)(a1 + result[16]) = v30;
  *(_BYTE *)(a1 + result[17]) = v31;
  *(void *)(a1 + result[18]) = v32;
  return result;
}

unint64_t sub_36E84()
{
  return 0xD000000000000013LL;
}

uint64_t sub_36EA0()
{
  return 1LL;
}

id sub_36EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v7 = v6;
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  uint64_t v14 = type metadata accessor for UUID(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a6, 1LL, v14) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a6, v14);
  }

  id v17 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)) initWithName:v12 sfSymbolsName:v13 customizable:a5 & 1 uuid:isa];

  return v17;
}

id sub_36F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = v6;
  int v31 = a5;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v30 = a2;
  uint64_t v10 = sub_18140(&qword_566C0);
  __chkstk_darwin(v10);
  NSString v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v17 = (int *)type metadata accessor for GCSProfileParams(0LL);
  __chkstk_darwin(v17);
  id v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t ObjectType = swift_getObjectType(v7);
  sub_37C94(a6, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13) == 1)
  {
    UUID.init()();
    sub_37CDC((uint64_t)v12);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  }

  unint64_t v21 = sub_359CC((uint64_t)_swiftEmptyArrayStorage);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v16, v13);
  id v22 = &v19[v17[5]];
  uint64_t v23 = v30;
  *(void *)id v22 = a1;
  *((void *)v22 + 1) = v23;
  uint64_t v24 = &v19[v17[6]];
  *(void *)uint64_t v24 = 0LL;
  *((void *)v24 + 1) = 0LL;
  unsigned __int8 v25 = &v19[v17[7]];
  *(void *)unsigned __int8 v25 = 0LL;
  *((void *)v25 + 1) = 0LL;
  v19[v17[8]] = 0;
  v19[v17[9]] = v31 & 1;
  uint64_t v26 = &v19[v17[10]];
  uint64_t v27 = v33;
  *(void *)uint64_t v26 = v32;
  *((void *)v26 + 1) = v27;
  *(void *)&v19[v17[11]] = v21;
  v19[v17[12]] = 0;
  *(void *)&v19[v17[13]] = 0x3FF0000000000000LL;
  *(void *)&v19[v17[14]] = 1LL;
  *(void *)&v19[v17[15]] = 2LL;
  v19[v17[16]] = 0;
  v19[v17[17]] = 0;
  *(void *)&v19[v17[18]] = 0LL;
  id v28 = sub_3695C((uint64_t)v19);
  sub_37CDC(a6);
  swift_deallocPartialClassInstance(v7, ObjectType, 8LL, 7LL);
  return v28;
}

uint64_t sub_372FC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_3860C(0LL, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
  uint64_t result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

void sub_37348(uint64_t *a1@<X8>)
{
  id v3 = [*v1 id];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

void *sub_3739C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_373AC(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_373B8(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_18140(&qword_56830);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  id v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          id v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v37) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

unint64_t sub_376C4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    Swift::Int result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v26, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        Swift::Int result = swift_bridgeObjectRelease(v11);
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }

        else if (v13 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *uint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          unint64_t v18 = (void *)(v17 + 8 * v3);
          id v19 = (void *)(v17 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
          {
            void *v18 = *v19;
            int64_t v3 = v6;
          }
        }

id sub_37898()
{
  uint64_t v1 = v0;
  sub_18140(&qword_56830);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

BOOL sub_37A48(uint64_t a1, uint64_t a2)
{
  if ((static UUID.== infix(_:_:)(a1, a2) & 1) == 0) {
    return 0LL;
  }
  uint64_t v4 = (int *)type metadata accessor for GCSProfileParams(0LL);
  uint64_t v5 = v4[5];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  unint64_t v8 = (void *)(a2 + v5);
  uint64_t v9 = v8[1];
  if (v6 != *v8 || v7 != v9)
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, *v8, v9, 0LL);
    BOOL result = 0LL;
    if ((v11 & 1) == 0) {
      return result;
    }
  }

  uint64_t v13 = v4[6];
  unint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = *(void *)(a1 + v13 + 8);
  uint64_t v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  if (v15)
  {
    if (!v17) {
      return 0LL;
    }
    if (*v14 != *v16 || v15 != v17)
    {
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, *v16, v17, 0LL);
      BOOL result = 0LL;
      if ((v19 & 1) == 0) {
        return result;
      }
    }
  }

  else if (v17)
  {
    return 0LL;
  }

  uint64_t v20 = v4[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = *(void *)(a1 + v20 + 8);
  unint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  if (!v22)
  {
    if (!v24) {
      goto LABEL_25;
    }
    return 0LL;
  }

  if (!v24) {
    return 0LL;
  }
  if (*v21 != *v23 || v22 != v24)
  {
    char v26 = _stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, *v23, v24, 0LL);
    BOOL result = 0LL;
    if ((v26 & 1) == 0) {
      return result;
    }
  }

uint64_t sub_37C58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GCSProfileParams(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_37C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18140(&qword_566C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_37CDC(uint64_t a1)
{
  uint64_t v2 = sub_18140(&qword_566C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_37D1C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

void *sub_37D28()
{
  return &protocol witness table for String;
}

void *sub_37D34(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *a2;
    *a1 = *a2;
    a1 = (void *)(v31 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v31);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    char v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)((char *)a1 + v9);
    unint64_t v14 = (void *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (void *)((char *)a1 + v16);
    char v19 = (void *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    *((_BYTE *)a1 + v17) = *((_BYTE *)a2 + v17);
    uint64_t v21 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    uint64_t v22 = (void *)((char *)a1 + v21);
    unint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[11];
    uint64_t v26 = a3[12];
    uint64_t v27 = *(void *)((char *)a2 + v25);
    *(void *)((char *)a1 + v25) = v27;
    *((_BYTE *)a1 + v26) = *((_BYTE *)a2 + v26);
    uint64_t v28 = a3[14];
    *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
    uint64_t v29 = a3[16];
    *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
    *((_BYTE *)a1 + v29) = *((_BYTE *)a2 + v29);
    uint64_t v30 = a3[18];
    *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *(void *)((char *)a1 + v30) = *(void *)((char *)a2 + v30);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v24);
    swift_bridgeObjectRetain(v27);
  }

  return a1;
}

uint64_t sub_37E90(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[7] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[10] + 8));
  return swift_bridgeObjectRelease(*(void *)(a1 + a2[11]));
}

uint64_t sub_37F14(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  uint64_t v20 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[11];
  uint64_t v25 = a3[12];
  uint64_t v26 = *(void *)(a2 + v24);
  *(void *)(a1 + v24) = v26;
  *(_BYTE *)(a1 + v25) = *(_BYTE *)(a2 + v25);
  uint64_t v27 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v28 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  uint64_t v29 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v26);
  return a1;
}

uint64_t sub_38044(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  void *v13 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  void *v18 = *v19;
  uint64_t v20 = v19[1];
  uint64_t v21 = v18[1];
  v18[1] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  void *v23 = *v24;
  uint64_t v25 = v24[1];
  uint64_t v26 = v23[1];
  v23[1] = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v26);
  uint64_t v27 = a3[11];
  uint64_t v28 = *(void *)(a2 + v27);
  uint64_t v29 = *(void *)(a1 + v27);
  *(void *)(a1 + v27) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_381CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t sub_382A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = v8[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v18 = v14[1];
  void *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v24 = v20[1];
  void *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease(v24);
  uint64_t v25 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v25) = *(_BYTE *)(a2 + v25);
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  uint64_t v31 = v27[1];
  void *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease(v31);
  uint64_t v32 = a3[11];
  uint64_t v33 = *(void *)(a1 + v32);
  *(void *)(a1 + v32) = *(void *)(a2 + v32);
  swift_bridgeObjectRelease(v33);
  uint64_t v34 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  *(void *)(a1 + v34) = *(void *)(a2 + v34);
  uint64_t v35 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v35) = *(void *)(a2 + v35);
  uint64_t v36 = a3[17];
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  *(_BYTE *)(a1 + v36) = *(_BYTE *)(a2 + v36);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_383D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_383E4);
}

uint64_t sub_383E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_38464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_38470);
}

uint64_t sub_38470(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_384EC(uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_483B8;
    _OWORD v4[2] = &unk_483D0;
    v4[3] = &unk_483D0;
    v4[4] = &unk_483E8;
    v4[5] = &unk_483E8;
    v4[6] = &unk_483B8;
    v4[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[8] = &unk_483E8;
    v4[9] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[10] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[11] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[12] = &unk_483E8;
    v4[13] = &unk_483E8;
    v4[14] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256LL, 15LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void type metadata accessor for GCSColorPreset(uint64_t a1)
{
}

void type metadata accessor for ShareGesture(uint64_t a1)
{
}

void sub_385C8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_3860C(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_3864C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

id sub_3865C()
{
  uint64_t v0 = type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id result = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  qword_577C8 = (uint64_t)result;
  return result;
}

uint64_t sub_386AC(uint64_t a1)
{
  return sub_3A434(a1, qword_57A68, 0x422F7375626D694ELL, 0xEB00000000657361LL);
}

uint64_t sub_386D4()
{
  return sub_3874C(&qword_577D0, (uint64_t)qword_57A68, (uint64_t)sub_386AC);
}

uint64_t sub_386F0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_577D0, (uint64_t)qword_57A68, (uint64_t)sub_386AC, a1);
}

uint64_t sub_3870C(uint64_t a1)
{
  return sub_3A434(a1, qword_57A80, 0xD000000000000010LL, 0x8000000000042670LL);
}

uint64_t sub_38730()
{
  return sub_3874C(&qword_577D8, (uint64_t)qword_57A80, (uint64_t)sub_3870C);
}

uint64_t sub_3874C(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v4 = type metadata accessor for ImageResource(0LL);
  return sub_1CC2C(v4, a2);
}

uint64_t sub_3878C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_577D8, (uint64_t)qword_57A80, (uint64_t)sub_3870C, a1);
}

uint64_t sub_387A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v6 = type metadata accessor for ImageResource(0LL);
  uint64_t v7 = sub_1CC2C(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a4, v7, v6);
}

uint64_t sub_38810(uint64_t a1)
{
  return sub_3A434(a1, qword_57A98, 0x422F7375626D694ELL, 0xEF41206E6F747475LL);
}

uint64_t sub_3883C()
{
  return sub_3874C(&qword_577E0, (uint64_t)qword_57A98, (uint64_t)sub_38810);
}

uint64_t sub_38858@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_577E0, (uint64_t)qword_57A98, (uint64_t)sub_38810, a1);
}

uint64_t sub_38874(uint64_t a1)
{
  return sub_3A434(a1, qword_57AB0, 0x422F7375626D694ELL, 0xEF42206E6F747475LL);
}

uint64_t sub_388A0()
{
  return sub_3874C(&qword_577E8, (uint64_t)qword_57AB0, (uint64_t)sub_38874);
}

uint64_t sub_388BC@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_577E8, (uint64_t)qword_57AB0, (uint64_t)sub_38874, a1);
}

uint64_t sub_388D8(uint64_t a1)
{
  return sub_3A434(a1, qword_57AC8, 0xD000000000000012LL, 0x8000000000042650LL);
}

uint64_t sub_388FC()
{
  return sub_3874C(&qword_577F0, (uint64_t)qword_57AC8, (uint64_t)sub_388D8);
}

uint64_t sub_38918@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_577F0, (uint64_t)qword_57AC8, (uint64_t)sub_388D8, a1);
}

uint64_t sub_38934(uint64_t a1)
{
  return sub_3A434(a1, qword_57AE0, 0x422F7375626D694ELL, 0xEF58206E6F747475LL);
}

uint64_t sub_38960()
{
  return sub_3874C(&qword_577F8, (uint64_t)qword_57AE0, (uint64_t)sub_38934);
}

uint64_t sub_3897C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_577F8, (uint64_t)qword_57AE0, (uint64_t)sub_38934, a1);
}

uint64_t sub_38998(uint64_t a1)
{
  return sub_3A434(a1, qword_57AF8, 0x422F7375626D694ELL, 0xEF59206E6F747475LL);
}

uint64_t sub_389C4()
{
  return sub_3874C(&qword_57800, (uint64_t)qword_57AF8, (uint64_t)sub_38998);
}

uint64_t sub_389E0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57800, (uint64_t)qword_57AF8, (uint64_t)sub_38998, a1);
}

uint64_t sub_389FC(uint64_t a1)
{
  return sub_3A434(a1, qword_57B10, 0xD000000000000014LL, 0x8000000000042630LL);
}

uint64_t sub_38A20()
{
  return sub_3874C(&qword_57808, (uint64_t)qword_57B10, (uint64_t)sub_389FC);
}

uint64_t sub_38A3C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57808, (uint64_t)qword_57B10, (uint64_t)sub_389FC, a1);
}

uint64_t sub_38A58(uint64_t a1)
{
  return sub_3A434(a1, qword_57B28, 0xD000000000000014LL, 0x8000000000042610LL);
}

uint64_t sub_38A7C()
{
  return sub_3874C(&qword_57810, (uint64_t)qword_57B28, (uint64_t)sub_38A58);
}

uint64_t sub_38A98@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57810, (uint64_t)qword_57B28, (uint64_t)sub_38A58, a1);
}

uint64_t sub_38AB4(uint64_t a1)
{
  return sub_3A434(a1, qword_57B40, 0xD000000000000016LL, 0x80000000000425F0LL);
}

uint64_t sub_38AD8()
{
  return sub_3874C(&qword_57818, (uint64_t)qword_57B40, (uint64_t)sub_38AB4);
}

uint64_t sub_38AF4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57818, (uint64_t)qword_57B40, (uint64_t)sub_38AB4, a1);
}

uint64_t sub_38B10(uint64_t a1)
{
  return sub_3A434(a1, qword_57B58, 0xD000000000000013LL, 0x80000000000425D0LL);
}

uint64_t sub_38B34()
{
  return sub_3874C(&qword_57820, (uint64_t)qword_57B58, (uint64_t)sub_38B10);
}

uint64_t sub_38B50@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57820, (uint64_t)qword_57B58, (uint64_t)sub_38B10, a1);
}

uint64_t sub_38B6C(uint64_t a1)
{
  return sub_3A434(a1, qword_57B70, 0xD000000000000015LL, 0x80000000000425B0LL);
}

uint64_t sub_38B90()
{
  return sub_3874C(&qword_57828, (uint64_t)qword_57B70, (uint64_t)sub_38B6C);
}

uint64_t sub_38BAC@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57828, (uint64_t)qword_57B70, (uint64_t)sub_38B6C, a1);
}

uint64_t sub_38BC8(uint64_t a1)
{
  return sub_3A434(a1, qword_57B88, 0xD000000000000017LL, 0x8000000000042590LL);
}

uint64_t sub_38BEC()
{
  return sub_3874C(&qword_57830, (uint64_t)qword_57B88, (uint64_t)sub_38BC8);
}

uint64_t sub_38C08@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57830, (uint64_t)qword_57B88, (uint64_t)sub_38BC8, a1);
}

uint64_t sub_38C24(uint64_t a1)
{
  return sub_3A434(a1, qword_57BA0, 0xD000000000000014LL, 0x8000000000042570LL);
}

uint64_t sub_38C48()
{
  return sub_3874C(&qword_57838, (uint64_t)qword_57BA0, (uint64_t)sub_38C24);
}

uint64_t sub_38C64@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57838, (uint64_t)qword_57BA0, (uint64_t)sub_38C24, a1);
}

uint64_t sub_38C80(uint64_t a1)
{
  return sub_3A434(a1, qword_57BB8, 0x542F7375626D694ELL, 0xEA0000000000706FLL);
}

uint64_t sub_38CA4()
{
  return sub_3874C(&qword_57840, (uint64_t)qword_57BB8, (uint64_t)sub_38C80);
}

uint64_t sub_38CC0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57840, (uint64_t)qword_57BB8, (uint64_t)sub_38C80, a1);
}

uint64_t sub_38CDC(uint64_t a1)
{
  return sub_3A434(a1, qword_57BD0, 0xD000000000000012LL, 0x8000000000042550LL);
}

uint64_t sub_38D00()
{
  return sub_3874C(&qword_57848, (uint64_t)qword_57BD0, (uint64_t)sub_38CDC);
}

uint64_t sub_38D1C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57848, (uint64_t)qword_57BD0, (uint64_t)sub_38CDC, a1);
}

uint64_t sub_38D38(uint64_t a1)
{
  return sub_3A434(a1, qword_57BE8, 0xD000000000000016LL, 0x8000000000042530LL);
}

uint64_t sub_38D5C()
{
  return sub_3874C(&qword_57850, (uint64_t)qword_57BE8, (uint64_t)sub_38D38);
}

uint64_t sub_38D78@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57850, (uint64_t)qword_57BE8, (uint64_t)sub_38D38, a1);
}

uint64_t sub_38D94(uint64_t a1)
{
  return sub_3A434(a1, qword_57C00, 0xD000000000000016LL, 0x8000000000042510LL);
}

uint64_t sub_38DB8()
{
  return sub_3874C(&qword_57858, (uint64_t)qword_57C00, (uint64_t)sub_38D94);
}

uint64_t sub_38DD4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57858, (uint64_t)qword_57C00, (uint64_t)sub_38D94, a1);
}

uint64_t sub_38DF0(uint64_t a1)
{
  return sub_3A434(a1, qword_57C18, 0xD000000000000019LL, 0x80000000000424F0LL);
}

uint64_t sub_38E14()
{
  return sub_3874C(&qword_57860, (uint64_t)qword_57C18, (uint64_t)sub_38DF0);
}

uint64_t sub_38E30@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57860, (uint64_t)qword_57C18, (uint64_t)sub_38DF0, a1);
}

uint64_t sub_38E4C(uint64_t a1)
{
  return sub_3A434(a1, qword_57C30, 0xD000000000000019LL, 0x80000000000424D0LL);
}

uint64_t sub_38E70()
{
  return sub_3874C(&qword_57868, (uint64_t)qword_57C30, (uint64_t)sub_38E4C);
}

uint64_t sub_38E8C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57868, (uint64_t)qword_57C30, (uint64_t)sub_38E4C, a1);
}

uint64_t sub_38EA8(uint64_t a1)
{
  return sub_3A434(a1, qword_57C48, 0xD00000000000001CLL, 0x80000000000424B0LL);
}

uint64_t sub_38ECC()
{
  return sub_3874C(&qword_57870, (uint64_t)qword_57C48, (uint64_t)sub_38EA8);
}

uint64_t sub_38EE8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57870, (uint64_t)qword_57C48, (uint64_t)sub_38EA8, a1);
}

uint64_t sub_38F04(uint64_t a1)
{
  return sub_3A434(a1, qword_57C60, 0xD000000000000016LL, 0x8000000000042490LL);
}

uint64_t sub_38F28()
{
  return sub_3874C(&qword_57878, (uint64_t)qword_57C60, (uint64_t)sub_38F04);
}

uint64_t sub_38F44@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57878, (uint64_t)qword_57C60, (uint64_t)sub_38F04, a1);
}

uint64_t sub_38F60(uint64_t a1)
{
  return sub_3A434(a1, qword_57C78, 0xD000000000000016LL, 0x8000000000042470LL);
}

uint64_t sub_38F84()
{
  return sub_3874C(&qword_57880, (uint64_t)qword_57C78, (uint64_t)sub_38F60);
}

uint64_t sub_38FA0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57880, (uint64_t)qword_57C78, (uint64_t)sub_38F60, a1);
}

uint64_t sub_38FBC(uint64_t a1)
{
  return sub_3A434(a1, qword_57C90, 0xD00000000000001BLL, 0x8000000000042450LL);
}

uint64_t sub_38FE0()
{
  return sub_3874C(&qword_57888, (uint64_t)qword_57C90, (uint64_t)sub_38FBC);
}

uint64_t sub_38FFC@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57888, (uint64_t)qword_57C90, (uint64_t)sub_38FBC, a1);
}

uint64_t sub_39018(uint64_t a1)
{
  return sub_3A434(a1, qword_57CA8, 0xD00000000000001BLL, 0x8000000000042430LL);
}

uint64_t sub_3903C()
{
  return sub_3874C(&qword_57890, (uint64_t)qword_57CA8, (uint64_t)sub_39018);
}

uint64_t sub_39058@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57890, (uint64_t)qword_57CA8, (uint64_t)sub_39018, a1);
}

uint64_t sub_39074(uint64_t a1)
{
  return sub_3A434(a1, qword_57CC0, 0xD00000000000001DLL, 0x8000000000042410LL);
}

uint64_t sub_39098()
{
  return sub_3874C(&qword_57898, (uint64_t)qword_57CC0, (uint64_t)sub_39074);
}

uint64_t sub_390B4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57898, (uint64_t)qword_57CC0, (uint64_t)sub_39074, a1);
}

uint64_t sub_390D0(uint64_t a1)
{
  return sub_3A434(a1, qword_57CD8, 0xD00000000000001ALL, 0x80000000000423F0LL);
}

uint64_t sub_390F4()
{
  return sub_3874C(&qword_578A0, (uint64_t)qword_57CD8, (uint64_t)sub_390D0);
}

uint64_t sub_39110@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578A0, (uint64_t)qword_57CD8, (uint64_t)sub_390D0, a1);
}

uint64_t sub_3912C(uint64_t a1)
{
  return sub_3A434(a1, qword_57CF0, 0xD00000000000001CLL, 0x80000000000423D0LL);
}

uint64_t sub_39150()
{
  return sub_3874C(&qword_578A8, (uint64_t)qword_57CF0, (uint64_t)sub_3912C);
}

uint64_t sub_3916C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578A8, (uint64_t)qword_57CF0, (uint64_t)sub_3912C, a1);
}

uint64_t sub_39188(uint64_t a1)
{
  return sub_3A434(a1, qword_57D08, 0xD00000000000001ELL, 0x80000000000423B0LL);
}

uint64_t sub_391AC()
{
  return sub_3874C(&qword_578B0, (uint64_t)qword_57D08, (uint64_t)sub_39188);
}

uint64_t sub_391C8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578B0, (uint64_t)qword_57D08, (uint64_t)sub_39188, a1);
}

uint64_t sub_391E4(uint64_t a1)
{
  return sub_3A434(a1, qword_57D20, 0xD00000000000001BLL, 0x8000000000042390LL);
}

uint64_t sub_39208()
{
  return sub_3874C(&qword_578B8, (uint64_t)qword_57D20, (uint64_t)sub_391E4);
}

uint64_t sub_39224@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578B8, (uint64_t)qword_57D20, (uint64_t)sub_391E4, a1);
}

uint64_t sub_39240(uint64_t a1)
{
  return sub_3A434(a1, qword_57D38, 0x7361422F786F6258LL, 0xE900000000000065LL);
}

uint64_t sub_39264()
{
  return sub_3874C(&qword_578C0, (uint64_t)qword_57D38, (uint64_t)sub_39240);
}

uint64_t sub_39280@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578C0, (uint64_t)qword_57D38, (uint64_t)sub_39240, a1);
}

uint64_t sub_3929C(uint64_t a1)
{
  return sub_3A434(a1, qword_57D50, 0x7475422F786F6258LL, 0xED000041206E6F74LL);
}

uint64_t sub_392C8()
{
  return sub_3874C(&qword_578C8, (uint64_t)qword_57D50, (uint64_t)sub_3929C);
}

uint64_t sub_392E4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578C8, (uint64_t)qword_57D50, (uint64_t)sub_3929C, a1);
}

uint64_t sub_39300(uint64_t a1)
{
  return sub_3A434(a1, qword_57D68, 0x7475422F786F6258LL, 0xED000042206E6F74LL);
}

uint64_t sub_3932C()
{
  return sub_3874C(&qword_578D0, (uint64_t)qword_57D68, (uint64_t)sub_39300);
}

uint64_t sub_39348@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578D0, (uint64_t)qword_57D68, (uint64_t)sub_39300, a1);
}

uint64_t sub_39364(uint64_t a1)
{
  return sub_3A434(a1, qword_57D80, 0xD000000000000010LL, 0x8000000000042370LL);
}

uint64_t sub_39388()
{
  return sub_3874C(&qword_578D8, (uint64_t)qword_57D80, (uint64_t)sub_39364);
}

uint64_t sub_393A4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578D8, (uint64_t)qword_57D80, (uint64_t)sub_39364, a1);
}

uint64_t sub_393C0(uint64_t a1)
{
  return sub_3A434(a1, qword_57D98, 0xD000000000000010LL, 0x8000000000042350LL);
}

uint64_t sub_393E4()
{
  return sub_3874C(&qword_578E0, (uint64_t)qword_57D98, (uint64_t)sub_393C0);
}

uint64_t sub_39400@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578E0, (uint64_t)qword_57D98, (uint64_t)sub_393C0, a1);
}

uint64_t sub_3941C(uint64_t a1)
{
  return sub_3A434(a1, qword_57DB0, 0xD000000000000013LL, 0x8000000000042330LL);
}

uint64_t sub_39440()
{
  return sub_3874C(&qword_578E8, (uint64_t)qword_57DB0, (uint64_t)sub_3941C);
}

uint64_t sub_3945C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578E8, (uint64_t)qword_57DB0, (uint64_t)sub_3941C, a1);
}

uint64_t sub_39478(uint64_t a1)
{
  return sub_3A434(a1, qword_57DC8, 0x7475422F786F6258LL, 0xED000058206E6F74LL);
}

uint64_t sub_394A4()
{
  return sub_3874C(&qword_578F0, (uint64_t)qword_57DC8, (uint64_t)sub_39478);
}

uint64_t sub_394C0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578F0, (uint64_t)qword_57DC8, (uint64_t)sub_39478, a1);
}

uint64_t sub_394DC(uint64_t a1)
{
  return sub_3A434(a1, qword_57DE0, 0x7475422F786F6258LL, 0xED000059206E6F74LL);
}

uint64_t sub_39508()
{
  return sub_3874C(&qword_578F8, (uint64_t)qword_57DE0, (uint64_t)sub_394DC);
}

uint64_t sub_39524@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_578F8, (uint64_t)qword_57DE0, (uint64_t)sub_394DC, a1);
}

uint64_t sub_39540(uint64_t a1)
{
  return sub_3A434(a1, qword_57DF8, 0xD000000000000012LL, 0x8000000000042310LL);
}

uint64_t sub_39564()
{
  return sub_3874C(&qword_57900, (uint64_t)qword_57DF8, (uint64_t)sub_39540);
}

uint64_t sub_39580@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57900, (uint64_t)qword_57DF8, (uint64_t)sub_39540, a1);
}

uint64_t sub_3959C(uint64_t a1)
{
  return sub_3A434(a1, qword_57E10, 0xD000000000000012LL, 0x80000000000422F0LL);
}

uint64_t sub_395C0()
{
  return sub_3874C(&qword_57908, (uint64_t)qword_57E10, (uint64_t)sub_3959C);
}

uint64_t sub_395DC@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57908, (uint64_t)qword_57E10, (uint64_t)sub_3959C, a1);
}

uint64_t sub_395F8(uint64_t a1)
{
  return sub_3A434(a1, qword_57E28, 0xD000000000000014LL, 0x80000000000422D0LL);
}

uint64_t sub_3961C()
{
  return sub_3874C(&qword_57910, (uint64_t)qword_57E28, (uint64_t)sub_395F8);
}

uint64_t sub_39638@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57910, (uint64_t)qword_57E28, (uint64_t)sub_395F8, a1);
}

uint64_t sub_39654(uint64_t a1)
{
  return sub_3A434(a1, qword_57E40, 0xD000000000000011LL, 0x80000000000422B0LL);
}

uint64_t sub_39678()
{
  return sub_3874C(&qword_57918, (uint64_t)qword_57E40, (uint64_t)sub_39654);
}

uint64_t sub_39694@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57918, (uint64_t)qword_57E40, (uint64_t)sub_39654, a1);
}

uint64_t sub_396B0(uint64_t a1)
{
  return sub_3A434(a1, qword_57E58, 0xD000000000000013LL, 0x8000000000042290LL);
}

uint64_t sub_396D4()
{
  return sub_3874C(&qword_57920, (uint64_t)qword_57E58, (uint64_t)sub_396B0);
}

uint64_t sub_396F0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57920, (uint64_t)qword_57E58, (uint64_t)sub_396B0, a1);
}

uint64_t sub_3970C(uint64_t a1)
{
  return sub_3A434(a1, qword_57E70, 0xD000000000000015LL, 0x8000000000042270LL);
}

uint64_t sub_39730()
{
  return sub_3874C(&qword_57928, (uint64_t)qword_57E70, (uint64_t)sub_3970C);
}

uint64_t sub_3974C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57928, (uint64_t)qword_57E70, (uint64_t)sub_3970C, a1);
}

uint64_t sub_39768(uint64_t a1)
{
  return sub_3A434(a1, qword_57E88, 0xD000000000000012LL, 0x8000000000042250LL);
}

uint64_t sub_3978C()
{
  return sub_3874C(&qword_57930, (uint64_t)qword_57E88, (uint64_t)sub_39768);
}

uint64_t sub_397A8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57930, (uint64_t)qword_57E88, (uint64_t)sub_39768, a1);
}

uint64_t sub_397C4(uint64_t a1)
{
  return sub_3A434(a1, qword_57EA0, 0x706F542F786F6258LL, 0xE800000000000000LL);
}

uint64_t sub_397E4()
{
  return sub_3874C(&qword_57938, (uint64_t)qword_57EA0, (uint64_t)sub_397C4);
}

uint64_t sub_39800@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57938, (uint64_t)qword_57EA0, (uint64_t)sub_397C4, a1);
}

uint64_t sub_3981C(uint64_t a1)
{
  return sub_3A434(a1, qword_57EB8, 0xD000000000000010LL, 0x8000000000042230LL);
}

uint64_t sub_39840()
{
  return sub_3874C(&qword_57940, (uint64_t)qword_57EB8, (uint64_t)sub_3981C);
}

uint64_t sub_3985C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57940, (uint64_t)qword_57EB8, (uint64_t)sub_3981C, a1);
}

uint64_t sub_39878(uint64_t a1)
{
  return sub_3A434(a1, qword_57ED0, 0xD000000000000014LL, 0x8000000000042210LL);
}

uint64_t sub_3989C()
{
  return sub_3874C(&qword_57948, (uint64_t)qword_57ED0, (uint64_t)sub_39878);
}

uint64_t sub_398B8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57948, (uint64_t)qword_57ED0, (uint64_t)sub_39878, a1);
}

uint64_t sub_398D4(uint64_t a1)
{
  return sub_3A434(a1, qword_57EE8, 0xD000000000000014LL, 0x80000000000421F0LL);
}

uint64_t sub_398F8()
{
  return sub_3874C(&qword_57950, (uint64_t)qword_57EE8, (uint64_t)sub_398D4);
}

uint64_t sub_39914@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57950, (uint64_t)qword_57EE8, (uint64_t)sub_398D4, a1);
}

uint64_t sub_39930(uint64_t a1)
{
  return sub_3A434(a1, qword_57F00, 0xD000000000000017LL, 0x80000000000421D0LL);
}

uint64_t sub_39954()
{
  return sub_3874C(&qword_57958, (uint64_t)qword_57F00, (uint64_t)sub_39930);
}

uint64_t sub_39970@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57958, (uint64_t)qword_57F00, (uint64_t)sub_39930, a1);
}

uint64_t sub_3998C(uint64_t a1)
{
  return sub_3A434(a1, qword_57F18, 0xD000000000000017LL, 0x80000000000421B0LL);
}

uint64_t sub_399B0()
{
  return sub_3874C(&qword_57960, (uint64_t)qword_57F18, (uint64_t)sub_3998C);
}

uint64_t sub_399CC@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57960, (uint64_t)qword_57F18, (uint64_t)sub_3998C, a1);
}

uint64_t sub_399E8(uint64_t a1)
{
  return sub_3A434(a1, qword_57F30, 0xD00000000000001ALL, 0x8000000000042190LL);
}

uint64_t sub_39A0C()
{
  return sub_3874C(&qword_57968, (uint64_t)qword_57F30, (uint64_t)sub_399E8);
}

uint64_t sub_39A28@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57968, (uint64_t)qword_57F30, (uint64_t)sub_399E8, a1);
}

uint64_t sub_39A44(uint64_t a1)
{
  return sub_3A434(a1, qword_57F48, 0xD000000000000014LL, 0x8000000000042170LL);
}

uint64_t sub_39A68()
{
  return sub_3874C(&qword_57970, (uint64_t)qword_57F48, (uint64_t)sub_39A44);
}

uint64_t sub_39A84@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57970, (uint64_t)qword_57F48, (uint64_t)sub_39A44, a1);
}

uint64_t sub_39AA0(uint64_t a1)
{
  return sub_3A434(a1, qword_57F60, 0xD000000000000014LL, 0x8000000000042150LL);
}

uint64_t sub_39AC4()
{
  return sub_3874C(&qword_57978, (uint64_t)qword_57F60, (uint64_t)sub_39AA0);
}

uint64_t sub_39AE0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57978, (uint64_t)qword_57F60, (uint64_t)sub_39AA0, a1);
}

uint64_t sub_39AFC(uint64_t a1)
{
  return sub_3A434(a1, qword_57F78, 0xD000000000000019LL, 0x8000000000042130LL);
}

uint64_t sub_39B20()
{
  return sub_3874C(&qword_57980, (uint64_t)qword_57F78, (uint64_t)sub_39AFC);
}

uint64_t sub_39B3C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57980, (uint64_t)qword_57F78, (uint64_t)sub_39AFC, a1);
}

uint64_t sub_39B58(uint64_t a1)
{
  return sub_3A434(a1, qword_57F90, 0xD000000000000019LL, 0x8000000000042110LL);
}

uint64_t sub_39B7C()
{
  return sub_3874C(&qword_57988, (uint64_t)qword_57F90, (uint64_t)sub_39B58);
}

uint64_t sub_39B98@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57988, (uint64_t)qword_57F90, (uint64_t)sub_39B58, a1);
}

uint64_t sub_39BB4(uint64_t a1)
{
  return sub_3A434(a1, qword_57FA8, 0xD00000000000001BLL, 0x80000000000420F0LL);
}

uint64_t sub_39BD8()
{
  return sub_3874C(&qword_57990, (uint64_t)qword_57FA8, (uint64_t)sub_39BB4);
}

uint64_t sub_39BF4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57990, (uint64_t)qword_57FA8, (uint64_t)sub_39BB4, a1);
}

uint64_t sub_39C10(uint64_t a1)
{
  return sub_3A434(a1, qword_57FC0, 0xD000000000000018LL, 0x80000000000420D0LL);
}

uint64_t sub_39C34()
{
  return sub_3874C(&qword_57998, (uint64_t)qword_57FC0, (uint64_t)sub_39C10);
}

uint64_t sub_39C50@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57998, (uint64_t)qword_57FC0, (uint64_t)sub_39C10, a1);
}

uint64_t sub_39C6C(uint64_t a1)
{
  return sub_3A434(a1, qword_57FD8, 0xD00000000000001ALL, 0x80000000000420B0LL);
}

uint64_t sub_39C90()
{
  return sub_3874C(&qword_579A0, (uint64_t)qword_57FD8, (uint64_t)sub_39C6C);
}

uint64_t sub_39CAC@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579A0, (uint64_t)qword_57FD8, (uint64_t)sub_39C6C, a1);
}

uint64_t sub_39CC8(uint64_t a1)
{
  return sub_3A434(a1, qword_57FF0, 0xD00000000000001CLL, 0x8000000000042090LL);
}

uint64_t sub_39CEC()
{
  return sub_3874C(&qword_579A8, (uint64_t)qword_57FF0, (uint64_t)sub_39CC8);
}

uint64_t sub_39D08@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579A8, (uint64_t)qword_57FF0, (uint64_t)sub_39CC8, a1);
}

uint64_t sub_39D24(uint64_t a1)
{
  return sub_3A434(a1, qword_58008, 0xD000000000000019LL, 0x8000000000042070LL);
}

uint64_t sub_39D48()
{
  return sub_3874C(&qword_579B0, (uint64_t)qword_58008, (uint64_t)sub_39D24);
}

uint64_t sub_39D64@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579B0, (uint64_t)qword_58008, (uint64_t)sub_39D24, a1);
}

uint64_t sub_39D80(uint64_t a1)
{
  return sub_3A434(a1, qword_58020, 0x636F68536C617544LL, 0xEF706F542F34206BLL);
}

uint64_t sub_39DAC()
{
  return sub_3874C(&qword_579B8, (uint64_t)qword_58020, (uint64_t)sub_39D80);
}

uint64_t sub_39DC8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579B8, (uint64_t)qword_58020, (uint64_t)sub_39D80, a1);
}

uint64_t sub_39DE4(uint64_t a1)
{
  return sub_3A434(a1, qword_58038, 0xD000000000000014LL, 0x8000000000042050LL);
}

uint64_t sub_39E08()
{
  return sub_3874C(&qword_579C0, (uint64_t)qword_58038, (uint64_t)sub_39DE4);
}

uint64_t sub_39E24@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579C0, (uint64_t)qword_58038, (uint64_t)sub_39DE4, a1);
}

uint64_t sub_39E40(uint64_t a1)
{
  return sub_3A434(a1, qword_58050, 0x736E65536C617544LL, 0xEE00657361422F65LL);
}

uint64_t sub_39E6C()
{
  return sub_3874C(&qword_579C8, (uint64_t)qword_58050, (uint64_t)sub_39E40);
}

uint64_t sub_39E88@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579C8, (uint64_t)qword_58050, (uint64_t)sub_39E40, a1);
}

uint64_t sub_39EA4(uint64_t a1)
{
  return sub_3A434(a1, qword_58068, 0xD000000000000012LL, 0x8000000000042030LL);
}

uint64_t sub_39EC8()
{
  return sub_3874C(&qword_579D0, (uint64_t)qword_58068, (uint64_t)sub_39EA4);
}

uint64_t sub_39EE4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579D0, (uint64_t)qword_58068, (uint64_t)sub_39EA4, a1);
}

uint64_t sub_39F00(uint64_t a1)
{
  return sub_3A434(a1, qword_58080, 0xD000000000000012LL, 0x8000000000042010LL);
}

uint64_t sub_39F24()
{
  return sub_3874C(&qword_579D8, (uint64_t)qword_58080, (uint64_t)sub_39F00);
}

uint64_t sub_39F40@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579D8, (uint64_t)qword_58080, (uint64_t)sub_39F00, a1);
}

uint64_t sub_39F5C(uint64_t a1)
{
  return sub_3A434(a1, qword_58098, 0xD000000000000015LL, 0x8000000000041FF0LL);
}

uint64_t sub_39F80()
{
  return sub_3874C(&qword_579E0, (uint64_t)qword_58098, (uint64_t)sub_39F5C);
}

uint64_t sub_39F9C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579E0, (uint64_t)qword_58098, (uint64_t)sub_39F5C, a1);
}

uint64_t sub_39FB8(uint64_t a1)
{
  return sub_3A434(a1, qword_580B0, 0xD000000000000015LL, 0x8000000000041FD0LL);
}

uint64_t sub_39FDC()
{
  return sub_3874C(&qword_579E8, (uint64_t)qword_580B0, (uint64_t)sub_39FB8);
}

uint64_t sub_39FF8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579E8, (uint64_t)qword_580B0, (uint64_t)sub_39FB8, a1);
}

uint64_t sub_3A014(uint64_t a1)
{
  return sub_3A434(a1, qword_580C8, 0xD000000000000012LL, 0x8000000000041FB0LL);
}

uint64_t sub_3A038()
{
  return sub_3874C(&qword_579F0, (uint64_t)qword_580C8, (uint64_t)sub_3A014);
}

uint64_t sub_3A054@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579F0, (uint64_t)qword_580C8, (uint64_t)sub_3A014, a1);
}

uint64_t sub_3A070(uint64_t a1)
{
  return sub_3A434(a1, qword_580E0, 0xD000000000000012LL, 0x8000000000041F90LL);
}

uint64_t sub_3A094()
{
  return sub_3874C(&qword_579F8, (uint64_t)qword_580E0, (uint64_t)sub_3A070);
}

uint64_t sub_3A0B0@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_579F8, (uint64_t)qword_580E0, (uint64_t)sub_3A070, a1);
}

uint64_t sub_3A0CC(uint64_t a1)
{
  return sub_3A434(a1, qword_580F8, 0xD000000000000010LL, 0x8000000000041F70LL);
}

uint64_t sub_3A0F0()
{
  return sub_3874C(&qword_57A00, (uint64_t)qword_580F8, (uint64_t)sub_3A0CC);
}

uint64_t sub_3A10C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A00, (uint64_t)qword_580F8, (uint64_t)sub_3A0CC, a1);
}

uint64_t sub_3A128(uint64_t a1)
{
  return sub_3A434(a1, qword_58110, 0xD000000000000017LL, 0x8000000000041F50LL);
}

uint64_t sub_3A14C()
{
  return sub_3874C(&qword_57A08, (uint64_t)qword_58110, (uint64_t)sub_3A128);
}

uint64_t sub_3A168@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A08, (uint64_t)qword_58110, (uint64_t)sub_3A128, a1);
}

uint64_t sub_3A184(uint64_t a1)
{
  return sub_3A434(a1, qword_58128, 0xD000000000000017LL, 0x8000000000041F30LL);
}

uint64_t sub_3A1A8()
{
  return sub_3874C(&qword_57A10, (uint64_t)qword_58128, (uint64_t)sub_3A184);
}

uint64_t sub_3A1C4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A10, (uint64_t)qword_58128, (uint64_t)sub_3A184, a1);
}

uint64_t sub_3A1E0(uint64_t a1)
{
  return sub_3A434(a1, qword_58140, 0xD000000000000019LL, 0x8000000000041F10LL);
}

uint64_t sub_3A204()
{
  return sub_3874C(&qword_57A18, (uint64_t)qword_58140, (uint64_t)sub_3A1E0);
}

uint64_t sub_3A220@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A18, (uint64_t)qword_58140, (uint64_t)sub_3A1E0, a1);
}

uint64_t sub_3A23C(uint64_t a1)
{
  return sub_3A434(a1, qword_58158, 0xD000000000000016LL, 0x8000000000041EF0LL);
}

uint64_t sub_3A260()
{
  return sub_3874C(&qword_57A20, (uint64_t)qword_58158, (uint64_t)sub_3A23C);
}

uint64_t sub_3A27C@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A20, (uint64_t)qword_58158, (uint64_t)sub_3A23C, a1);
}

uint64_t sub_3A298(uint64_t a1)
{
  return sub_3A434(a1, qword_58170, 0xD000000000000018LL, 0x8000000000041ED0LL);
}

uint64_t sub_3A2BC()
{
  return sub_3874C(&qword_57A28, (uint64_t)qword_58170, (uint64_t)sub_3A298);
}

uint64_t sub_3A2D8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A28, (uint64_t)qword_58170, (uint64_t)sub_3A298, a1);
}

uint64_t sub_3A2F4(uint64_t a1)
{
  return sub_3A434(a1, qword_58188, 0xD00000000000001ALL, 0x8000000000041EB0LL);
}

uint64_t sub_3A318()
{
  return sub_3874C(&qword_57A30, (uint64_t)qword_58188, (uint64_t)sub_3A2F4);
}

uint64_t sub_3A334@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A30, (uint64_t)qword_58188, (uint64_t)sub_3A2F4, a1);
}

uint64_t sub_3A350(uint64_t a1)
{
  return sub_3A434(a1, qword_581A0, 0xD000000000000017LL, 0x8000000000041E90LL);
}

uint64_t sub_3A374()
{
  return sub_3874C(&qword_57A38, (uint64_t)qword_581A0, (uint64_t)sub_3A350);
}

uint64_t sub_3A390@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A38, (uint64_t)qword_581A0, (uint64_t)sub_3A350, a1);
}

uint64_t sub_3A3AC(uint64_t a1)
{
  return sub_3A434(a1, qword_581B8, 0x736E65536C617544LL, 0xED0000706F542F65LL);
}

uint64_t sub_3A3D8()
{
  return sub_3874C(&qword_57A40, (uint64_t)qword_581B8, (uint64_t)sub_3A3AC);
}

uint64_t sub_3A3F4@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A40, (uint64_t)qword_581B8, (uint64_t)sub_3A3AC, a1);
}

uint64_t sub_3A410(uint64_t a1)
{
  return sub_3A434(a1, qword_581D0, 0xD000000000000012LL, 0x8000000000041E70LL);
}

uint64_t sub_3A434(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource(0LL);
  sub_1CCB4(v7, a2);
  sub_1CC2C(v7, (uint64_t)a2);
  if (qword_577C0 != -1) {
    swift_once(&qword_577C0, sub_3865C);
  }
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_577C8);
}

uint64_t sub_3A4CC()
{
  return sub_3874C(&qword_57A48, (uint64_t)qword_581D0, (uint64_t)sub_3A410);
}

uint64_t sub_3A4E8@<X0>(uint64_t a1@<X8>)
{
  return sub_387A8(&qword_57A48, (uint64_t)qword_581D0, (uint64_t)sub_3A410, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC24GameControllerTVSettingsP33_50325506F0D178085475C450E843683519ResourceBundleClass);
}

ValueMetadata *_s6NimbusOMa()
{
  return &_s6NimbusON;
}

ValueMetadata *_s12XboxAdaptiveOMa()
{
  return &_s12XboxAdaptiveON;
}

ValueMetadata *_s4XboxOMa()
{
  return &_s4XboxON;
}

ValueMetadata *_s10DualShock4OMa()
{
  return &_s10DualShock4ON;
}

ValueMetadata *_s9DualSenseOMa()
{
  return &_s9DualSenseON;
}

void sub_3A574()
{
}

void sub_3A5D4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = @"AHAP/connect";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to read ahap file %@ - %@", (uint8_t *)&v2, 0x16u);
  sub_9800();
}

void sub_3A658()
{
}

void sub_3A6B8()
{
}

void sub_3A718()
{
}

void sub_3A778()
{
  uint64_t v0 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice);
  uint64_t v1 = NSStringFromClass(v0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_9808();
  _os_log_fault_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "GC Settings expected an object of class: %@",  v3,  0xCu);
}

void sub_3A814(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[GCTVSettingsProfileController tableView:cellForRowAtIndexPath:]";
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_fault_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  (uint8_t *)&v1,  0x16u);
}

void sub_3A8A4()
{
}

void sub_3A904(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = @"AHAP/connect";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to read ahap file %@ - %@", (uint8_t *)&v2, 0x16u);
  sub_11A94();
}

void sub_3A988()
{
}

void sub_3A9E8()
{
}

void sub_3AA48()
{
  uint64_t v0 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSBluetoothDevice);
  uint64_t v1 = NSStringFromClass(v0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_11A9C();
  _os_log_fault_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "GC Settings expected an object of class: %@",  v3,  0xCu);
}

void sub_3AAE4(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[GCTVSettingsElementCustomizationController_Legacy tableView:cellForRowAtIndexPath:]";
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_fault_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  (uint8_t *)&v1,  0x16u);
}

void sub_3AB74(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[GCTVSettingsElementCustomizationController tableView:cellForRowAtIndexPath:]";
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_fault_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  (uint8_t *)&v1,  0x16u);
}

void sub_3AC04(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[GCTVSettingsCustomizationController tableView:cellForRowAtIndexPath:]";
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_fault_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  (uint8_t *)&v1,  0x16u);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__baseFolderForControllerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baseFolderForControllerType:");
}

id objc_msgSend__baseImageNameForControllerType_buttonName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baseImageNameForControllerType:buttonName:");
}

id objc_msgSend__bluetoothDevice(void *a1, const char *a2, ...)
{
  return _[a1 _bluetoothDevice];
}

id objc_msgSend__initializeGameController(void *a1, const char *a2, ...)
{
  return _[a1 _initializeGameController];
}

id objc_msgSend__nameViewControllerForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nameViewControllerForItem:");
}

id objc_msgSend__topLevelButtons(void *a1, const char *a2, ...)
{
  return _[a1 _topLevelButtons];
}

id objc_msgSend__topLevelDirectionPads(void *a1, const char *a2, ...)
{
  return _[a1 _topLevelDirectionPads];
}

id objc_msgSend__topLevelElements(void *a1, const char *a2, ...)
{
  return _[a1 _topLevelElements];
}

id objc_msgSend__updateButtonImage(void *a1, const char *a2, ...)
{
  return _[a1 _updateButtonImage];
}

id objc_msgSend__updatePreviewImage(void *a1, const char *a2, ...)
{
  return _[a1 _updatePreviewImage];
}

id objc_msgSend_actionItemWithTitle_description_representedObject_keyPath_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionItemWithTitle:description:representedObject:keyPath:target:action:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addController_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addController:saveToDisk:");
}

id objc_msgSend_addCopilotFusedController_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCopilotFusedController:saveToDisk:");
}

id objc_msgSend_addGame_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGame:saveToDisk:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addProfile_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addProfile:saveToDisk:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allButtons(void *a1, const char *a2, ...)
{
  return _[a1 allButtons];
}

id objc_msgSend_allControllers(void *a1, const char *a2, ...)
{
  return _[a1 allControllers];
}

id objc_msgSend_allDpads(void *a1, const char *a2, ...)
{
  return _[a1 allDpads];
}

id objc_msgSend_allElements(void *a1, const char *a2, ...)
{
  return _[a1 allElements];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appInfos(void *a1, const char *a2, ...)
{
  return _[a1 appInfos];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return _[a1 applicationName];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_availableColorValues(void *a1, const char *a2, ...)
{
  return _[a1 availableColorValues];
}

id objc_msgSend_availableCopilotControllers(void *a1, const char *a2, ...)
{
  return _[a1 availableCopilotControllers];
}

id objc_msgSend_availableProfileValuesAndIncludeNil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableProfileValuesAndIncludeNil:");
}

id objc_msgSend_availableVibrationValues(void *a1, const char *a2, ...)
{
  return _[a1 availableVibrationValues];
}

id objc_msgSend_baseElement(void *a1, const char *a2, ...)
{
  return _[a1 baseElement];
}

id objc_msgSend_baseProfile(void *a1, const char *a2, ...)
{
  return _[a1 baseProfile];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_colorFormatter(void *a1, const char *a2, ...)
{
  return _[a1 colorFormatter];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_configurableControllerButtons(void *a1, const char *a2, ...)
{
  return _[a1 configurableControllerButtons];
}

id objc_msgSend_configurableControllerDpads(void *a1, const char *a2, ...)
{
  return _[a1 configurableControllerDpads];
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_configurationWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTraitCollection:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectDevice:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return _[a1 controller];
}

id objc_msgSend_controllerFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerFor:");
}

id objc_msgSend_controllerIsCopilot(void *a1, const char *a2, ...)
{
  return _[a1 controllerIsCopilot];
}

id objc_msgSend_controllerToCompatibilityModeMappings(void *a1, const char *a2, ...)
{
  return _[a1 controllerToCompatibilityModeMappings];
}

id objc_msgSend_controllerToProfileMappings(void *a1, const char *a2, ...)
{
  return _[a1 controllerToProfileMappings];
}

id objc_msgSend_controllerTypeToBaseImageLookup(void *a1, const char *a2, ...)
{
  return _[a1 controllerTypeToBaseImageLookup];
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _[a1 controllers];
}

id objc_msgSend_copilot(void *a1, const char *a2, ...)
{
  return _[a1 copilot];
}

id objc_msgSend_copilotFusedControllers(void *a1, const char *a2, ...)
{
  return _[a1 copilotFusedControllers];
}

id objc_msgSend_copilotIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 copilotIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createEngineWithLocality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEngineWithLocality:");
}

id objc_msgSend_createPlayerWithPattern_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPlayerWithPattern:error:");
}

id objc_msgSend_customizable(void *a1, const char *a2, ...)
{
  return _[a1 customizable];
}

id objc_msgSend_customizationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 customizationsEnabled];
}

id objc_msgSend_customizatonController(void *a1, const char *a2, ...)
{
  return _[a1 customizatonController];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 defaultIdentifier];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_detailedProductCategory(void *a1, const char *a2, ...)
{
  return _[a1 detailedProductCategory];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_disconnectDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectDevice:");
}

id objc_msgSend_dpads(void *a1, const char *a2, ...)
{
  return _[a1 dpads];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_editingItem(void *a1, const char *a2, ...)
{
  return _[a1 editingItem];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_element(void *a1, const char *a2, ...)
{
  return _[a1 element];
}

id objc_msgSend_elementKey(void *a1, const char *a2, ...)
{
  return _[a1 elementKey];
}

id objc_msgSend_elementMappings(void *a1, const char *a2, ...)
{
  return _[a1 elementMappings];
}

id objc_msgSend_elementMappingsFrom_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementMappingsFrom:for:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_eraseAllSettings(void *a1, const char *a2, ...)
{
  return _[a1 eraseAllSettings];
}

id objc_msgSend_extendedGamepad(void *a1, const char *a2, ...)
{
  return _[a1 extendedGamepad];
}

id objc_msgSend_filterSupportedApps(void *a1, const char *a2, ...)
{
  return _[a1 filterSupportedApps];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findingController(void *a1, const char *a2, ...)
{
  return _[a1 findingController];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_formatterWithOnTitle_offTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatterWithOnTitle:offTitle:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fusedControllerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 fusedControllerIdentifier];
}

id objc_msgSend_game(void *a1, const char *a2, ...)
{
  return _[a1 game];
}

id objc_msgSend_gameBuddyFormatter(void *a1, const char *a2, ...)
{
  return _[a1 gameBuddyFormatter];
}

id objc_msgSend_gameWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gameWithBundleIdentifier:");
}

id objc_msgSend_gameWithBundleIdentifier_controller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gameWithBundleIdentifier:controller:");
}

id objc_msgSend_games(void *a1, const char *a2, ...)
{
  return _[a1 games];
}

id objc_msgSend_generateElementDictionaryFromElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateElementDictionaryFromElements:");
}

id objc_msgSend_groupWithTitle_settingItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithTitle:settingItems:");
}

id objc_msgSend_hapticFeedbackOverride(void *a1, const char *a2, ...)
{
  return _[a1 hapticFeedbackOverride];
}

id objc_msgSend_hapticStrength(void *a1, const char *a2, ...)
{
  return _[a1 hapticStrength];
}

id objc_msgSend_haptics(void *a1, const char *a2, ...)
{
  return _[a1 haptics];
}

id objc_msgSend_hasPoorBehavior(void *a1, const char *a2, ...)
{
  return _[a1 hasPoorBehavior];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageNamed_inBundle_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initForController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForController:");
}

id objc_msgSend_initWithApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithApplicationBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_forController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:forController:");
}

id objc_msgSend_initWithBundleIdentifier_title_controllerToProfileMappings_controllerToCompatibilityModeMappings_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithController:");
}

id objc_msgSend_initWithControllerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControllerType:");
}

id objc_msgSend_initWithControllerType_buttonNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControllerType:buttonNamed:");
}

id objc_msgSend_initWithCopilot_controllerIsCopilot_representedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCopilot:controllerIsCopilot:representedObject:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElement:");
}

id objc_msgSend_initWithElementKey_mappingKey_remappingOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElementKey:mappingKey:remappingOrder:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFusedControllerIdentifier_pilotIdentifier_copilotIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFusedControllerIdentifier:pilotIdentifier:copilotIdentifier:");
}

id objc_msgSend_initWithGame_controller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGame:controller:");
}

id objc_msgSend_initWithGame_profile_record_representedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGame:profile:record:representedObject:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithInputs_outputs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputs:outputs:");
}

id objc_msgSend_initWithMapping_elements_controller_prefsStoreObj_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMapping:elements:controller:prefsStoreObj:");
}

id objc_msgSend_initWithName_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:bundle:");
}

id objc_msgSend_initWithName_nameLocalizationKey_sfSymbolsName_remappingKey_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:nameLocalizationKey:sfSymbolsName:remappingKey:kind:");
}

id objc_msgSend_initWithName_persistentIdentifier_productCategoryKey_hidden_shareButton_buttons_dpads_logoSfSymbolsName_supportsHaptics_supportsLight_baseProfile_miscellaneous_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:suppo rtsHaptics:supportsLight:baseProfile:miscellaneous:");
}

id objc_msgSend_initWithPrefsStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrefsStore:");
}

id objc_msgSend_initWithProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProfile:");
}

id objc_msgSend_initWithProfile_controller_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProfile:controller:");
}

id objc_msgSend_initWithProfileRepresentedObj_prefsStoreObj_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProfileRepresentedObj:prefsStoreObj:");
}

id objc_msgSend_initWithUUID_name_persistentControllerIdentifier_gameBundleIdentifier_baseProfile_customizable_sfSymbolsName_elementMappings_hapticFeedbackOverride_hapticStrength_doublePressShareGesture_longPressShareGesture_lightbarOverride_lightbarCustomColorEnabled_lightbarColor_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName: elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarO verride:lightbarCustomColorEnabled:lightbarColor:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _[a1 instance];
}

id objc_msgSend_invertHorizontally(void *a1, const char *a2, ...)
{
  return _[a1 invertHorizontally];
}

id objc_msgSend_invertVertically(void *a1, const char *a2, ...)
{
  return _[a1 invertVertically];
}

id objc_msgSend_isBaseProfile(void *a1, const char *a2, ...)
{
  return _[a1 isBaseProfile];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isCustomizingDefaultSettings(void *a1, const char *a2, ...)
{
  return _[a1 isCustomizingDefaultSettings];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _[a1 isFocused];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return _[a1 keyPath];
}

id objc_msgSend_light(void *a1, const char *a2, ...)
{
  return _[a1 light];
}

id objc_msgSend_lightbarColor(void *a1, const char *a2, ...)
{
  return _[a1 lightbarColor];
}

id objc_msgSend_lightbarCustomColorEnabled(void *a1, const char *a2, ...)
{
  return _[a1 lightbarCustomColorEnabled];
}

id objc_msgSend_lightbarOverride(void *a1, const char *a2, ...)
{
  return _[a1 lightbarOverride];
}

id objc_msgSend_listGroupWithTitle_representedObject_keyPath_configurationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listGroupWithTitle:representedObject:keyPath:configurationBlock:");
}

id objc_msgSend_loadFindControllerPattern(void *a1, const char *a2, ...)
{
  return _[a1 loadFindControllerPattern];
}

id objc_msgSend_localizedDescriptionForItemInViewController_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescriptionForItemInViewController:atIndexPath:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_localizedValueForSettingItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedValueForSettingItem:");
}

id objc_msgSend_logicalElementForPhysicalPressOf_onPhysicalInputProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logicalElementForPhysicalPressOf:onPhysicalInputProfile:");
}

id objc_msgSend_logoSfSymbolsName(void *a1, const char *a2, ...)
{
  return _[a1 logoSfSymbolsName];
}

id objc_msgSend_longPressShareGesture(void *a1, const char *a2, ...)
{
  return _[a1 longPressShareGesture];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _[a1 macAddress];
}

id objc_msgSend_mappedElement(void *a1, const char *a2, ...)
{
  return _[a1 mappedElement];
}

id objc_msgSend_mapping(void *a1, const char *a2, ...)
{
  return _[a1 mapping];
}

id objc_msgSend_mappingForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mappingForElement:");
}

id objc_msgSend_mappingKey(void *a1, const char *a2, ...)
{
  return _[a1 mappingKey];
}

id objc_msgSend_miscellaneous(void *a1, const char *a2, ...)
{
  return _[a1 miscellaneous];
}

id objc_msgSend_multiValueItemWithTitle_description_representedObject_keyPath_availableValues_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameLocalizationKey(void *a1, const char *a2, ...)
{
  return _[a1 nameLocalizationKey];
}

id objc_msgSend_nameViewController(void *a1, const char *a2, ...)
{
  return _[a1 nameViewController];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_newBaseProfile(void *a1, const char *a2, ...)
{
  return _[a1 newBaseProfile];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 persistentIdentifier];
}

id objc_msgSend_physicalInputProfile(void *a1, const char *a2, ...)
{
  return _[a1 physicalInputProfile];
}

id objc_msgSend_pilotIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pilotIdentifier];
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithFormat_argumentArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:argumentArray:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_prefsStore(void *a1, const char *a2, ...)
{
  return _[a1 prefsStore];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_primaryAlias(void *a1, const char *a2, ...)
{
  return _[a1 primaryAlias];
}

id objc_msgSend_productCategory(void *a1, const char *a2, ...)
{
  return _[a1 productCategory];
}

id objc_msgSend_productCategoryKey(void *a1, const char *a2, ...)
{
  return _[a1 productCategoryKey];
}

id objc_msgSend_productCategoryLocalizationKeyForProductCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productCategoryLocalizationKeyForProductCategory:");
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return _[a1 profile];
}

id objc_msgSend_profileFromCurrentConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 profileFromCurrentConfiguration];
}

id objc_msgSend_profileWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileWithName:");
}

id objc_msgSend_profiles(void *a1, const char *a2, ...)
{
  return _[a1 profiles];
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _[a1 record];
}

id objc_msgSend_refreshBaseAndRemappedElements(void *a1, const char *a2, ...)
{
  return _[a1 refreshBaseAndRemappedElements];
}

id objc_msgSend_registerAccessoryForAppearanceUpdates_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAccessoryForAppearanceUpdates:selector:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerSettingsCustomizedHandler_forController_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSettingsCustomizedHandler:forController:forKey:");
}

id objc_msgSend_registerTitleAccessoryForAppearanceUpdates_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerTitleAccessoryForAppearanceUpdates:selector:");
}

id objc_msgSend_reloadSettings(void *a1, const char *a2, ...)
{
  return _[a1 reloadSettings];
}

id objc_msgSend_reloadSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 reloadSettingsIfNeeded];
}

id objc_msgSend_remappable(void *a1, const char *a2, ...)
{
  return _[a1 remappable];
}

id objc_msgSend_remappedElement(void *a1, const char *a2, ...)
{
  return _[a1 remappedElement];
}

id objc_msgSend_remappingKey(void *a1, const char *a2, ...)
{
  return _[a1 remappingKey];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeController_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeController:saveToDisk:");
}

id objc_msgSend_removeGame_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeGame:saveToDisk:");
}

id objc_msgSend_removeHapticEngines(void *a1, const char *a2, ...)
{
  return _[a1 removeHapticEngines];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeProfile_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeProfile:saveToDisk:");
}

id objc_msgSend_representedObj(void *a1, const char *a2, ...)
{
  return _[a1 representedObj];
}

id objc_msgSend_representedObject(void *a1, const char *a2, ...)
{
  return _[a1 representedObject];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_restoreToDefaults(void *a1, const char *a2, ...)
{
  return _[a1 restoreToDefaults];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return _[a1 save];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sendSettingsEnteredEvent(void *a1, const char *a2, ...)
{
  return _[a1 sendSettingsEnteredEvent];
}

id objc_msgSend_sendSettingsIdentifyControllerEventForProductCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSettingsIdentifyControllerEventForProductCategory:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_setAccessoryTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryTypes:");
}

id objc_msgSend_setAllElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllElements:");
}

id objc_msgSend_setApplicationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationName:");
}

id objc_msgSend_setAppsWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsWithSettings:");
}

id objc_msgSend_setAppsWithoutSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsWithoutSettings:");
}

id objc_msgSend_setAutoHide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoHide:");
}

id objc_msgSend_setAvailableValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableValues:");
}

id objc_msgSend_setBaseElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseElement:");
}

id objc_msgSend_setButtonIconSFSymbolsName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonIconSFSymbolsName:");
}

id objc_msgSend_setButtonName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonName:");
}

id objc_msgSend_setCanFocus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanFocus:");
}

id objc_msgSend_setChildControllerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChildControllerBlock:");
}

id objc_msgSend_setComparesArrayDeeply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComparesArrayDeeply:");
}

id objc_msgSend_setConfigurableControllerButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurableControllerButtons:");
}

id objc_msgSend_setConfigurableControllerDpads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurableControllerDpads:");
}

id objc_msgSend_setConfigurableControllerSystemButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurableControllerSystemButtons:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setContentView_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:animated:");
}

id objc_msgSend_setController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setController:");
}

id objc_msgSend_setCustomizatonController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomizatonController:");
}

id objc_msgSend_setDescriptionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionText:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirty:");
}

id objc_msgSend_setEditingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingDelegate:");
}

id objc_msgSend_setElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElement:");
}

id objc_msgSend_setElement_settings_showRemappedIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElement:settings:showRemappedIcon:");
}

id objc_msgSend_setElementMapping_elements_showRemappedIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementMapping:elements:showRemappedIcon:");
}

id objc_msgSend_setElementMappings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementMappings:");
}

id objc_msgSend_setElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElements:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFindingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingController:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHapticFeedbackOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHapticFeedbackOverride:");
}

id objc_msgSend_setHapticStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHapticStrength:");
}

id objc_msgSend_setHeaderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderText:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInitialText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialText:");
}

id objc_msgSend_setLightbarColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightbarColor:");
}

id objc_msgSend_setLightbarCustomColorEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightbarCustomColorEnabled:");
}

id objc_msgSend_setLightbarOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightbarOverride:");
}

id objc_msgSend_setLocalizedDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedDescription:");
}

id objc_msgSend_setLocalizedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedTitle:");
}

id objc_msgSend_setLocalizedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedValue:");
}

id objc_msgSend_setLocalizedValueFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedValueFormatter:");
}

id objc_msgSend_setMappableControllerElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappableControllerElements:");
}

id objc_msgSend_setMappedElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappedElement:");
}

id objc_msgSend_setMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapping:");
}

id objc_msgSend_setMappingForElement_toElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappingForElement:toElement:");
}

id objc_msgSend_setMappingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappingKey:");
}

id objc_msgSend_setMessageText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageText:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNameViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameViewController:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfiles:");
}

id objc_msgSend_setRemappedElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemappedElement:");
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettings:");
}

id objc_msgSend_setSettingsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsForBundleID:");
}

id objc_msgSend_setShouldPresentChildController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPresentChildController:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBlock:");
}

id objc_msgSend_setVc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVc:");
}

id objc_msgSend_setVideoRecordingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoRecordingEnabled:");
}

id objc_msgSend_setWrappedCopilotFusedController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrappedCopilotFusedController:");
}

id objc_msgSend_setWrappedGamesWithProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrappedGamesWithProfile:");
}

id objc_msgSend_setWrappedGamesWithoutProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWrappedGamesWithoutProfile:");
}

id objc_msgSend_settingGroupAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingGroupAtIndex:");
}

id objc_msgSend_settingItem_didUpdateMetadataWithGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingItem:didUpdateMetadataWithGroup:");
}

id objc_msgSend_settingItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingItemAtIndexPath:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsCustomizedForController_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsCustomizedForController:forBundleIdentifier:");
}

id objc_msgSend_settingsForBundleID(void *a1, const char *a2, ...)
{
  return _[a1 settingsForBundleID];
}

id objc_msgSend_settingsForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForElement:");
}

id objc_msgSend_sfSymbolsName(void *a1, const char *a2, ...)
{
  return _[a1 sfSymbolsName];
}

id objc_msgSend_shareButton(void *a1, const char *a2, ...)
{
  return _[a1 shareButton];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldShowCopilotOptions(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowCopilotOptions];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_startAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAndReturnError:");
}

id objc_msgSend_startAtTime_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAtTime:error:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportedGameControllers(void *a1, const char *a2, ...)
{
  return _[a1 supportedGameControllers];
}

id objc_msgSend_supportsBuddyController(void *a1, const char *a2, ...)
{
  return _[a1 supportsBuddyController];
}

id objc_msgSend_supportsHaptics(void *a1, const char *a2, ...)
{
  return _[a1 supportsHaptics];
}

id objc_msgSend_supportsLight(void *a1, const char *a2, ...)
{
  return _[a1 supportsLight];
}

id objc_msgSend_swapAxes(void *a1, const char *a2, ...)
{
  return _[a1 swapAxes];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithUserInterfaceIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithUserInterfaceIdiom:");
}

id objc_msgSend_transitionWithView_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionWithView:duration:options:animations:completion:");
}

id objc_msgSend_tvset_assetName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvset_assetName");
}

id objc_msgSend_tvset_assetNameLookup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvset_assetNameLookup");
}

id objc_msgSend_tvset_controllerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvset_controllerType");
}

id objc_msgSend_unfusedFusableControllers(void *a1, const char *a2, ...)
{
  return _[a1 unfusedFusableControllers];
}

id objc_msgSend_unmappedLocalizedName(void *a1, const char *a2, ...)
{
  return _[a1 unmappedLocalizedName];
}

id objc_msgSend_unmappedNameLocalizationKey(void *a1, const char *a2, ...)
{
  return _[a1 unmappedNameLocalizationKey];
}

id objc_msgSend_unmappedSfSymbolsName(void *a1, const char *a2, ...)
{
  return _[a1 unmappedSfSymbolsName];
}

id objc_msgSend_unpairDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpairDevice:");
}

id objc_msgSend_unregisterSettingsCustomizedHandlerForController_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterSettingsCustomizedHandlerForController:forKey:");
}

id objc_msgSend_updateCopilotFusedControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCopilotFusedControllers:");
}

id objc_msgSend_updateGameFrom_to_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGameFrom:to:saveToDisk:");
}

id objc_msgSend_updateGames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGames:");
}

id objc_msgSend_updateMappableControllerElements(void *a1, const char *a2, ...)
{
  return _[a1 updateMappableControllerElements];
}

id objc_msgSend_updateProfileFrom_to_saveToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProfileFrom:to:saveToDisk:");
}

id objc_msgSend_updateProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProfiles:");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return _[a1 vendorName];
}

id objc_msgSend_vibrationFormatter(void *a1, const char *a2, ...)
{
  return _[a1 vibrationFormatter];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_wrappedCopilotFusedController(void *a1, const char *a2, ...)
{
  return _[a1 wrappedCopilotFusedController];
}