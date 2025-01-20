@interface GCTVSettingsElementCustomizationControllerRepresentedObject
- (GCSController)controller;
- (GCSElement)baseElement;
- (GCSElement)remappedElement;
- (GCSElementMapping)mapping;
- (GCTVSettingsElementCustomizationController)vc;
- (NSArray)elements;
- (void)selectMappedElement:(id)a3;
- (void)setBaseElement:(id)a3;
- (void)setController:(id)a3;
- (void)setElements:(id)a3;
- (void)setMapping:(id)a3;
- (void)setRemappedElement:(id)a3;
- (void)setVc:(id)a3;
@end

@implementation GCTVSettingsElementCustomizationControllerRepresentedObject

- (void)selectMappedElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GCSElement);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
    -[GCTVSettingsElementCustomizationControllerRepresentedObject willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"elements");
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    -[GCSElementMapping setMappingKey:](self->_mapping, "setMappingKey:", v9);

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    v10 = self->_elements;
    v11 = (GCSElement *)-[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v11)
    {
      v19 = v8;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (i = 0LL; i != v11; i = (GCSElement *)((char *)i + 1))
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[GCSElementMapping mappingKey](self->_mapping, "mappingKey"));
          unsigned int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }

        v11 = (GCSElement *)-[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        if (v11) {
          continue;
        }
        break;
      }

- (GCSElement)baseElement
{
  return self->_baseElement;
}

- (void)setBaseElement:(id)a3
{
}

- (GCSElement)remappedElement
{
  return self->_remappedElement;
}

- (void)setRemappedElement:(id)a3
{
}

- (GCSElementMapping)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (GCSController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (GCTVSettingsElementCustomizationController)vc
{
  return (GCTVSettingsElementCustomizationController *)objc_loadWeakRetained((id *)&self->_vc);
}

- (void)setVc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end