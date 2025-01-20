@interface GCTVSettingsElementCustomizationControllerRepresentedObject_Legacy
- (GCTVSettingsElementCustomizationController_Legacy)controller;
- (NSArray)mappableControllerElements;
- (void)selectMappedElement:(id)a3;
- (void)setController:(id)a3;
- (void)setMappableControllerElements:(id)a3;
@end

@implementation GCTVSettingsElementCustomizationControllerRepresentedObject_Legacy

- (void)selectMappedElement:(id)a3
{
  id v14 = a3;
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);

  if (WeakRetained)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v14 representedObject]);
    id v7 = objc_loadWeakRetained((id *)p_controller);
    [v7 setMappedElement:v6];

    id v8 = objc_loadWeakRetained((id *)p_controller);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 settings]);
    id v10 = objc_loadWeakRetained((id *)p_controller);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 element]);
    id v12 = objc_loadWeakRetained((id *)p_controller);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mappedElement]);
    [v9 setMappingForElement:v11 toElement:v13];
  }
}

- (NSArray)mappableControllerElements
{
  return self->_mappableControllerElements;
}

- (void)setMappableControllerElements:(id)a3
{
}

- (GCTVSettingsElementCustomizationController_Legacy)controller
{
  return (GCTVSettingsElementCustomizationController_Legacy *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end