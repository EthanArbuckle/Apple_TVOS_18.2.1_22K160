LABEL_21:
  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

  return a6;
}

LABEL_19:
    a6 = 0LL;
    goto LABEL_8;
  }

  if ([v8 isEqualToString:@"isMainScreen"])
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v13 = v12 == v9;

    IsRectangular = v13;
    goto LABEL_18;
  }

  if ([v8 isEqualToString:@"dbgScreenShapeIsRectangular"])
  {
    if (_UIScreenTypePrivateForScreen(v9) == -1) {
      goto LABEL_19;
    }
    v15 = _UIScreenTypePrivateForScreen(v9);
    IsRectangular = _UIScreenTypePrivateIsRectangular(v15);
LABEL_18:
    v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsRectangular));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"dbgScreenShape"])
  {
    _UIScreenTypePrivateForScreen(v9);
    v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", -1LL));
    goto LABEL_7;
  }

  v16 = v9;
  v17 = v8;
  if (![v17 length]) {
    goto LABEL_34;
  }
  v18 = NSSelectorFromString((NSString *)v17);
  if ((objc_opt_respondsToSelector(v16, v18) & 1) != 0)
  {
    v19 = (NSString *)v17;
  }

  else
  {
    if ((unint64_t)[v17 length] < 2)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v17 uppercaseString]);
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 substringToIndex:1]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uppercaseString]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 substringFromIndex:1]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingString:v22]);
    }

    v24 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v23]);
    v25 = NSSelectorFromString(v24);
    v19 = (objc_opt_respondsToSelector(v16, v25) & 1) != 0 ? v24 : 0LL;
  }

  if (v19)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue([v16 valueForKey:v19]);
  }

  else
  {
LABEL_34:
    if (a6)
    {
      v26 = (__CFString *)v17;
      if (v16) {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v16));
      }
      else {
        v27 = &stru_34740;
      }
      if (v26) {
        v28 = v26;
      }
      else {
        v28 = &stru_34740;
      }
      v33[0] = @"propertyName";
      v33[1] = @"objectDescription";
      v34[0] = v28;
      v34[1] = v27;
      v33[2] = @"errorDescription";
      v34[2] = &stru_34740;
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v30));

      v32 = v31;
      *a6 = v32;

      v19 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v19 = 0LL;
    }
  }

LABEL_8:
  return a6;
}

LABEL_24:
      a6 = (id *)&off_4EE08;
      goto LABEL_12;
    }

    if ([v8 isEqualToString:@"renderInfoOffscreenFlags"])
    {
      LODWORD(v36) = 0;
      v35 = 0LL;
      v15 = HIDWORD(v35);
LABEL_22:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v15));
      goto LABEL_23;
    }

    if ([v8 isEqualToString:@"renderInfoGroupFlags"])
    {
      LODWORD(v36) = 0;
      v35 = 0LL;
      v15 = v36;
      goto LABEL_22;
    }

    if ([v8 isEqualToString:@"dbg_ListID"])
    {
      if ((objc_opt_respondsToSelector(v9, "swiftUI_displayListID") & 1) != 0)
      {
        v14 = (id *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(v9, "swiftUI_displayListID")));
        goto LABEL_23;
      }

