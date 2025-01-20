@interface PluginDiskImageGraphNode
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PluginDiskImageGraphNode;
  if (objc_msgSendSuper2(&v10, sel_validateWithDictionary_error_, v6, a4))
  {
    BOOL v7 = 0;
    if ([v6 validateAndPopObjectForKey:@"PluginName" className:objc_opt_class() isOptional:0 error:a4])
    {
      BOOL v7 = 0;
      if ([v6 validateAndPopObjectForKey:@"PluginParams" className:objc_opt_class() isOptional:0 error:a4])
      {
        if ([v6 count])
        {
          objc_msgSend( NSString,  "stringWithFormat:",  @"Validation failed, input contains unexpected data.");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v7 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v8,  a4);
        }

        else
        {
          BOOL v7 = 1;
        }
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PluginDiskImageGraphNode;
  v18 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:]( &v23,  sel_initWithTag_UUID_parentNode_metadata_isCache_,  a5,  a6,  a7,  a8,  a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pluginName, a3);
    uint64_t v20 = [objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v17 copyItems:1];
    pluginParams = v19->_pluginParams;
    v19->_pluginParams = (NSDictionary *)v20;
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
    v12 = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:]( &v19,  sel_initWithDictionary_updateChangesToDict_workDir_error_,  v10,  v8,  v11,  a6);
    if (v12)
    {
      uint64_t v13 = [v10 objectForKeyedSubscript:@"PluginName"];
      pluginName = v12->_pluginName;
      v12->_pluginName = (NSString *)v13;

      uint64_t v15 = [v10 objectForKeyedSubscript:@"PluginParams"];
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
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PluginDiskImageGraphNode;
  v3 = -[DiskImageGraphNode toDictionary](&v8, sel_toDictionary);
  v4 = (void *)[v3 mutableCopy];
  v5 = -[PluginDiskImageGraphNode pluginName](self, "pluginName");
  [v4 setObject:v5 forKeyedSubscript:@"PluginName"];
  v6 = -[PluginDiskImageGraphNode pluginParams](self, "pluginParams");
  [v4 setObject:v6 forKeyedSubscript:@"PluginParams"];

  return v4;
}

- (id)URL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PluginDiskImageGraphNode pluginParams](self, "pluginParams");
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

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v4 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v10 = 72;
    __int16 v11 = 2080;
    v12 = "-[PluginDiskImageGraphNode(Append) validateAppendedImageWithInfo:error:]";
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v6);
      free(v6);
    }
  }

  else
  {
    getDIOSLog();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v10 = 72;
      __int16 v11 = 2080;
      v12 = "-[PluginDiskImageGraphNode(Append) validateAppendedImageWithInfo:error:]";
      _os_log_impl( &dword_188046000,  v7,  OS_LOG_TYPE_DEFAULT,  "%.*s: Appending to plugin node, skipping validation.",  buf,  0x12u);
    }
  }

  *__error() = v4;
  return 1;
}

@end