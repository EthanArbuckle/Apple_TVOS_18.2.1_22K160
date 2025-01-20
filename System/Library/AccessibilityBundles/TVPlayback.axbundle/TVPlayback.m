}

LABEL_32:
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTVPlaybackGlue, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v1 value:&stru_8A10 table:@"Accessibility"]);
  }
  else {
    v6 = 0LL;
  }

  return v6;
}

LABEL_24:
          if (!v23) {
            goto LABEL_31;
          }
LABEL_28:
          v39 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPlayerAccessibility _accessibilityLastStateAnnouncement]( self,  "_accessibilityLastStateAnnouncement"));
          if (([v23 isEqualToString:v39] & 1) == 0)
          {
            -[TVPPlayerAccessibility _setAccessibilityLastStateAnnouncement:]( self,  "_setAccessibilityLastStateAnnouncement:",  v23);
            v40 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
            v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            -[TVPPlayerAccessibility _accessibilitySetRetainedValue:forKey:]( self,  "_accessibilitySetRetainedValue:forKey:",  v41,  @"kAXLastPlayStateAnnouncementTime");

            UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v23);
          }
        }
      }
    }

LABEL_31:
    goto LABEL_32;
  }

  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___TVPPlayerAccessibility;
  -[TVPPlayerAccessibility _setState:updatedRate:reason:notifyListeners:]( &v42,  "_setState:updatedRate:reason:notifyListeners:",  v10,  v11,  v6,  a4);
LABEL_32:
}

void sub_5A44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_5C90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id objc_msgSend_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:");
}

id objc_msgSend_validateClass_hasInstanceVariable_withType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:hasInstanceVariable:withType:");
}