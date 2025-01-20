@interface TVSSHomeKitController
- (BOOL)hasCamerasOrScenes;
- (TVSSHomeKitController)init;
- (void)_updateCamerasOrScenesValue;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSSHomeKitController

- (TVSSHomeKitController)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSHomeKitController;
  v7 = -[TVSSHomeKitController init](&v5, "init");
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    v4 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
    -[TVCSHomeManager addObserver:forKeyPath:options:context:]( v4,  "addObserver:forKeyPath:options:context:",  v7,  @"localAccessory",  0LL,  off_10021F818);
    -[TVCSHomeManager reloadHomeConfiguration](v4, "reloadHomeConfiguration");
    objc_storeStrong((id *)&v4, 0LL);
  }

  v3 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v3;
}

- (void)dealloc
{
  v4 = self;
  v3[1] = (id)a2;
  v3[0] = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
  [v3[0] removeObserver:v4 forKeyPath:@"localAccessory" context:off_10021F818];
  objc_storeStrong(v3, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSHomeKitController;
  -[TVSSHomeKitController dealloc](&v2, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10 = a6;
  if (a6 == off_10021F818)
  {
    -[TVSSHomeKitController _updateCamerasOrScenesValue](v14, "_updateCamerasOrScenesValue");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSSHomeKitController;
    -[TVSSHomeKitController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateCamerasOrScenesValue
{
  v34 = self;
  v33[1] = (id)a2;
  v17 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
  id v16 = -[TVCSHomeManager localAccessory](v17, "localAccessory");
  id v15 = [v16 home];
  v33[0] = [v15 hmHome];

  id v32 = objc_msgSend(v33[0], "hf_allNonEmptyActionSets");
  id v31 = objc_msgSend(v33[0], "hf_allCameraProfiles");
  char v30 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v32;
  id v19 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
  if (v19)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0LL;
    id v14 = v19;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v29 = *(id *)(__b[1] + 8 * v13);
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0LL;
        id v14 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
        if (!v14) {
          goto LABEL_9;
        }
      }
    }

    char v30 = 1;
    int v27 = 2;
  }

  else
  {
LABEL_9:
    int v27 = 0;
  }

  if ((v30 & 1) == 0)
  {
    id v8 =  +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences");
    id location = objc_msgSend(v8, "pbs_homeKitDisabledCameras");

    memset(v24, 0, sizeof(v24));
    id v9 = v31;
    id v10 = [v9 countByEnumeratingWithState:v24 objects:v35 count:16];
    if (v10)
    {
      uint64_t v5 = *(void *)v24[2];
      uint64_t v6 = 0LL;
      id v7 = v10;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)v24[2] != v5) {
          objc_enumerationMutation(v9);
        }
        id v25 = *(id *)(v24[1] + 8 * v6);
        char v22 = 0;
        char v20 = 0;
        if ((objc_msgSend(v25, "hf_isFavorite") & 1) != 0
          || (LOBYTE(v3) = 0, (objc_msgSend(v25, "hf_hasSetFavorite") & 1) == 0))
        {
          id v2 = location;
          id v23 = [v25 uniqueIdentifier];
          char v22 = 1;
          id v21 = [v23 UUIDString];
          char v20 = 1;
          unsigned int v3 = objc_msgSend(v2, "containsObject:") ^ 1;
        }

        if ((v20 & 1) != 0) {

        }
        if ((v22 & 1) != 0) {
        if ((v3 & 1) != 0)
        }
          break;
        ++v6;
        if (v4 + 1 >= (unint64_t)v7)
        {
          uint64_t v6 = 0LL;
          id v7 = [v9 countByEnumeratingWithState:v24 objects:v35 count:16];
          if (!v7) {
            goto LABEL_26;
          }
        }
      }

      char v30 = 1;
      int v27 = 4;
    }

    else
    {
LABEL_26:
      int v27 = 0;
    }

    objc_storeStrong(&location, 0LL);
  }

  -[TVSSHomeKitController willChangeValueForKey:](v34, "willChangeValueForKey:");
  v34->_hasCamerasOrScenes = v30 & 1;
  -[TVSSHomeKitController didChangeValueForKey:](v34, "didChangeValueForKey:", @"hasCamerasOrScenes");
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(v33, 0LL);
}

- (BOOL)hasCamerasOrScenes
{
  return self->_hasCamerasOrScenes;
}

@end