LABEL_35:
      a6 = 0LL;
      goto LABEL_12;
    }

    if ([v8 isEqualToString:@"optimizationOpportunities"])
    {
      if ((objc_opt_respondsToSelector(v9, "optimizationOpportunities:") & 1) == 0) {
        goto LABEL_35;
      }
      v16 = v9;
      v17 = 0LL;
    }

    else
    {
      if (![v8 isEqualToString:@"optimizationOpportunities_includingInternals"])
      {
        v10 = v9;
        v18 = v8;
        if (![v18 length]) {
          goto LABEL_48;
        }
        v19 = NSSelectorFromString((NSString *)v18);
        if ((objc_opt_respondsToSelector(v10, v19) & 1) != 0)
        {
          v20 = (NSString *)v18;
        }

        else
        {
          if ((unint64_t)[v18 length] < 2)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v18 uppercaseString]);
          }

          else
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v18 substringToIndex:1]);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uppercaseString]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v18 substringFromIndex:1]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingString:v23]);
          }

          v25 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v24]);
          v26 = NSSelectorFromString(v25);
          v20 = (objc_opt_respondsToSelector(v10, v26) & 1) != 0 ? v25 : 0LL;
        }

        if (v20)
        {
          a6 = (id *)objc_claimAutoreleasedReturnValue([v10 valueForKey:v20]);
        }

        else
        {
LABEL_48:
          if (a6)
          {
            v27 = (__CFString *)v18;
            if (v10) {
              v28 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v10));
            }
            else {
              v28 = &stru_34740;
            }
            if (v27) {
              v29 = v27;
            }
            else {
              v29 = &stru_34740;
            }
            v34[0] = @"propertyName";
            v34[1] = @"objectDescription";
            v35 = v29;
            v36 = v28;
            v34[2] = @"errorDescription";
            v37 = &stru_34740;
            v30 = v29;
            v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  v34,  3LL));
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v31));

            v33 = v32;
            *a6 = v33;

            v20 = 0LL;
            a6 = 0LL;
          }

          else
          {
            v20 = 0LL;
          }
        }

        goto LABEL_11;
      }

      if ((objc_opt_respondsToSelector(v9, "optimizationOpportunities:") & 1) == 0) {
        goto LABEL_35;
      }
      v16 = v9;
      v17 = 1LL;
    }

    v14 = (id *)objc_claimAutoreleasedReturnValue([v16 optimizationOpportunities:v17]);
    goto LABEL_23;
  }

  v10 = (id)objc_claimAutoreleasedReturnValue([v9 presentationLayer]);
  if (!v10)
  {
    v10 = v9;
    if (!v10) {
      goto LABEL_35;
    }
  }

  v11 = (id *)CAEncodeLayerTree(v10);
LABEL_10:
  a6 = v11;
LABEL_11:

LABEL_12:
  return a6;
}

LABEL_6:
      GenericRGB = v12;
LABEL_7:

      goto LABEL_8;
    }

    v14 = [v9 depthStencilPixelFormat];
  }

  Name = MTLPixelFormatGetName(v14);
  if (Name) {
    v20 = (const char *)Name;
  }
  else {
    v20 = "Invalid";
  }
  GenericRGB = (id *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
  if ([GenericRGB hasPrefix:@"MTLPixelFormat"])
  {
    v21 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(GenericRGB, "substringFromIndex:", objc_msgSend(@"MTLPixelFormat", "length")));

    GenericRGB = v21;
  }

  return v4;
}

LABEL_8:
  return GenericRGB;
}

