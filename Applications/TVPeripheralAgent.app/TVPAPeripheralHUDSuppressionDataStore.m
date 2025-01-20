@interface TVPAPeripheralHUDSuppressionDataStore
- (BOOL)isHUDSuppressedForOption:(unint64_t)a3;
- (NSMutableDictionary)dataStore;
- (TVPAPeripheralHUDSuppressionDataStore)init;
- (id)description;
- (unint64_t)_suppressionCountForOption:(unint64_t)a3 andClientBundleIdentifier:(id)a4;
- (void)_decrementSuppressionCountForOption:(unint64_t)a3 andClientBundleIdentifier:(id)a4;
- (void)_incrementSuppressionCountForOption:(unint64_t)a3 andClientBundleIdentifier:(id)a4;
- (void)_setSuppressionCount:(unint64_t)a3 forOption:(unint64_t)a4 andClientBundleIdentifier:(id)a5;
- (void)beginSuppressingWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4;
- (void)endSuppressingWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4;
- (void)setDataStore:(id)a3;
@end

@implementation TVPAPeripheralHUDSuppressionDataStore

- (TVPAPeripheralHUDSuppressionDataStore)init
{
  SEL v11 = a2;
  v12 = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPAPeripheralHUDSuppressionDataStore;
  v12 = -[TVPAPeripheralHUDSuppressionDataStore init](&v10, "init");
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dataStore = v12->_dataStore;
    v12->_dataStore = v2;

    v6 = v12->_dataStore;
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:");

    v8 = v12->_dataStore;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:");
  }

  v5 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  return v5;
}

- (void)beginSuppressingWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4
{
  v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if ((v5 & 1) == 1) {
    -[TVPAPeripheralHUDSuppressionDataStore _incrementSuppressionCountForOption:andClientBundleIdentifier:]( v7,  "_incrementSuppressionCountForOption:andClientBundleIdentifier:",  1LL,  location);
  }
  if ((v5 & 2) == 2) {
    -[TVPAPeripheralHUDSuppressionDataStore _incrementSuppressionCountForOption:andClientBundleIdentifier:]( v7,  "_incrementSuppressionCountForOption:andClientBundleIdentifier:",  2LL,  location);
  }
  objc_storeStrong(&location, 0LL);
}

- (void)endSuppressingWithOptions:(unint64_t)a3 forClientBundleIdentifier:(id)a4
{
  v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if ((v5 & 1) == 1) {
    -[TVPAPeripheralHUDSuppressionDataStore _decrementSuppressionCountForOption:andClientBundleIdentifier:]( v7,  "_decrementSuppressionCountForOption:andClientBundleIdentifier:",  1LL,  location);
  }
  if ((v5 & 2) == 2) {
    -[TVPAPeripheralHUDSuppressionDataStore _decrementSuppressionCountForOption:andClientBundleIdentifier:]( v7,  "_decrementSuppressionCountForOption:andClientBundleIdentifier:",  2LL,  location);
  }
  objc_storeStrong(&location, 0LL);
}

- (BOOL)isHUDSuppressedForOption:(unint64_t)a3
{
  dataStore = self->_dataStore;
  SEL v6 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3);
  id v5 = -[NSMutableDictionary objectForKey:](dataStore, "objectForKey:");
  BOOL v7 = [v5 count] != 0;

  return v7;
}

- (id)description
{
  SEL v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v5[0] appendObject:v6->_dataStore withName:@"dataStore"];
  id v4 = [v5[0] build];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (void)_incrementSuppressionCountForOption:(unint64_t)a3 andClientBundleIdentifier:(id)a4
{
  v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v4 = -[TVPAPeripheralHUDSuppressionDataStore _suppressionCountForOption:andClientBundleIdentifier:]( v8,  "_suppressionCountForOption:andClientBundleIdentifier:",  v6,  location);
  -[TVPAPeripheralHUDSuppressionDataStore _setSuppressionCount:forOption:andClientBundleIdentifier:]( v8,  "_setSuppressionCount:forOption:andClientBundleIdentifier:",  v4 + 1,  v6,  location);
  objc_storeStrong(&location, 0LL);
}

- (void)_decrementSuppressionCountForOption:(unint64_t)a3 andClientBundleIdentifier:(id)a4
{
  objc_super v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  unint64_t v6 = -[TVPAPeripheralHUDSuppressionDataStore _suppressionCountForOption:andClientBundleIdentifier:]( v10,  "_suppressionCountForOption:andClientBundleIdentifier:",  v8,  location);
  if (!v6)
  {
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10000FCE8((uint64_t)v11, v8, (uint64_t)location);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Trying to decrement a 0 HUD suppression count. option=%lu, clientBundleIdentifier=%{public}@",  v11,  0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else {
    id v4 = v6 - 1;
  }
  unint64_t v6 = v4;
  -[TVPAPeripheralHUDSuppressionDataStore _setSuppressionCount:forOption:andClientBundleIdentifier:]( v10,  "_setSuppressionCount:forOption:andClientBundleIdentifier:",  v4,  v8,  location);
  objc_storeStrong(&location, 0LL);
}

- (unint64_t)_suppressionCountForOption:(unint64_t)a3 andClientBundleIdentifier:(id)a4
{
  v17 = self;
  SEL v16 = a2;
  unint64_t v15 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  dataStore = v17->_dataStore;
  unint64_t v8 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15);
  id v13 =  -[NSMutableDictionary bs_safeObjectForKey:ofType:]( dataStore,  "bs_safeObjectForKey:ofType:",  v8,  objc_opt_class(&OBJC_CLASS___NSMutableDictionary));

  char v10 = 0;
  if (location)
  {
    id v4 = (NSNull *)location;
  }

  else
  {
    SEL v11 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
    char v10 = 1;
    id v4 = v11;
  }

  v12 = v4;
  if ((v10 & 1) != 0) {

  }
  id v9 = objc_msgSend(v13, "bs_safeNumberForKey:", v12);
  unint64_t v6 = [v9 unsignedIntValue];
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&location, 0LL);
  return v6;
}

- (void)_setSuppressionCount:(unint64_t)a3 forOption:(unint64_t)a4 andClientBundleIdentifier:(id)a5
{
  v17 = self;
  SEL v16 = a2;
  unint64_t v15 = a3;
  unint64_t v14 = a4;
  id location = 0LL;
  objc_storeStrong(&location, a5);
  dataStore = v17->_dataStore;
  unint64_t v8 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14);
  id v12 =  -[NSMutableDictionary bs_safeObjectForKey:ofType:]( dataStore,  "bs_safeObjectForKey:ofType:",  v8,  objc_opt_class(&OBJC_CLASS___NSMutableDictionary));

  char v9 = 0;
  if (location)
  {
    id v5 = (NSNull *)location;
  }

  else
  {
    char v10 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
    char v9 = 1;
    id v5 = v10;
  }

  id v11 = v5;
  if ((v9 & 1) != 0) {

  }
  if (v15)
  {
    unint64_t v6 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15);
    objc_msgSend(v12, "setObject:forKey:");
  }

  else
  {
    [v12 removeObjectForKey:v11];
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (NSMutableDictionary)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end