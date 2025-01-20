LABEL_8:
}

id _DBGDictionaryDescribesDebugHierarchyObjectReference(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"propertyLogicalType"]);
  id v2 = [v1 isEqualToString:@"DebugHierarchyLogicalPropertyTypePointer"];

  return v2;
}

id DebugHierarchySnapshotModelOSLog()
{
  if (DebugHierarchySnapshotModelOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchySnapshotModelOSLog___dvt_lazy_init_predicate, &__block_literal_global_113);
  }
  return (id)DebugHierarchySnapshotModelOSLog___dvt_lazy_init_variable;
}

LABEL_4:
  return v8;
}

  return v8;
}

LABEL_13:
  }

  return v8;
}
}

id DBGValueClassForPropertyWith(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 length];
  if (v5)
  {
    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeCustom"])
    {
      v7 = &OBJC_CLASS___DBGCustomValue;
LABEL_73:
      id v5 = (id)objc_opt_class(v7, v6);
      goto LABEL_74;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeClass"])
    {
      v7 = &OBJC_CLASS___DBGClass;
      goto LABEL_73;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeObjectInfo"])
    {
      v7 = &OBJC_CLASS___DBGObjectInfo;
      goto LABEL_73;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypePointer"])
    {
      v7 = &OBJC_CLASS___DBGObjectPointer;
      goto LABEL_73;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeEnum"])
    {
      v7 = &OBJC_CLASS___DBGEnumValue;
      goto LABEL_73;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeData"])
    {
      v7 = &OBJC_CLASS___DBGData;
      goto LABEL_73;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeBool"])
    {
      v7 = &OBJC_CLASS___DBGBool;
      goto LABEL_73;
    }

    if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeNumber"])
    {
      if ([v4 isEqualToString:@"CGf"])
      {
        v7 = &OBJC_CLASS___DBGCGFloat;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"f"])
      {
        v7 = &OBJC_CLASS___DBGFloat;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"d"])
      {
        v7 = &OBJC_CLASS___DBGDouble;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"integer"])
      {
        v7 = &OBJC_CLASS___DBGInteger;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"uinteger"])
      {
        v7 = &OBJC_CLASS___DBGUnsignedInteger;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"i"])
      {
        v7 = &OBJC_CLASS___DBGInt;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"ui"])
      {
        v7 = &OBJC_CLASS___DBGUnsignedInt;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"l"])
      {
        v7 = &OBJC_CLASS___DBGLong;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"ul"])
      {
        v7 = &OBJC_CLASS___DBGUnsignedLong;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"ll"])
      {
        v7 = &OBJC_CLASS___DBGLongLong;
        goto LABEL_73;
      }

      if ([v4 isEqualToString:@"ull"])
      {
        v7 = &OBJC_CLASS___DBGUnsignedLongLong;
        goto LABEL_73;
      }

      NSLog( @"%s - Error: Unsupported format (%@) for logical type 'Number'",  "Class<DBGValue> DBGValueClassForPropertyWith(NSString *__strong, NSString *__strong)",  v4);
    }

    else
    {
      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeString"])
      {
        v7 = &OBJC_CLASS___DBGString;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeAttributedString"])
      {
        v7 = &OBJC_CLASS___DBGAttributedString;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeColor"])
      {
        v7 = &OBJC_CLASS___DBGColor;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeImage"])
      {
        v7 = &OBJC_CLASS___DBGImage;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeFont"])
      {
        v7 = &OBJC_CLASS___DBGFont;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypePoint"])
      {
        v7 = &OBJC_CLASS___DBGPoint;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeSize"])
      {
        v7 = &OBJC_CLASS___DBGSize;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeRect"])
      {
        v7 = &OBJC_CLASS___DBGRect;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeOffset"])
      {
        v7 = &OBJC_CLASS___DBGOffset;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeInsets"])
      {
        v7 = &OBJC_CLASS___DBGInsets;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeVector2"])
      {
        v7 = &OBJC_CLASS___DBGVector2;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeVector3"])
      {
        v7 = &OBJC_CLASS___DBGVector3;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeVector4"])
      {
        v7 = &OBJC_CLASS___DBGVector4;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeMatrix2"])
      {
        v7 = &OBJC_CLASS___DBGMatrix2;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeMatrix3"])
      {
        v7 = &OBJC_CLASS___DBGMatrix3;
        goto LABEL_73;
      }

      if ([v3 isEqualToString:@"DebugHierarchyLogicalPropertyTypeMatrix4"])
      {
        v7 = &OBJC_CLASS___DBGMatrix4;
        goto LABEL_73;
      }
    }

    id v5 = 0LL;
  }

LABEL_74:
  id v8 = v5;
  return v8;
}

void sub_9B7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_18:
        v22 = 1;
LABEL_25:

        goto LABEL_26;
      }

      v22 = 1;
LABEL_26:
      v25 = (void *)objc_claimAutoreleasedReturnValue([v11 propertyWithName:@"dbgRenderingModeIsMultiLayer"]);
      v26 = v25;
      if (v25)
      {
      }

      else if (v22)
      {
        goto LABEL_33;
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
      v28 = [v27 isKindOfTypeWithName:@"UIImageView"];

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v11 propertyWithName:@"dbg_holdsSymbolImage"]);
        if (v29)
        {
          v30 = v29;
          v31 = [v29 BOOLValue];

          if (v31)
          {
LABEL_33:
            if ([v11 hasPropertyWithName:@"snapshotImage"])
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
              [v43 addObject:v32];
            }
          }
        }
      }

LABEL_36:
      v10 = (char *)v10 + 1;
    }

    while (v10 != v8);
    v36 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    id v8 = v36;
  }

  while (v36);
LABEL_43:

  if ([v43 count])
  {
    v37 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
    v38 = [v43 copy];
    [v37 setObjectIdentifiers:v38 exlusive:0];

    [v37 setPropertyNames:&off_29CD8 exlusive:0];
    v54 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch rendered view snapshots",  2LL,  v39,  0LL));
  }

  else
  {
    v40 = 0LL;
  }

  return v40;
}

  return v16;
}

LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);
  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withValue:v14]);

  return v15;
}

id objc_msgSend__recursivelyDescribeGroup_withIndentation_isAdditonalGroup_includeProperties_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:");
}

id objc_msgSend_writeToURL_options_originalContentsURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:originalContentsURL:error:");
}