LABEL_31:
  v50 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage _imageResizedForDisplayInInspector](self, "_imageResizedForDisplayInInspector"));
  v51 = UIImagePNGRepresentation(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

  v53 = v52;
  v54 = (unint64_t)v26;
  if (v54 | v53)
  {
    Mutable = CFDictionaryCreateMutable( 0LL,  2LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v56 = Mutable;
    v57 = v59;
    if (v53) {
      CFDictionaryAddValue(Mutable, @"imageData", (const void *)v53);
    }
    if (v54) {
      CFDictionaryAddValue(v56, @"metadata", (const void *)v54);
    }
  }

  else
  {
    v56 = 0LL;
    v57 = v59;
  }

  return v56;
}

LABEL_57:
      a6 = 0LL;
      goto LABEL_40;
    }

    if ([v9 isEqualToString:@"layer"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_layer"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"dbgSubviewHierarchy"])
    {
      if ((objc_opt_respondsToSelector(v10, "makeViewDebugData") & 1) != 0)
      {
        v14 = (id *)objc_claimAutoreleasedReturnValue([v10 makeViewDebugData]);
        goto LABEL_39;
      }

      goto LABEL_57;
    }

    if ([v9 isEqualToString:@"dbgRenderingModeIsMultiLayer"])
    {
      v22 = objc_msgSend(v10, "__dbg_renderingModeIsMultiLayer");
      goto LABEL_47;
    }

    if ([v9 isEqualToString:@"anchorPoint"])
    {
      v12 = (id)objc_claimAutoreleasedReturnValue([v10 layer]);
      [v12 anchorPoint];
LABEL_66:
      valuePtr = v25;
      v47[0] = v26;
      v27 = (const void **)malloc(0x10uLL);
      *v27 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
      v27[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, v47);
      a6 = (id *)CFArrayCreate(0LL, v27, 2LL, &kCFTypeArrayCallBacks);
      CFRelease(*v27);
      CFRelease(v27[1]);
      free(v27);
      goto LABEL_7;
    }

    if ([v9 isEqualToString:@"anchorPointZ"])
    {
      v12 = (id)objc_claimAutoreleasedReturnValue([v10 layer]);
      [v12 anchorPointZ];
    }

    else
    {
      if ([v9 isEqualToString:@"position"])
      {
        v12 = (id)objc_claimAutoreleasedReturnValue([v10 layer]);
        [v12 position];
        goto LABEL_66;
      }

      if (![v9 isEqualToString:@"zPosition"])
      {
        if ([v9 isEqualToString:@"traitCollectionUserInterfaceStyle"])
        {
          v12 = (id)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
          v28 = [v12 userInterfaceStyle];
        }

        else if ([v9 isEqualToString:@"traitCollectionVerticalSizeClass"])
        {
          v12 = (id)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
          v28 = [v12 verticalSizeClass];
        }

        else if ([v9 isEqualToString:@"traitCollectionHorizontalSizeClass"])
        {
          v12 = (id)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
          v28 = [v12 horizontalSizeClass];
        }

        else
        {
          if (![v9 isEqualToString:@"traitCollectionLayoutDirection"])
          {
            v12 = v10;
            v29 = v9;
            if (![v29 length]) {
              goto LABEL_91;
            }
            v30 = NSSelectorFromString((NSString *)v29);
            if ((objc_opt_respondsToSelector(v12, v30) & 1) != 0)
            {
              v31 = (NSString *)v29;
            }

            else
            {
              if ((unint64_t)[v29 length] < 2)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue([v29 uppercaseString]);
              }

              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue([v29 substringToIndex:1]);
                v33 = (void *)objc_claimAutoreleasedReturnValue([v32 uppercaseString]);
                v34 = (void *)objc_claimAutoreleasedReturnValue([v29 substringFromIndex:1]);
                v35 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByAppendingString:v34]);
              }

              v36 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v35]);
              v37 = NSSelectorFromString(v36);
              v31 = (objc_opt_respondsToSelector(v12, v37) & 1) != 0 ? v36 : 0LL;
            }

            if (v31)
            {
              a6 = (id *)objc_claimAutoreleasedReturnValue([v12 valueForKey:v31]);
            }

            else
            {
LABEL_91:
              if (a6)
              {
                v38 = (__CFString *)v29;
                if (v12) {
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v12));
                }
                else {
                  v39 = &stru_34740;
                }
                if (v38) {
                  v40 = v38;
                }
                else {
                  v40 = &stru_34740;
                }
                v45[0] = @"propertyName";
                v45[1] = @"objectDescription";
                valuePtr = v40;
                v47[0] = v39;
                v45[2] = @"errorDescription";
                v47[1] = &stru_34740;
                v41 = v40;
                v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &valuePtr,  v45,  3LL));
                v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v42));

                v44 = v43;
                *a6 = v44;

                v31 = 0LL;
                a6 = 0LL;
              }

              else
              {
                v31 = 0LL;
              }
            }

            goto LABEL_7;
          }

          v12 = (id)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
          v28 = [v12 layoutDirection];
        }

        v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v28));
        goto LABEL_6;
      }

      v12 = (id)objc_claimAutoreleasedReturnValue([v10 layer]);
      [v12 zPosition];
    }

    v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    goto LABEL_6;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 accessibilityCustomActions]);
