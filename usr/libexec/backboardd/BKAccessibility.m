@interface BKAccessibility
+ (BOOL)_isDisplayBacklightOff;
+ (BOOL)_objectWithinProximity;
+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3;
+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3;
+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5;
+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6;
+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3;
+ (void)_accessibilitySetEventTapCallback:(void *)a3;
+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3;
+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7;
+ (void)_setCapsLockLightOn:(BOOL)a3;
@end

@implementation BKAccessibility

+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
  [v4 injectHIDEvent:a3];
}

+ (void)_accessibilitySetEventTapCallback:(void *)a3
{
}

+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3
{
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer server](&OBJC_CLASS___CAWindowServer, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayWithDisplayId:v4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueId]);
  sub_10001A778(v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer server](&OBJC_CLASS___CAWindowServer, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayWithDisplayId:v4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueId]);
  sub_10001A6E4(v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double y = a3.y;
  double x = a3.x;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[BKHIDEventProcessorRegistry sharedInstance]( &OBJC_CLASS___BKHIDEventProcessorRegistry,  "sharedInstance"));
  id v17 = objc_msgSend(v15, "eventProcessorOfClass:", objc_opt_class(BKHIDDirectTouchEventProcessor, v16));
  id v18 = (id)objc_claimAutoreleasedReturnValue(v17);

  objc_msgSend( v18,  "applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:",  v14,  v13,  v7,  v12,  x,  y);
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5
{
  return _objc_msgSend( a1,  "_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:secureName:",  *(void *)&a4,  a5,  0,  a3.x,  a3.y);
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  double y = a3.y;
  double x = a3.x;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___BKSHIDEventDigitizerPathAttributes);
  objc_msgSend( a1,  "_applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:",  0,  v11,  v6,  v10,  x,  y);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticationMessage]);
  return v12;
}

+ (BOOL)_objectWithinProximity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[BKHIDEventProcessorRegistry sharedInstance]( &OBJC_CLASS___BKHIDEventProcessorRegistry,  "sharedInstance"));
  id v4 = objc_msgSend(v2, "eventProcessorOfClass:", objc_opt_class(BKHIDProximityEventProcessor, v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  LOBYTE(v2) = [v5 isObjectWithinProximity];
  return (char)v2;
}

+ (BOOL)_isDisplayBacklightOff
{
  float v2 = *(float *)&dword_1000DBF94;
  os_unfair_lock_unlock(&stru_1000DBF90);
  return v2 == 0.0;
}

+ (void)_setCapsLockLightOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BKHIDEventProcessorRegistry sharedInstance]( &OBJC_CLASS___BKHIDEventProcessorRegistry,  "sharedInstance"));
  id v6 = objc_msgSend(v4, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v5));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [v7 setCapsLockLightOn:v3];
}

@end