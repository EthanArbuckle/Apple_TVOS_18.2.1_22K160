@interface SDAirDropHandlerFactory
+ (id)handlerForTransfer:(id)a3;
@end

@implementation SDAirDropHandlerFactory

+ (id)handlerForTransfer:(id)a3
{
  id v3 = a3;
  v56[0] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerCalendarEvents, v4);
  v56[1] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerContacts, v5);
  v56[2] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerNotes, v6);
  v56[3] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerPhotos, v7);
  v56[4] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerProfiles, v8);
  v56[5] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerVoiceMails, v9);
  v56[6] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerVoiceMemos, v10);
  v56[7] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerWalletItems, v11);
  v56[8] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerPDFs, v12);
  v56[9] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriBooksItems, v13);
  v56[10] = objc_opt_class(&OBJC_CLASS____TtC16DaemoniOSLibrary19SDAirDropHandlerIPA, v14);
  v56[11] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerPlaygroundItems, v15);
  v56[12] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerGenericFiles, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 13LL));
  v55[0] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerCredentialLinks, v18);
  v55[1] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerSharediCloudDocumentsLinks, v19);
  v55[2] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerKeynoteLiveLinks, v20);
  v55[3] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerFindMyFriendsLinks, v21);
  v55[4] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriWorkLinks, v22);
  v55[5] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerAppStoreLinks, v23);
  v55[6] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerPhoneLinks, v24);
  v55[7] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriBooksLinks, v25);
  v55[8] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerPodcastsLinks, v26);
  v55[9] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriTunesULinks, v27);
  v55[10] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriTunesStoreLinks, v28);
  v55[11] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriLifeLinks, v29);
  v55[12] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerMapsLinks, v30);
  v55[13] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerNewsLinks, v31);
  v55[14] = objc_opt_class(&OBJC_CLASS___SDAirDropHandleriCloudFamilyLinks, v32);
  v55[15] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerGenericLinks, v33);
  v55[16] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerWebLinks, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 17LL));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v17 arrayByAddingObjectsFromArray:v35]);

  v54[0] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerMixedTypes, v37);
  v54[1] = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerUnsupportedType, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v36 arrayByAddingObjectsFromArray:v39]);

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v41 = v40;
  id v42 = [v41 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v50;
LABEL_3:
    uint64_t v45 = 0LL;
    while (1)
    {
      if (*(void *)v50 != v44) {
        objc_enumerationMutation(v41);
      }
      id v46 = objc_alloc(*(Class *)(*((void *)&v49 + 1) + 8 * v45));
      id v47 = objc_msgSend(v46, "initWithTransfer:", v3, (void)v49);

      if (v43 == (id)++v45)
      {
        id v43 = [v41 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v43) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v47 = 0LL;
  }

  return v47;
}

@end