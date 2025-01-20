void BTDevicePickerUILogInit()
{
  os_log_t v0;
  void *v1;
  v0 = os_log_create("com.apple.bluetooth", "BTDevicePickerUI");
  v1 = (void *)BTDevicePickerUILogComponent;
  BTDevicePickerUILogComponent = (uint64_t)v0;
}