LABEL_5:
  v12 = v11;
  v13 = (id *)objc_claimAutoreleasedReturnValue([v11 description]);
LABEL_6:
  a6 = v13;
LABEL_7:

LABEL_40:
  return a6;
}

char *resetDyldInsertLibraries()
{
  result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    v1 = result;
    strlen(result);
    uint64_t v2 = __chkstk_darwin();
    v3 = (char *)&v15 - ((v2 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    int v4 = *(unsigned __int8 *)v1;
    if (!*v1) {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
    v5 = (char *)&v15 - ((v2 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    int v6 = *(unsigned __int8 *)v1;
    do
    {
      for (i = 0LL; v6; int v6 = v1[++i])
      {
        if (v6 == 58) {
          break;
        }
      }

      v8 = v1;
      if (i)
      {
        size_t v9 = i;
        while (v1[v9] != 47)
        {
          if (!--v9)
          {
            int v4 = *(unsigned __int8 *)v1;
            v8 = v1;
            goto LABEL_13;
          }
        }

        v8 = &v1[v9];
        int v4 = 47;
      }

LABEL_13:
      BOOL v10 = v4 == 47;
      BOOL v11 = v4 == 47;
      if (v10) {
        v12 = v8 + 1;
      }
      else {
        v12 = v8;
      }
      if (&v1[i] == v12)
      {
        v1 += i;
      }

      else
      {
        if (strncmp(v12, "libViewDebuggerSupport.dylib", v1 - v8 - v11 + i))
        {
          v13 = (char *)v3;
          if (v5 != v3)
          {
            char *v5 = 58;
            v13 = v5 + 1;
          }

          v5 = stpncpy(v13, v1, i);
          int v6 = v1[i];
        }

        if (v6 == 58) {
          v14 = v1 + 1;
        }
        else {
          v14 = v1;
        }
        v1 = &v14[i];
        int v6 = v14[i];
      }

      int v4 = v6;
    }

    while (v6);
    if (v5 > v3)
    {
      char *v5 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v3, 1);
    }

    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }

  return result;
}
}

void sub_DC80( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, NSString *a30, const __CFString *a31, NSArray *a32)
{
  if (a2 == 1)
  {
    [objc_begin_catch(exception_object) callStackSymbols];
    a30 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exception gathering view hierarchy information: %@ \n%@");
    a31 = @"exceptions";
    a32 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &a30, 1LL);
    +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &a32,  &a31,  1LL),  200LL,  0LL,  0LL);
    objc_end_catch();
    JUMPOUT(0xDC40LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_48:
  return v18;
}

LABEL_10:
    v12 = 0LL;
    goto LABEL_11;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rootViewController]);

  if (!v8) {
    goto LABEL_10;
  }
  size_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 rootViewController]);
  v16 = v9;
  BOOL v10 = &v16;
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v10,  1LL,  v14,  v15,  v16));

LABEL_11:
  return v12;
}

LABEL_7:
  return a6;
}

LABEL_18:
  return v7;
}

LABEL_12:
        BOOL v10 = 0LL;
        goto LABEL_13;
      }

      uint64_t v15 = objc_claimAutoreleasedReturnValue([a1 _renderEffectViewUsingDrawHierarchyInRect:v6]);
    }

    CurrentContext = (UIImage *)v15;
    if (!v15) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

LABEL_14:
  return v10;
}

LABEL_11:
  return (char)v6;
}

NSMutableArray *arrayOfObjectPointers(void *a1)
{
  id v1 = a1;
  uint64_t v2 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v1 count]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7)));
        -[NSMutableArray addObject:](v2, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return v2;
}

id viewWantsAutoLayout(void *a1)
{
  id v1 = a1;
  if ((objc_opt_respondsToSelector(v1, "_wantsAutolayout") & 1) != 0) {
    id v2 = [v1 _wantsAutolayout];
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

LABEL_29:
  return a6;
}

LABEL_5:
    id v4 = 0LL;
  }

id objc_msgSend_zPosition(void *a1, const char *a2, ...)
{
  return [a1 zPosition];
}