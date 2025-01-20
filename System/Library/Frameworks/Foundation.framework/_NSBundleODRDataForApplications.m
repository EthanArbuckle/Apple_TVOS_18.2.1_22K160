@interface _NSBundleODRDataForApplications
+ (_NSBundleODRDataForApplications)dataForBundle:(int)a3 createIfRequired:;
- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4;
- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4;
- (_NSBundleODRDataForApplications)initWithBundle:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation _NSBundleODRDataForApplications

+ (_NSBundleODRDataForApplications)dataForBundle:(int)a3 createIfRequired:
{
  v5 = (NSMapTable *)qword_18C497F38;
  if (!qword_18C497F38)
  {
    if (!a3)
    {
      v7 = 0LL;
      goto LABEL_8;
    }

    v5 = +[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable");
    qword_18C497F38 = (uint64_t)v5;
  }

  uint64_t v6 = -[NSMapTable objectForKey:](v5, "objectForKey:", a2);
  v7 = (_NSBundleODRDataForApplications *)v6;
  if (a3 && !v6)
  {
    v7 = -[_NSBundleODRDataForApplications initWithBundle:]( objc_alloc(&OBJC_CLASS____NSBundleODRDataForApplications),  "initWithBundle:",  a2);
    [(id)qword_18C497F38 setObject:v7 forKey:a2];
    v8 = v7;
  }

- (_NSBundleODRDataForApplications)initWithBundle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____NSBundleODRDataForApplications;
  id v4 = -[_NSBundleODRDataCommon initWithBundle:](&v13, sel_initWithBundle_);
  v5 = dispatch_group_create();
  *((void *)v4 + 8) = v5;
  dispatch_group_enter(v5);
  dispatch_group_enter(*((dispatch_group_t *)v4 + 8));
  id v6 = +[NSBundleResourceRequest _connection](&OBJC_CLASS___NSBundleResourceRequest, "_connection");
  uint64_t v7 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke;
  v12[3] = &unk_189CA0C18;
  v12[4] = v4;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_171;
  v11[3] = &unk_189CA0C40;
  v11[4] = v4;
  objc_msgSend( (id)objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12),  "tagStateInBundle:completionHandler:",  objc_msgSend(a3, "bundleURL"),  v11);
  v10[0] = v7;
  v10[1] = 3221225472LL;
  v10[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_173;
  v10[3] = &unk_189CA0C18;
  v10[4] = v4;
  v9[0] = v7;
  v9[1] = 3221225472LL;
  v9[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_174;
  v9[3] = &unk_189CA0C90;
  v9[4] = v4;
  v9[5] = a3;
  objc_msgSend( (id)objc_msgSend( +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"),  "remoteObjectProxyWithErrorHandler:",  v10),  "beginWithBundleURL:completionHandler:",  objc_msgSend(a3, "bundleURL"),  v9);
  return (_NSBundleODRDataForApplications *)v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  extensionConnections = self->_extensionConnections;
  if (extensionConnections)
  {
    -[NSMutableSet enumerateObjectsUsingBlock:]( extensionConnections,  "enumerateObjectsUsingBlock:",  &__block_literal_global_47);
  }

  dispatch_release((dispatch_object_t)self->_initialStateGroup);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSBundleODRDataForApplications;
  -[_NSBundleODRDataCommon dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSBundleODRDataForApplications;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n\tTags State: %@\n\tAsset Packs to URL: %@",  -[_NSBundleODRDataForApplications description](&v3, sel_description),  self->_tagToTagState,  self->super._assetPackToURL);
}

- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSBundleODRDataForApplications;
  BOOL v6 = -[_NSBundleODRDataCommon assetPacksBecameAvailable:error:](&v10, sel_assetPacksBecameAvailable_error_, a3, a4);
  if (v6)
  {
    -[NSLock lock](self->super._lock, "lock");
    extensionConnections = self->_extensionConnections;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __67___NSBundleODRDataForApplications_assetPacksBecameAvailable_error___block_invoke;
    v9[3] = &unk_189CA0C68;
    v9[4] = a3;
    -[NSMutableSet enumerateObjectsUsingBlock:](extensionConnections, "enumerateObjectsUsingBlock:", v9);
    -[NSLock unlock](self->super._lock, "unlock");
  }

  return v6;
}

- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSBundleODRDataForApplications;
  BOOL v6 = -[_NSBundleODRDataCommon assetPacksBecameUnavailable:error:]( &v10,  sel_assetPacksBecameUnavailable_error_,  a3,  a4);
  if (v6)
  {
    -[NSLock lock](self->super._lock, "lock");
    extensionConnections = self->_extensionConnections;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __69___NSBundleODRDataForApplications_assetPacksBecameUnavailable_error___block_invoke;
    v9[3] = &unk_189CA0C68;
    v9[4] = a3;
    -[NSMutableSet enumerateObjectsUsingBlock:](extensionConnections, "enumerateObjectsUsingBlock:", v9);
    -[NSLock unlock](self->super._lock, "unlock");
  }

  return v6;
}

@end