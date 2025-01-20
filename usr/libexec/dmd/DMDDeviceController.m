@interface DMDDeviceController
+ (DMDDeviceController)shared;
- (DMFDevice)currentDevice;
- (id)deviceType;
- (id)deviceWithKeys:(id)a3;
@end

@implementation DMDDeviceController

+ (DMDDeviceController)shared
{
  if (qword_1000CCCC8 != -1) {
    dispatch_once(&qword_1000CCCC8, &stru_10009E870);
  }
  return (DMDDeviceController *)(id)qword_1000CCCC0;
}

- (DMFDevice)currentDevice
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[DMFFetchDevicePropertiesRequest currentDevicePropertyKeys]( &OBJC_CLASS___DMFFetchDevicePropertiesRequest,  "currentDevicePropertyKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeviceController deviceWithKeys:](self, "deviceWithKeys:", v3));

  return (DMFDevice *)v4;
}

- (id)deviceWithKeys:(id)a3
{
  id v4 = a3;
  id v16 = -[DMFDevice initPrivate](objc_alloc(&OBJC_CLASS___DMFDevice), "initPrivate");
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMFDevice propertyNameForKey:](&OBJC_CLASS___DMFDevice, "propertyNameForKey:", v11, v16));
        id v17 = 0LL;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeviceController valueForKey:error:](self, "valueForKey:error:", v12, &v17));
        id v14 = v17;
        if (v14) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, v11);
        }
        else {
          [v16 setValue:v13 forKey:v12];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  [v16 setErrorsForKeys:v5];
  return v16;
}

- (id)deviceType
{
  return &off_1000A6000;
}

@end