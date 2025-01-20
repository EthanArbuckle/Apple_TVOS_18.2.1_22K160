@interface TVSSPrivacyStatusMenuModeStateContributor
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (TVSSPrivacyStatusMenuModeStateContributor)initWithSensorActivityController:(id)a3;
- (TVSSSensorActivityController)sensorActivityController;
- (void)dealloc;
- (void)sensorActivityControllerDidUpdate:(id)a3;
- (void)setContributorDelegate:(id)a3;
- (void)setSensorActivityController:(id)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSPrivacyStatusMenuModeStateContributor

- (TVSSPrivacyStatusMenuModeStateContributor)initWithSensorActivityController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSPrivacyStatusMenuModeStateContributor;
  v8 = -[TVSSPrivacyStatusMenuModeStateContributor init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sensorActivityController, location[0]);
    -[TVSSSensorActivityController addObserver:](v8->_sensorActivityController, "addObserver:", v8);
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSSensorActivityController removeObserver:](self->_sensorActivityController, "removeObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSPrivacyStatusMenuModeStateContributor;
  -[TVSSPrivacyStatusMenuModeStateContributor dealloc](&v2, "dealloc");
}

- (void)updateMenuModeState:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 =  +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  &off_1001C8AF8,  &off_1001C8B10,  &off_1001C8B28,  0LL);
  id v23 = -[TVSSPrivacyStatusMenuModeStateContributor sensorActivityController](v26, "sensorActivityController");
  memset(__b, 0, sizeof(__b));
  id obj = [v23 activeActivityAttributions];
  id v17 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
  if (v17)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0LL;
    id v15 = v17;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(id *)(__b[1] + 8 * v14);
      id v20 = [v22 sensorType];
      if (v20)
      {
        if (v20 == (id)1)
        {
          [location[0] setMicInUse:1];
        }

        else if (v20 == (id)2)
        {
          [location[0] setLocationInUse:1];
        }
      }

      else
      {
        [location[0] setCameraInUse:1];
      }

      id v10 = v24;
      v11 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20);
      objc_msgSend(v10, "removeObject:");

      ++v14;
      if (v12 + 1 >= (unint64_t)v15)
      {
        uint64_t v14 = 0LL;
        id v15 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  memset(v18, 0, sizeof(v18));
  id v8 = v24;
  id v9 = [v8 countByEnumeratingWithState:v18 objects:v27 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)v18[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)v18[2] != v5) {
        objc_enumerationMutation(v8);
      }
      id v19 = *(id *)(v18[1] + 8 * v6);
      id v3 = [v19 integerValue];
      if (v3)
      {
        if (v3 == (id)1)
        {
          [location[0] setMicInUse:0];
        }

        else if (v3 == (id)2)
        {
          [location[0] setLocationInUse:0];
        }
      }

      else
      {
        [location[0] setCameraInUse:0];
      }

      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [v8 countByEnumeratingWithState:v18 objects:v27 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)sensorActivityControllerDidUpdate:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSPrivacyStatusMenuModeStateContributor contributorDelegate](v5, "contributorDelegate");
  -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v3, "stateContributorHasUpdate:", v5);

  objc_storeStrong(location, 0LL);
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (TVSSSensorActivityController)sensorActivityController
{
  return self->_sensorActivityController;
}

- (void)setSensorActivityController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end