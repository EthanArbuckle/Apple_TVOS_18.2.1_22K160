@interface PluginDiskImageGraphNode
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (NSDictionary)pluginParams;
- (NSString)pluginName;
- (PluginDiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9;
- (id)URL;
- (id)toDictionary;
- (void)setPluginName:(id)a3;
- (void)setPluginParams:(id)a3;
@end

@implementation PluginDiskImageGraphNode

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PluginDiskImageGraphNode;
  if (objc_msgSendSuper2(&v12, "validateWithDictionary:error:", v6, a4))
  {
    BOOL v9 = 0;
    if (objc_msgSend( v6,  "validateAndPopObjectForKey:className:isOptional:error:",  @"PluginName",  objc_opt_class(NSString, v7),  0,  a4))
    {
      BOOL v9 = 0;
      if (objc_msgSend( v6,  "validateAndPopObjectForKey:className:isOptional:error:",  @"PluginParams",  objc_opt_class(NSDictionary, v8),  0,  a4))
      {
        if ([v6 count])
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Validation failed, input contains unexpected data."));
          BOOL v9 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v10,  a4);
        }

        else
        {
          BOOL v9 = 1;
        }
      }
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PluginDiskImageGraphNode;
  v18 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:]( &v23,  "initWithTag:UUID:parentNode:metadata:isCache:",  a5,  a6,  a7,  a8,  a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pluginName, a3);
    v20 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v17,  1LL);
    pluginParams = v19->_pluginParams;
    v19->_pluginParams = v20;
  }

  return v19;
}

- (PluginDiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (+[PluginDiskImageGraphNode validateWithDictionary:error:]( &OBJC_CLASS___PluginDiskImageGraphNode,  "validateWithDictionary:error:",  v10,  a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___PluginDiskImageGraphNode;
    objc_super v12 = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:]( &v19,  "initWithDictionary:updateChangesToDict:workDir:error:",  v10,  v8,  v11,  a6);
    if (v12)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PluginName"]);
      pluginName = v12->_pluginName;
      v12->_pluginName = (NSString *)v13;

      uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PluginParams"]);
      pluginParams = v12->_pluginParams;
      v12->_pluginParams = (NSDictionary *)v15;
    }

    self = v12;
    id v17 = self;
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (BOOL)deleteImage
{
  return 1;
}

- (id)toDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PluginDiskImageGraphNode;
  id v3 = -[DiskImageGraphNode toDictionary](&v9, "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginName](self, "pluginName"));
  [v5 setObject:v6 forKeyedSubscript:@"PluginName"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginParams](self, "pluginParams"));
  [v5 setObject:v7 forKeyedSubscript:@"PluginParams"];

  return v5;
}

- (id)URL
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginName](self, "pluginName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PluginDiskImageGraphNode pluginParams](self, "pluginParams"));
  id v5 = +[DIURL newDIURLWithPluginName:params:](&OBJC_CLASS___DIURL, "newDIURLWithPluginName:params:", v3, v4);

  return v5;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void)setPluginParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end