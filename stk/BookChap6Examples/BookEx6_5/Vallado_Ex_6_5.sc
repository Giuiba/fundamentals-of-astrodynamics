stk.v.11.0
WrittenBy    STK_v11.0.0
BEGIN Scenario
    Name            Vallado_Ex_6_5

BEGIN Epoch

    Epoch        25 Dec 2012 00:00:00.000000000
    SmartEpoch
	BEGIN	EVENT
			Epoch	25 Dec 2012 00:00:00.000000000
			EventEpoch
				BEGIN	EVENT
					Type	EVENT_LINKTO
					Name	AnalysisStartTime
				END	EVENT
			EpochState	Implicit
	END	EVENT


END Epoch

BEGIN Interval

Start                   25 Dec 2012 00:00:00.000000000
Stop                    28 Dec 2012 00:00:00.000000000
    SmartInterval
	BEGIN	EVENTINTERVAL
			BEGIN Interval
				Start	25 Dec 2012 00:00:00.000000000
				Stop	28 Dec 2012 00:00:00.000000000
			END Interval
			IntervalState	Explicit
	END	EVENTINTERVAL

EpochUsesAnalStart      No
AnimStartUsesAnalStart  Yes
AnimStopUsesAnalStop    No

END Interval

BEGIN EOPFile

    EOPFilename     EOP-v1.1.txt

END EOPFile

BEGIN GlobalPrefs

    SatelliteNoOrbWarning    No
    MissilePerigeeWarning    No
    MissileStopTimeWarning   No
    AircraftWGS84Warning     Always
END GlobalPrefs

BEGIN CentralBody

    PrimaryBody     Earth

END CentralBody

BEGIN CentralBodyTerrain

    BEGIN CentralBody
        Name            Earth
        UseTerrainCache Yes
        TotalCacheSize  402653184

        BEGIN StreamingTerrain
            UseCurrentStreamingTerrainServer     No
            StreamingTerrainServerName           assets.agi.com/stk-terrain/
            StreamingTerrainAzimuthElevationMaskEnabled       Yes
            StreamingTerrainObscurationEnabled       Yes
            StreamingTerrainCoverageGridObscurationEnabled       Yes
        END StreamingTerrain
    END CentralBody

END CentralBodyTerrain

BEGIN StarCollection

    Name     Hipparcos 2 Mag 6

END StarCollection

BEGIN ScenarioLicenses
    Module    AMMv11.0
    Module    ASTGv11.0
    Module    AnalysisWBv11.0
    Module    CATv11.0
    Module    COVv11.0
    Module    Commv11.0
    Module    DISv11.0
    Module    RT3Clientv11.0
    Module    Radarv11.0
    Module    SEETv11.0
    Module    STKIntegrationv11.0
    Module    STKParallelComputingv11.0
    Module    STKProfessionalv11.0
    Module    STKTIMv11.0
    Module    STKv11.0
    Module    SatProv11.0
    Module    TIREMv11.0
    Module    UPropv11.0
    Module    USGOVv11.0
END ScenarioLicenses

BEGIN WebData
        EnableWebTerrainData    No
        SaveWebTerrainDataPasswords    No
        BEGIN ConfigServerDataList
            BEGIN ConfigServerData
                Name "globeserver.agi.com"
                Port 80
                DataURL "bin/getGlobeSvrConfig.pl"
            END ConfigServerData
        END ConfigServerDataList
END WebData

BEGIN Extensions
    
    BEGIN Graphics

BEGIN Animation

    StartTime          25 Dec 2012 00:00:00.000000000
    EndTimeStr         +14 days
    CurrentTime        25 Dec 2012 00:00:00.000000000
    Mode               Stop
    Direction          Forward
    UpdateDelta        10.000000
    RefreshDelta       HighSpeed
    XRealTimeMult      1.000000
    RealTimeOffset     0.000000
    XRtStartFromPause  Yes

END Animation


        BEGIN DisplayFlags
            ShowLabels           On
            ShowPassLabel        Off
            ShowElsetNum         Off
            ShowGndTracks        Off
            ShowGndMarkers       Off
            ShowOrbitMarkers     On
            ShowPlanetOrbits     Off
            ShowPlanetCBIPos     On
            ShowPlanetCBILabel   On
            ShowPlanetGndPos     Off
            ShowPlanetGndLabel   Off
            ShowSensors          On
            ShowWayptMarkers     Off
            ShowWayptTurnMarkers Off
            ShowOrbits           On
            ShowDtedRegions      Off
            ShowAreaTgtCentroids On
            ShowToolBar          On
            ShowStatusBar        On
            ShowScrollBars       On
            AllowAnimUpdate      Off
            AccShowLine          On
            AccAnimHigh          On
            AccStatHigh          On
            ShowPrintButton      On
            ShowAnimButtons      On
            ShowAnimModeButtons  On
            ShowZoomMsrButtons   On
            ShowMapCbButton      Off
        END DisplayFlags

BEGIN WinFonts

    System
    MS Sans Serif,22,0,0
    MS Sans Serif,28,0,0

END WinFonts

BEGIN MapData

    Begin TerrainConverterData
           NorthLat        0.00000000000000e+000
           EastLon         0.00000000000000e+000
           SouthLat        0.00000000000000e+000
           WestLon         0.00000000000000e+000
           ColorByRGB      No
           AltsFromMSL     No
           UseColorRamp    Yes
           UseRegionMinMax Yes
           SizeSameAsSrc   Yes
           MinAltHSV       0.00000000000000e+000 7.00000000000000e-001 8.00000000000000e-001 4.00000000000000e-001
           MaxAltHSV       1.00000000000000e+006 0.00000000000000e+000 2.00000000000000e-001 1.00000000000000e+000
           SmoothColors    Yes
           CreateChunkTrn  No
           OutputFormat    PDTTX
    End TerrainConverterData

    DisableDefKbdActions     Off
    TextShadowStyle          None
    TextShadowColor          #000000
    BingLevelOfDetailScale   2.000000
    BEGIN Map
        MapNum         1
        TrackingMode   LatLon
        PickEnabled    On
        PanEnabled     On

        BEGIN MapAttributes
            PrimaryBody          Earth
            SecondaryBody        Sun
            CenterLatitude       -0.306720
            CenterLongitude      -81.535974
            ProjectionAltitude   63621860.000000
            FieldOfView          35.000000
            OrthoDisplayDistance 20000000.000000
            TransformTrajectory  On
            EquatorialRadius     6378137.000000
            BackgroundColor      #000000
            LatLonLines          On
            LatSpacing           30.000000
            LonSpacing           30.000000
            LatLonLineColor      #999999
            LatLonLineStyle      2
            ShowOrthoDistGrid    Off
            OrthoGridXSpacing    5
            OrthoGridYSpacing    5
            OrthoGridColor       #ffffff
            ShowImageExtents     Off
            ImageExtentLineColor #ffffff
            ImageExtentLineStyle 0
            ImageExtentLineWidth 1.000000
            ShowImageNames       Off
            ImageNameFont        0
            Projection           EquidistantCylindrical
            Resolution           High
            CoordinateSys        ECF
            UseBackgroundImage   On
            UseBingForBackground Off
            BingType             Aerial
            BingLogoHorizAlign   Right
            BingLogoVertAlign    Bottom
            BackgroundImageFile  Basic.bmp
            UseNightLights       Off
            NightLightsFactor    3.500000
            UseCloudsFile        Off
            BEGIN ZoomLocations
                BEGIN ZoomLocation
                    CenterLat    0.000000
                    CenterLon    0.000000
                    ZoomWidth    359.999998
                    ZoomHeight   180.000000
                End ZoomLocation
                BEGIN ZoomLocation
                    CenterLat    -0.247934
                    CenterLon    -79.779759
                    ZoomWidth    21.059876
                    ZoomHeight   7.438016
                End ZoomLocation
                BEGIN ZoomLocation
                    CenterLat    -0.306720
                    CenterLon    -81.535974
                    ZoomWidth    8.171173
                    ZoomHeight   2.865789
                End ZoomLocation
            END ZoomLocations
            UseVarAspectRatio    No
            SwapMapResolution    Yes
            NoneToVLowSwapDist   2000000.000000
            VLowToLowSwapDist    20000.000000
            LowToMediumSwapDist  10000.000000
            MediumToHighSwapDist 5000.000000
            HighToVHighSwapDist  1000.000000
            VHighToSHighSwapDist 100.000000
            BEGIN Axes
                DisplayAxes no
                CoordSys    CBI
                2aryCB      Sun
                Display+x   yes
                Label+x     yes
                Color+x     #ffffff
                Scale+x     3.000000
                Display-x   yes
                Label-x     yes
                Color-x     #ffffff
                Scale-x     3.000000
                Display+y   yes
                Label+y     yes
                Color+y     #ffffff
                Scale+y     3.000000
                Display-y   yes
                Label-y     yes
                Color-y     #ffffff
                Scale-y     3.000000
                Display+z   yes
                Label+z     yes
                Color+z     #ffffff
                Scale+z     3.000000
                Display-z   yes
                Label-z     yes
                Color-z     #ffffff
                Scale-z     3.000000
            END Axes

        END MapAttributes

        BEGIN MapList
            BEGIN Detail
                Alias RWDB2_Coastlines
                Show Yes
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_International_Borders
                Show Yes
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_Islands
                Show Yes
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_Lakes
                Show No
                Color #87cefa
            END Detail
            BEGIN Detail
                Alias RWDB2_Provincial_Borders
                Show No
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_Rivers
                Show No
                Color #87cefa
            END Detail
        END MapList


        BEGIN MapAnnotations
        END MapAnnotations

        BEGIN DisplayFlags
            ShowLabels           On
            ShowPassLabel        Off
            ShowElsetNum         Off
            ShowGndTracks        On
            ShowGndMarkers       On
            ShowOrbitMarkers     On
            ShowPlanetOrbits     Off
            ShowPlanetCBIPos     On
            ShowPlanetCBILabel   On
            ShowPlanetGndPos     On
            ShowPlanetGndLabel   On
            ShowSensors          On
            ShowWayptMarkers     Off
            ShowWayptTurnMarkers Off
            ShowOrbits           On
            ShowDtedRegions      Off
            ShowAreaTgtCentroids On
            ShowToolBar          On
            ShowStatusBar        On
            ShowScrollBars       On
            AllowAnimUpdate      Off
            AccShowLine          On
            AccAnimHigh          On
            AccStatHigh          On
            ShowPrintButton      On
            ShowAnimButtons      On
            ShowAnimModeButtons  On
            ShowZoomMsrButtons   On
            ShowMapCbButton      Off
        END DisplayFlags

        BEGIN SoftVTR
            OutputFormat     BMP
            Directory        C:\DOCUME~1\eameek\LOCALS~1\Temp
            BaseName         Frame
            Digits           4
            Frame            0
            LastAnimTime     0.000000
            OutputMode       Normal
            HiResAssembly    Assemble
            HRWidth          6000
            HRHeight         4500
            HRDPI            600.000000
            UseSnapInterval  No
            SnapInterval     0.000000
            WmvCodec         "Windows Media Video 9"
            Framerate        30
            Bitrate          3000000
        END SoftVTR


        BEGIN TimeDisplay
            Show             0
            TextColor        #ffffff
            TextTranslucency 0.000000
            ShowBackground   0
            BackColor        #4d4d4d
            BackTranslucency 0.400000
            XPosition        20
            YPosition        -20
        END TimeDisplay

        BEGIN LightingData
            DisplayAltitude              0.000000
            SubsolarPoint                Off
            SubsolarPointColor           #ffff00
            SubsolarPointMarkerStyle     2

            ShowUmbraLine                Off
            UmbraLineColor               #0000ff
            UmbraLineStyle               0
            UmbraLineWidth               2
            FillUmbra                    Off
            UmbraFillColor               #0000ff
            ShowSunlightLine             Off
            SunlightLineColor            #ffff00
            SunlightLineStyle            0
            SunlightLineWidth            2
            FillSunlight                 Off
            SunlightFillColor            #ffff00
            SunlightMinOpacity           0.000000
            SunlightMaxOpacity           0.200000
            UmbraMaxOpacity              0.700000
            UmbraMinOpacity              0.400000
        END LightingData
    END Map

    BEGIN MapStyles

        UseStyleTime        No

        BEGIN Style
        Name                No_Map_Bckgrnd
        Time                -204638401.000000
        UpdateDelta         60.000000

        BEGIN MapAttributes
            PrimaryBody          Earth
            SecondaryBody        Sun
            CenterLatitude       0.000000
            CenterLongitude      0.000000
            ProjectionAltitude   63621860.000000
            FieldOfView          35.000000
            OrthoDisplayDistance 20000000.000000
            TransformTrajectory  On
            EquatorialRadius     6378137.000000
            BackgroundColor      #000000
            LatLonLines          On
            LatSpacing           30.000000
            LonSpacing           30.000000
            LatLonLineColor      #999999
            LatLonLineStyle      2
            ShowOrthoDistGrid    Off
            OrthoGridXSpacing    5
            OrthoGridYSpacing    5
            OrthoGridColor       #ffffff
            ShowImageExtents     Off
            ImageExtentLineColor #ffffff
            ImageExtentLineStyle 0
            ImageExtentLineWidth 1.000000
            ShowImageNames       Off
            ImageNameFont        0
            Projection           EquidistantCylindrical
            Resolution           VeryLow
            CoordinateSys        ECF
            UseBackgroundImage   Off
            UseBingForBackground Off
            BingType             Aerial
            BingLogoHorizAlign   Right
            BingLogoVertAlign    Bottom
            UseNightLights       Off
            NightLightsFactor    3.500000
            UseCloudsFile        Off
            BEGIN ZoomLocations
                BEGIN ZoomLocation
                    CenterLat    0.000000
                    CenterLon    0.000000
                    ZoomWidth    359.999998
                    ZoomHeight   180.000000
                End ZoomLocation
            END ZoomLocations
            UseVarAspectRatio    No
            SwapMapResolution    Yes
            NoneToVLowSwapDist   2000000.000000
            VLowToLowSwapDist    20000.000000
            LowToMediumSwapDist  10000.000000
            MediumToHighSwapDist 5000.000000
            HighToVHighSwapDist  1000.000000
            VHighToSHighSwapDist 100.000000
            BEGIN Axes
                DisplayAxes no
                CoordSys    CBI
                2aryCB      Sun
                Display+x   yes
                Label+x     yes
                Color+x     #ffffff
                Scale+x     3.000000
                Display-x   yes
                Label-x     yes
                Color-x     #ffffff
                Scale-x     3.000000
                Display+y   yes
                Label+y     yes
                Color+y     #ffffff
                Scale+y     3.000000
                Display-y   yes
                Label-y     yes
                Color-y     #ffffff
                Scale-y     3.000000
                Display+z   yes
                Label+z     yes
                Color+z     #ffffff
                Scale+z     3.000000
                Display-z   yes
                Label-z     yes
                Color-z     #ffffff
                Scale-z     3.000000
            END Axes

        END MapAttributes

        BEGIN MapList
            BEGIN Detail
                Alias RWDB2_Coastlines
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_International_Borders
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Islands
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Lakes
                Show Yes
                Color #87cefa
            END Detail
            BEGIN Detail
                Alias RWDB2_Provincial_Borders
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Rivers
                Show No
                Color #00ff00
            END Detail
        END MapList


        BEGIN MapAnnotations
        END MapAnnotations

        BEGIN SoftVTR
            OutputFormat     BMP
            Directory        C:\DOCUME~1\eameek\LOCALS~1\Temp
            BaseName         Frame
            Digits           4
            Frame            0
            LastAnimTime     0.000000
            OutputMode       Normal
            HiResAssembly    Assemble
            HRWidth          6000
            HRHeight         4500
            HRDPI            600.000000
            UseSnapInterval  No
            SnapInterval     0.000000
            WmvCodec         "Windows Media Video 9"
            Framerate        30
            Bitrate          3000000
        END SoftVTR


        BEGIN TimeDisplay
            Show             0
            TextColor        #00ffff
            TextTranslucency 0.000000
            ShowBackground   0
            BackColor        #000000
            BackTranslucency 0.000000
            XPosition        20
            YPosition        -20
        END TimeDisplay

        BEGIN LightingData
            DisplayAltitude              0.000000
            SubsolarPoint                Off
            SubsolarPointColor           #ffff00
            SubsolarPointMarkerStyle     2

            ShowUmbraLine                Off
            UmbraLineColor               #ffff00
            UmbraLineStyle               0
            UmbraLineWidth               1
            FillUmbra                    Off
            UmbraFillColor               #000000
            ShowSunlightLine             Off
            SunlightLineColor            #ffff00
            SunlightLineStyle            0
            SunlightLineWidth            1
            FillSunlight                 Off
            SunlightFillColor            #ffff00
            SunlightMinOpacity           0.100000
            SunlightMaxOpacity           0.500000
            UmbraMaxOpacity              0.500000
            UmbraMinOpacity              0.200000
        END LightingData

        ShowDtedRegions     Off

        End Style

        BEGIN Style
        Name                Basic_Map_Bckgrnd
        Time                -204638401.000000
        UpdateDelta         60.000000

        BEGIN MapAttributes
            PrimaryBody          Earth
            SecondaryBody        Sun
            CenterLatitude       0.000000
            CenterLongitude      0.000000
            ProjectionAltitude   63621860.000000
            FieldOfView          35.000000
            OrthoDisplayDistance 20000000.000000
            TransformTrajectory  On
            EquatorialRadius     6378137.000000
            BackgroundColor      #000000
            LatLonLines          On
            LatSpacing           30.000000
            LonSpacing           30.000000
            LatLonLineColor      #999999
            LatLonLineStyle      2
            ShowOrthoDistGrid    Off
            OrthoGridXSpacing    5
            OrthoGridYSpacing    5
            OrthoGridColor       #ffffff
            ShowImageExtents     Off
            ImageExtentLineColor #ffffff
            ImageExtentLineStyle 0
            ImageExtentLineWidth 1.000000
            ShowImageNames       Off
            ImageNameFont        0
            Projection           EquidistantCylindrical
            Resolution           VeryLow
            CoordinateSys        ECF
            UseBackgroundImage   On
            UseBingForBackground Off
            BingType             Aerial
            BingLogoHorizAlign   Right
            BingLogoVertAlign    Bottom
            BackgroundImageFile  Basic.bmp
            UseNightLights       Off
            NightLightsFactor    3.500000
            UseCloudsFile        Off
            BEGIN ZoomLocations
                BEGIN ZoomLocation
                    CenterLat    0.000000
                    CenterLon    0.000000
                    ZoomWidth    359.999998
                    ZoomHeight   180.000000
                End ZoomLocation
            END ZoomLocations
            UseVarAspectRatio    No
            SwapMapResolution    Yes
            NoneToVLowSwapDist   2000000.000000
            VLowToLowSwapDist    20000.000000
            LowToMediumSwapDist  10000.000000
            MediumToHighSwapDist 5000.000000
            HighToVHighSwapDist  1000.000000
            VHighToSHighSwapDist 100.000000
            BEGIN Axes
                DisplayAxes no
                CoordSys    CBI
                2aryCB      Sun
                Display+x   yes
                Label+x     yes
                Color+x     #ffffff
                Scale+x     3.000000
                Display-x   yes
                Label-x     yes
                Color-x     #ffffff
                Scale-x     3.000000
                Display+y   yes
                Label+y     yes
                Color+y     #ffffff
                Scale+y     3.000000
                Display-y   yes
                Label-y     yes
                Color-y     #ffffff
                Scale-y     3.000000
                Display+z   yes
                Label+z     yes
                Color+z     #ffffff
                Scale+z     3.000000
                Display-z   yes
                Label-z     yes
                Color-z     #ffffff
                Scale-z     3.000000
            END Axes

        END MapAttributes

        BEGIN MapList
            BEGIN Detail
                Alias RWDB2_Coastlines
                Show Yes
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_International_Borders
                Show Yes
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_Islands
                Show Yes
                Color #8fbc8f
            END Detail
            BEGIN Detail
                Alias RWDB2_Lakes
                Show No
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Provincial_Borders
                Show No
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Rivers
                Show No
                Color #00ff00
            END Detail
        END MapList


        BEGIN MapAnnotations
        END MapAnnotations

        BEGIN SoftVTR
            OutputFormat     BMP
            Directory        C:\DOCUME~1\eameek\LOCALS~1\Temp
            BaseName         Frame
            Digits           4
            Frame            0
            LastAnimTime     0.000000
            OutputMode       Normal
            HiResAssembly    Assemble
            HRWidth          6000
            HRHeight         4500
            HRDPI            600.000000
            UseSnapInterval  No
            SnapInterval     0.000000
            WmvCodec         "Windows Media Video 9"
            Framerate        30
            Bitrate          3000000
        END SoftVTR


        BEGIN TimeDisplay
            Show             0
            TextColor        #00ffff
            TextTranslucency 0.000000
            ShowBackground   0
            BackColor        #000000
            BackTranslucency 0.000000
            XPosition        20
            YPosition        -20
        END TimeDisplay

        BEGIN LightingData
            DisplayAltitude              0.000000
            SubsolarPoint                Off
            SubsolarPointColor           #ffff00
            SubsolarPointMarkerStyle     2

            ShowUmbraLine                Off
            UmbraLineColor               #ffff00
            UmbraLineStyle               0
            UmbraLineWidth               1
            FillUmbra                    Off
            UmbraFillColor               #000000
            ShowSunlightLine             Off
            SunlightLineColor            #ffff00
            SunlightLineStyle            0
            SunlightLineWidth            1
            FillSunlight                 Off
            SunlightFillColor            #ffff00
            SunlightMinOpacity           0.100000
            SunlightMaxOpacity           0.500000
            UmbraMaxOpacity              0.500000
            UmbraMinOpacity              0.200000
        END LightingData

        ShowDtedRegions     Off

        End Style

        BEGIN Style
        Name                Orthographic_Projection
        Time                -204638401.000000
        UpdateDelta         60.000000

        BEGIN MapAttributes
            PrimaryBody          Earth
            SecondaryBody        Sun
            CenterLatitude       0.000000
            CenterLongitude      0.000000
            ProjectionAltitude   63621860.000000
            FieldOfView          35.000000
            OrthoDisplayDistance 20000000.000000
            TransformTrajectory  On
            EquatorialRadius     6378137.000000
            BackgroundColor      #000000
            LatLonLines          On
            LatSpacing           30.000000
            LonSpacing           30.000000
            LatLonLineColor      #999999
            LatLonLineStyle      2
            ShowOrthoDistGrid    Off
            OrthoGridXSpacing    5
            OrthoGridYSpacing    5
            OrthoGridColor       #ffffff
            ShowImageExtents     Off
            ImageExtentLineColor #ffffff
            ImageExtentLineStyle 0
            ImageExtentLineWidth 1.000000
            ShowImageNames       Off
            ImageNameFont        0
            Projection           Orthographic
            Resolution           VeryLow
            CoordinateSys        ECF
            UseBackgroundImage   Off
            UseBingForBackground Off
            BingType             Aerial
            BingLogoHorizAlign   Right
            BingLogoVertAlign    Bottom
            UseNightLights       Off
            NightLightsFactor    3.500000
            UseCloudsFile        Off
            BEGIN ZoomLocations
                BEGIN ZoomLocation
                    CenterLat    0.000000
                    CenterLon    0.000000
                    ZoomWidth    359.999990
                    ZoomHeight   180.000000
                End ZoomLocation
            END ZoomLocations
            UseVarAspectRatio    No
            SwapMapResolution    Yes
            NoneToVLowSwapDist   2000000.000000
            VLowToLowSwapDist    20000.000000
            LowToMediumSwapDist  10000.000000
            MediumToHighSwapDist 5000.000000
            HighToVHighSwapDist  1000.000000
            VHighToSHighSwapDist 100.000000
            BEGIN Axes
                DisplayAxes no
                CoordSys    CBI
                2aryCB      Sun
                Display+x   yes
                Label+x     yes
                Color+x     #ffffff
                Scale+x     3.000000
                Display-x   yes
                Label-x     yes
                Color-x     #ffffff
                Scale-x     3.000000
                Display+y   yes
                Label+y     yes
                Color+y     #ffffff
                Scale+y     3.000000
                Display-y   yes
                Label-y     yes
                Color-y     #ffffff
                Scale-y     3.000000
                Display+z   yes
                Label+z     yes
                Color+z     #ffffff
                Scale+z     3.000000
                Display-z   yes
                Label-z     yes
                Color-z     #ffffff
                Scale-z     3.000000
            END Axes

        END MapAttributes

        BEGIN MapList
            BEGIN Detail
                Alias RWDB2_Coastlines
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_International_Borders
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Islands
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Lakes
                Show Yes
                Color #87cefa
            END Detail
            BEGIN Detail
                Alias RWDB2_Provincial_Borders
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Rivers
                Show No
                Color #00ff00
            END Detail
        END MapList


        BEGIN MapAnnotations
        END MapAnnotations

        BEGIN SoftVTR
            OutputFormat     BMP
            Directory        C:\DOCUME~1\eameek\LOCALS~1\Temp
            BaseName         Frame
            Digits           4
            Frame            0
            LastAnimTime     0.000000
            OutputMode       Normal
            HiResAssembly    Assemble
            HRWidth          6000
            HRHeight         4500
            HRDPI            600.000000
            UseSnapInterval  No
            SnapInterval     0.000000
            WmvCodec         "Windows Media Video 9"
            Framerate        30
            Bitrate          3000000
        END SoftVTR


        BEGIN TimeDisplay
            Show             0
            TextColor        #00ffff
            TextTranslucency 0.000000
            ShowBackground   0
            BackColor        #000000
            BackTranslucency 0.000000
            XPosition        20
            YPosition        -20
        END TimeDisplay

        BEGIN LightingData
            DisplayAltitude              0.000000
            SubsolarPoint                Off
            SubsolarPointColor           #ffff00
            SubsolarPointMarkerStyle     2

            ShowUmbraLine                Off
            UmbraLineColor               #ffff00
            UmbraLineStyle               0
            UmbraLineWidth               1
            FillUmbra                    Off
            UmbraFillColor               #000000
            ShowSunlightLine             Off
            SunlightLineColor            #ffff00
            SunlightLineStyle            0
            SunlightLineWidth            1
            FillSunlight                 Off
            SunlightFillColor            #ffff00
            SunlightMinOpacity           0.100000
            SunlightMaxOpacity           0.500000
            UmbraMaxOpacity              0.500000
            UmbraMinOpacity              0.200000
        END LightingData

        ShowDtedRegions     Off

        End Style

        BEGIN Style
        Name                Zoom_North_America
        Time                -204638401.000000
        UpdateDelta         60.000000

        BEGIN MapAttributes
            PrimaryBody          Earth
            SecondaryBody        Sun
            CenterLatitude       0.000000
            CenterLongitude      0.000000
            ProjectionAltitude   63621860.000000
            FieldOfView          35.000000
            OrthoDisplayDistance 20000000.000000
            TransformTrajectory  On
            EquatorialRadius     6378137.000000
            BackgroundColor      #000000
            LatLonLines          On
            LatSpacing           30.000000
            LonSpacing           30.000000
            LatLonLineColor      #999999
            LatLonLineStyle      2
            ShowOrthoDistGrid    Off
            OrthoGridXSpacing    5
            OrthoGridYSpacing    5
            OrthoGridColor       #ffffff
            ShowImageExtents     Off
            ImageExtentLineColor #ffffff
            ImageExtentLineStyle 0
            ImageExtentLineWidth 1.000000
            ShowImageNames       Off
            ImageNameFont        0
            Projection           EquidistantCylindrical
            Resolution           Low
            CoordinateSys        ECF
            UseBackgroundImage   On
            UseBingForBackground Off
            BingType             Aerial
            BingLogoHorizAlign   Right
            BingLogoVertAlign    Bottom
            BackgroundImageFile  Basic.bmp
            UseNightLights       Off
            NightLightsFactor    3.500000
            UseCloudsFile        Off
            BEGIN ZoomLocations
                BEGIN ZoomLocation
                    CenterLat    0.000000
                    CenterLon    0.000000
                    ZoomWidth    359.999998
                    ZoomHeight   180.000000
                End ZoomLocation
                BEGIN ZoomLocation
                    CenterLat    48.235294
                    CenterLon    -106.229508
                    ZoomWidth    129.836065
                    ZoomHeight   64.918032
                End ZoomLocation
            END ZoomLocations
            UseVarAspectRatio    No
            SwapMapResolution    Yes
            NoneToVLowSwapDist   2000000.000000
            VLowToLowSwapDist    20000.000000
            LowToMediumSwapDist  10000.000000
            MediumToHighSwapDist 5000.000000
            HighToVHighSwapDist  1000.000000
            VHighToSHighSwapDist 100.000000
            BEGIN Axes
                DisplayAxes no
                CoordSys    CBI
                2aryCB      Sun
                Display+x   yes
                Label+x     yes
                Color+x     #ffffff
                Scale+x     3.000000
                Display-x   yes
                Label-x     yes
                Color-x     #ffffff
                Scale-x     3.000000
                Display+y   yes
                Label+y     yes
                Color+y     #ffffff
                Scale+y     3.000000
                Display-y   yes
                Label-y     yes
                Color-y     #ffffff
                Scale-y     3.000000
                Display+z   yes
                Label+z     yes
                Color+z     #ffffff
                Scale+z     3.000000
                Display-z   yes
                Label-z     yes
                Color-z     #ffffff
                Scale-z     3.000000
            END Axes

        END MapAttributes

        BEGIN MapList
            BEGIN Detail
                Alias RWDB2_Coastlines
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_International_Borders
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Islands
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Lakes
                Show Yes
                Color #87cefa
            END Detail
            BEGIN Detail
                Alias RWDB2_Provincial_Borders
                Show Yes
                Color #00ff00
            END Detail
            BEGIN Detail
                Alias RWDB2_Rivers
                Show No
                Color #00ff00
            END Detail
        END MapList


        BEGIN MapAnnotations
        END MapAnnotations

        BEGIN SoftVTR
            OutputFormat     BMP
            Directory        C:\DOCUME~1\eameek\LOCALS~1\Temp
            BaseName         Frame
            Digits           4
            Frame            0
            LastAnimTime     0.000000
            OutputMode       Normal
            HiResAssembly    Assemble
            HRWidth          6000
            HRHeight         4500
            HRDPI            600.000000
            UseSnapInterval  No
            SnapInterval     0.000000
            WmvCodec         "Windows Media Video 9"
            Framerate        30
            Bitrate          3000000
        END SoftVTR


        BEGIN TimeDisplay
            Show             0
            TextColor        #00ffff
            TextTranslucency 0.000000
            ShowBackground   0
            BackColor        #000000
            BackTranslucency 0.000000
            XPosition        20
            YPosition        -20
        END TimeDisplay

        BEGIN LightingData
            DisplayAltitude              0.000000
            SubsolarPoint                Off
            SubsolarPointColor           #ffff00
            SubsolarPointMarkerStyle     2

            ShowUmbraLine                Off
            UmbraLineColor               #ffff00
            UmbraLineStyle               0
            UmbraLineWidth               1
            FillUmbra                    Off
            UmbraFillColor               #000000
            ShowSunlightLine             Off
            SunlightLineColor            #ffff00
            SunlightLineStyle            0
            SunlightLineWidth            1
            FillSunlight                 Off
            SunlightFillColor            #ffff00
            SunlightMinOpacity           0.100000
            SunlightMaxOpacity           0.500000
            UmbraMaxOpacity              0.500000
            UmbraMinOpacity              0.200000
        END LightingData

        ShowDtedRegions     Off

        End Style

    END MapStyles

END MapData

        BEGIN GfxClassPref

        END GfxClassPref


        BEGIN ConnectGraphicsOptions

            AsyncPickReturnUnique          OFF

        END ConnectGraphicsOptions

    END Graphics
    
    BEGIN Overlays
    END Overlays
    
    BEGIN Broker
    END Broker
    
    BEGIN ClsApp
		RangeConstraint         5000.000
		ApoPeriPad              30000.000
		OrbitPathPad            30000.000
		TimeDistPad             30000.000
		OutOfDate               2592000.000
		MaxApoPeriStep          900.000
		ApoPeriAngle            0.785
		UseApogeePerigeeFilter  Yes
		UsePathFilter           No
		UseTimeFilter           No
		UseOutOfDate            Yes
		CreateSats              No
		MaxSatsToCreate         500
		UseModelScale           No
		ModelScale              4.000
		UseCrossRefDb           Yes
		CollisionDB                     stkAllTLE.tce
		CollisionCrossRefDB             stkAllTLE.sd
		ShowLine                Yes
		AnimHighlight           Yes
		StaticHighlight         Yes
		UseLaunchWindow                         No
		LaunchWindowUseEntireTraj               Yes
		LaunchWindowTrajMETStart                0.000
		LaunchWindowTrajMETStop                 900.000
		LaunchWindowStart                       0.000
		LaunchWindowStop                        0.000
		LaunchMETOffset                         0.000
		LaunchWindowUseSecEphem                 No 
		LaunchWindowUseScenFolderForSecEphem    Yes
		LaunchWindowUsePrimEphem                No 
		LaunchWindowUseScenFolderForPrimEphem   Yes
    LaunchWindowIntervalPtr
	BEGIN	EVENTINTERVAL
			BEGIN Interval
				Start	25 Dec 2012 00:00:00.000000000
				Stop	28 Dec 2012 00:00:00.000000000
			END Interval
			IntervalState	Explicit
	END	EVENTINTERVAL

		LaunchWindowUsePrimMTO                  No 
		GroupLaunches                           No 
		LWTimeConvergence                       1.000e-003
		LWRelValueConvergence                   1.000e-008
		LWTSRTimeConvergence                    1.000e-004
		LWTSRRelValueConvergence                1.000e-010
		LaunchWindowStep                        300.000
		MaxTSRStep                              180.000
		MaxTSRRelMotion                         20.000
		UseLaunchArea                           No 
		LaunchAreaOrientation                   North
		LaunchAreaAzimuth                       0.000
		LaunchAreaXLimits                       -10000.000   10000.000
		LaunchAreaYLimits                       -10000.000   10000.000
		LaunchAreaNumXIntrPnts                  1
		LaunchAreaNumYIntrPnts                  1
		LaunchAreaAltReference                  Ellipsoid
		TargetSameStop                          No 
		SkipSurfaceMetric                       No 
		LWAreaTSRRelValueConvergence            1.000e-010
		AreaLaunchWindowStep                    300.000
		AreaMaxTSRStep                          30.000
		AreaMaxTSRRelMotion                     1.000
		ShowLaunchArea                          No 
		ShowBlackoutTracks                      No 
		BlackoutColor                           #ff0000
		ShowClearedTracks                       No 
		UseObjectForClearedColor                No 
		ClearedColor                             #ffffff
		ShowTracksSegments                      No 
		ShowMinRangeTracks                      No 
		MinRangeTrackTimeStep                   0.500000
		UsePrimStepForTracks                    Yes
		GfxTracksTimeStep                       30.000
		GfxAreaNumXIntrPnts                     1
		GfxAreaNumYIntrPnts                     1
		CreateLaunchMTO                         No 
		CovarianceSigmaScale                    3.000
		CovarianceMode                          None 
    END ClsApp
    
    BEGIN Units
		DistanceUnit		Kilometers
		TimeUnit		Seconds
		DateFormat		GregorianUTC
		AngleUnit		Degrees
		MassUnit		Kilograms
		PowerUnit		dBW
		FrequencyUnit		Gigahertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Degrees
		LongitudeUnit		Degrees
		DurationUnit		Hr:Min:Sec
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Decibel
		RcsUnit		Decibel
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Kilohertz
		BandwidthUnit		Megahertz
		SmallVelocityUnit		CentimetersperSecond
		Percent		Percentage
		AviatorDistanceUnit		NauticalMiles
		AviatorTimeUnit		Hours
		AviatorAltitudeUnit		Feet
		AviatorFuelQuantityUnit		Pounds
		AviatorRunwayLengthUnit		Kilofeet
		AviatorBearingAngleUnit		Degrees
		AviatorAngleOfAttackUnit		Degrees
		AviatorAttitudeAngleUnit		Degrees
		AviatorGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		AviatorTSFCUnit		TSFCLbmHrLbf
		AviatorPSFCUnit		PSFCLbmHrHp
		AviatorForceUnit		Pounds
		AviatorPowerUnit		Horsepower
		SpectralBandwidthUnit		Hertz
		AviatorAltTimeUnit		Minutes
		AviatorSmallTimeUnit		Seconds
		BitsUnit		MegaBits
		MagneticFieldUnit		nanoTesla
    END Units
    
    BEGIN ReportUnits
		DistanceUnit		Kilometers
		TimeUnit		Seconds
		DateFormat		GregorianUTC
		AngleUnit		Degrees
		MassUnit		Kilograms
		PowerUnit		dBW
		FrequencyUnit		Gigahertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Degrees
		LongitudeUnit		Degrees
		DurationUnit		Hr:Min:Sec
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Decibel
		RcsUnit		Decibel
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Kilohertz
		BandwidthUnit		Megahertz
		SmallVelocityUnit		CentimetersperSecond
		Percent		Percentage
		AviatorDistanceUnit		NauticalMiles
		AviatorTimeUnit		Hours
		AviatorAltitudeUnit		Feet
		AviatorFuelQuantityUnit		Pounds
		AviatorRunwayLengthUnit		Kilofeet
		AviatorBearingAngleUnit		Degrees
		AviatorAngleOfAttackUnit		Degrees
		AviatorAttitudeAngleUnit		Degrees
		AviatorGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		AviatorTSFCUnit		TSFCLbmHrLbf
		AviatorPSFCUnit		PSFCLbmHrHp
		AviatorForceUnit		Pounds
		AviatorPowerUnit		Horsepower
		SpectralBandwidthUnit		Hertz
		AviatorAltTimeUnit		Minutes
		AviatorSmallTimeUnit		Seconds
		BitsUnit		MegaBits
		MagneticFieldUnit		nanoTesla
    END ReportUnits
    
    BEGIN ConnectReportUnits
		DistanceUnit		Kilometers
		TimeUnit		Seconds
		DateFormat		GregorianUTC
		AngleUnit		Degrees
		MassUnit		Kilograms
		PowerUnit		dBW
		FrequencyUnit		Gigahertz
		SmallDistanceUnit		Meters
		LatitudeUnit		Degrees
		LongitudeUnit		Degrees
		DurationUnit		Hr:Min:Sec
		Temperature		Kelvin
		SmallTimeUnit		Seconds
		RatioUnit		Decibel
		RcsUnit		Decibel
		DopplerVelocityUnit		MetersperSecond
		SARTimeResProdUnit		Meter-Second
		ForceUnit		Newtons
		PressureUnit		Pascals
		SpecificImpulseUnit		Seconds
		PRFUnit		Kilohertz
		BandwidthUnit		Megahertz
		SmallVelocityUnit		CentimetersperSecond
		Percent		Percentage
		AviatorDistanceUnit		NauticalMiles
		AviatorTimeUnit		Hours
		AviatorAltitudeUnit		Feet
		AviatorFuelQuantityUnit		Pounds
		AviatorRunwayLengthUnit		Kilofeet
		AviatorBearingAngleUnit		Degrees
		AviatorAngleOfAttackUnit		Degrees
		AviatorAttitudeAngleUnit		Degrees
		AviatorGUnit		StandardSeaLevelG
		SolidAngle		Steradians
		AviatorTSFCUnit		TSFCLbmHrLbf
		AviatorPSFCUnit		PSFCLbmHrHp
		AviatorForceUnit		Pounds
		AviatorPowerUnit		Horsepower
		SpectralBandwidthUnit		Hertz
		AviatorAltTimeUnit		Minutes
		AviatorSmallTimeUnit		Seconds
		BitsUnit		MegaBits
		MagneticFieldUnit		nanoTesla
    END ConnectReportUnits
    
    BEGIN ReportFavorites
    END ReportFavorites
    
    BEGIN ADFFileData
    END ADFFileData
    
    BEGIN GenDb

		BEGIN Database
		    DbType       Satellite
		    DefDb        stkSatDb.sd
		    UseMyDb      Off
		    MaxMatches   2000

		BEGIN FieldDefaults

		END FieldDefaults

		END Database

		BEGIN Database
		    DbType       City
		    DefDb        stkCityDb.cd
		    UseMyDb      Off
		    MaxMatches   2000

		BEGIN FieldDefaults

		END FieldDefaults

		END Database

		BEGIN Database
		    DbType       Facility
		    DefDb        stkFacility.fd
		    UseMyDb      Off
		    MaxMatches   2000

		BEGIN FieldDefaults

		END FieldDefaults

		END Database
    END GenDb
    
    BEGIN SOCDb
        BEGIN Defaults
        END Defaults
    END SOCDb
    
    BEGIN Msgp4Ext
    END Msgp4Ext
    
    BEGIN FileLocations
    END FileLocations
    
    BEGIN Author
	Optimize	Yes
	UseBasicGlobe	Yes
	ReadOnly	No
	ViewerPassword	No
	STKPassword	No
	ExcludeInstallFiles	No
	BEGIN ExternalFileList
	END ExternalFileList
    END Author
    
    BEGIN ExportDataFile
    FileType         Ephemeris
    Directory        d:\data\eameek\My Documents\STK 8
    IntervalType     Ephemeris
    TimePeriodStart  0.000000e+000
    TimePeriodStop   0.000000e+000
    StepType         Ephemeris
    StepSize         60.000000
    EphemType        STK
    UseVehicleCentralBody   Yes
    CentralBody      Earth
    SatelliteID      -200000
    CoordSys         J2000
    NonSatCoordSys   Fixed
    InterpolateBoundaries  Yes
    EphemFormat      Current
    InterpType       9
    InterpOrder      5
    AttCoordSys      Fixed
    Quaternions      0
    ExportCovar      Position
    AttitudeFormat   Current
    TimePrecision      6
    CCSDSDateFormat    YMD
    CCSDSEphFormat     SciNotation
    CCSDSTimeSystem    UTC
    CCSDSRefFrame      ICRF
    UseSatCenterAndFrame   No
    IncludeCovariance      No
    IncludeAcceleration    No
    END ExportDataFile
    
    BEGIN Desc
    END Desc
    
    BEGIN KeyValueMetadata
    END KeyValueMetadata
    
    BEGIN RfEnv
<?xml version = "1.0" standalone = "yes"?>
<VAR name = "STK_RF_Environment">
    <SCOPE Class = "RFEnvironment">
        <VAR name = "Version">
            <STRING>&quot;1.0.0 a&quot;</STRING>
        </VAR>
        <VAR name = "ComponentName">
            <STRING>&quot;STK_RF_Environment&quot;</STRING>
        </VAR>
        <VAR name = "Description">
            <STRING>&quot;STK RF Environment&quot;</STRING>
        </VAR>
        <VAR name = "Type">
            <STRING>&quot;STK RF Environment&quot;</STRING>
        </VAR>
        <VAR name = "UserComment">
            <STRING>&quot;STK RF Environment&quot;</STRING>
        </VAR>
        <VAR name = "ReadOnly">
            <BOOL>false</BOOL>
        </VAR>
        <VAR name = "Clonable">
            <BOOL>true</BOOL>
        </VAR>
        <VAR name = "Category">
            <STRING>&quot;&quot;</STRING>
        </VAR>
        <VAR name = "PropagationChannel">
            <VAR name = "RF_Propagation_Channel">
                <SCOPE Class = "PropagationChannel">
                    <VAR name = "Version">
                        <STRING>&quot;1.0.0 a&quot;</STRING>
                    </VAR>
                    <VAR name = "ComponentName">
                        <STRING>&quot;RF_Propagation_Channel&quot;</STRING>
                    </VAR>
                    <VAR name = "Description">
                        <STRING>&quot;RF Propagation Channel&quot;</STRING>
                    </VAR>
                    <VAR name = "Type">
                        <STRING>&quot;RF Propagation Channel&quot;</STRING>
                    </VAR>
                    <VAR name = "UserComment">
                        <STRING>&quot;RF Propagation Channel&quot;</STRING>
                    </VAR>
                    <VAR name = "ReadOnly">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "Clonable">
                        <BOOL>true</BOOL>
                    </VAR>
                    <VAR name = "Category">
                        <STRING>&quot;@Top&quot;</STRING>
                    </VAR>
                    <VAR name = "UseITU618Section2p5">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "UseCloudFogModel">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "CloudFogModel">
                        <VAR name = "ITU_840-3">
                            <SCOPE Class = "CloudFogLossModel">
                                <VAR name = "Version">
                                    <STRING>&quot;1.0.0 a&quot;</STRING>
                                </VAR>
                                <VAR name = "ComponentName">
                                    <STRING>&quot;ITU_840-3&quot;</STRING>
                                </VAR>
                                <VAR name = "Description">
                                    <STRING>&quot;ITU 840-3&quot;</STRING>
                                </VAR>
                                <VAR name = "Type">
                                    <STRING>&quot;ITU 840-3&quot;</STRING>
                                </VAR>
                                <VAR name = "UserComment">
                                    <STRING>&quot;ITU 840-3&quot;</STRING>
                                </VAR>
                                <VAR name = "ReadOnly">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "Clonable">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "Category">
                                    <STRING>&quot;@Top&quot;</STRING>
                                </VAR>
                                <VAR name = "CloudCeiling">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                        <REAL>3000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "CloudLayerThickness">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                        <REAL>500</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "CloudTemp">
                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                        <REAL>273.15</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "CloudLiqWaterDensity">
                                    <QUANTITY Dimension = "Density" Unit = "g*m^-3">
                                        <REAL>7.5</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </VAR>
                    <VAR name = "UseTropoScintModel">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "TropoScintModel">
                        <VAR name = "ITU_618-8_Scintillation">
                            <SCOPE Class = "TropoScintLossModel">
                                <VAR name = "Version">
                                    <STRING>&quot;1.0.0 a&quot;</STRING>
                                </VAR>
                                <VAR name = "ComponentName">
                                    <STRING>&quot;ITU_618-8_Scintillation&quot;</STRING>
                                </VAR>
                                <VAR name = "Description">
                                    <STRING>&quot;ITU 618-8 Scintillation&quot;</STRING>
                                </VAR>
                                <VAR name = "Type">
                                    <STRING>&quot;ITU 618-8 Scintillation&quot;</STRING>
                                </VAR>
                                <VAR name = "UserComment">
                                    <STRING>&quot;ITU 618-8 Scintillation&quot;</STRING>
                                </VAR>
                                <VAR name = "ReadOnly">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "Clonable">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "Category">
                                    <STRING>&quot;@Top&quot;</STRING>
                                </VAR>
                                <VAR name = "ComputeDeepFade">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "FadeOutage">
                                    <QUANTITY Dimension = "Percent" Unit = "unitValue">
                                        <REAL>0.001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "PercentTimeRefracGrad">
                                    <QUANTITY Dimension = "Percent" Unit = "unitValue">
                                        <REAL>0.1</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SurfaceTemperature">
                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                        <REAL>273.15</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </VAR>
                    <VAR name = "UseRainModel">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "RainModel">
                        <VAR name = "ITU-R_P618-9">
                            <SCOPE Class = "RainLossModel">
                                <VAR name = "Version">
                                    <STRING>&quot;1.0.0 a&quot;</STRING>
                                </VAR>
                                <VAR name = "ComponentName">
                                    <STRING>&quot;ITU-R_P618-9&quot;</STRING>
                                </VAR>
                                <VAR name = "Description">
                                    <STRING>&quot;ITU-R P618-9 rain model&quot;</STRING>
                                </VAR>
                                <VAR name = "Type">
                                    <STRING>&quot;ITU-R P618-9&quot;</STRING>
                                </VAR>
                                <VAR name = "UserComment">
                                    <STRING>&quot;ITU-R P618-9 rain model&quot;</STRING>
                                </VAR>
                                <VAR name = "ReadOnly">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "Clonable">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "Category">
                                    <STRING>&quot;Previous Versions&quot;</STRING>
                                </VAR>
                                <VAR name = "SurfaceTemperature">
                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                        <REAL>273.15</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </VAR>
                    <VAR name = "UseAtmosAbsorptionModel">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "AtmosAbsorptionModel">
                        <VAR name = "Simple_Satcom">
                            <SCOPE Class = "AtmosphericAbsorptionModel">
                                <VAR name = "Version">
                                    <STRING>&quot;1.0.1 a&quot;</STRING>
                                </VAR>
                                <VAR name = "ComponentName">
                                    <STRING>&quot;Simple_Satcom&quot;</STRING>
                                </VAR>
                                <VAR name = "Description">
                                    <STRING>&quot;Simple Satcom gaseous absorption model&quot;</STRING>
                                </VAR>
                                <VAR name = "Type">
                                    <STRING>&quot;Simple Satcom&quot;</STRING>
                                </VAR>
                                <VAR name = "UserComment">
                                    <STRING>&quot;Simple Satcom gaseous absorption model&quot;</STRING>
                                </VAR>
                                <VAR name = "ReadOnly">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "Clonable">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "Category">
                                    <STRING>&quot;@Top&quot;</STRING>
                                </VAR>
                                <VAR name = "SurfaceTemperature">
                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                        <REAL>293.15</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "WaterVaporConcentration">
                                    <QUANTITY Dimension = "Density" Unit = "g*m^-3">
                                        <REAL>7.5</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </VAR>
                    <VAR name = "UseUrbanTerresPropLossModel">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "UrbanTerresPropLossModel">
                        <VAR name = "Two_Ray">
                            <SCOPE Class = "UrbanTerrestrialPropagationLossModel">
                                <VAR name = "Version">
                                    <STRING>&quot;1.0.0 a&quot;</STRING>
                                </VAR>
                                <VAR name = "ComponentName">
                                    <STRING>&quot;Two_Ray&quot;</STRING>
                                </VAR>
                                <VAR name = "Description">
                                    <STRING>&quot;Two Ray (Fourth Power Law) atmospheric absorption model&quot;</STRING>
                                </VAR>
                                <VAR name = "Type">
                                    <STRING>&quot;Two Ray&quot;</STRING>
                                </VAR>
                                <VAR name = "UserComment">
                                    <STRING>&quot;Two Ray (Fourth Power Law) atmospheric absorption model&quot;</STRING>
                                </VAR>
                                <VAR name = "ReadOnly">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "Clonable">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "Category">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "SurfaceTemperature">
                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                        <REAL>273.15</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "LossFactor">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </VAR>
                    <VAR name = "UseCustomA">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "UseCustomB">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "UseCustomC">
                        <BOOL>false</BOOL>
                    </VAR>
                </SCOPE>
            </VAR>
        </VAR>
        <VAR name = "EarthTemperature">
            <QUANTITY Dimension = "Temperature" Unit = "K">
                <REAL>290</REAL>
            </QUANTITY>
        </VAR>
        <VAR name = "RainOutagePercent">
            <PROP name = "FormatString">
                <STRING>&quot;%#6.3f&quot;</STRING>
            </PROP>
            <REAL>0.1</REAL>
        </VAR>
        <VAR name = "ActiveCommSystem">
            <LINKTOOBJ>
                <STRING>&quot;None&quot;</STRING>
            </LINKTOOBJ>
        </VAR>
    </SCOPE>
</VAR>    END RfEnv
    
    BEGIN CommRad
    END CommRad
    
    BEGIN RadarCrossSection
<?xml version = "1.0" standalone = "yes"?>
<VAR name = "STK_Radar_RCS_Extension">
    <SCOPE Class = "RadarRCSExtension">
        <VAR name = "Version">
            <STRING>&quot;1.0.0 a&quot;</STRING>
        </VAR>
        <VAR name = "ComponentName">
            <STRING>&quot;STK_Radar_RCS_Extension&quot;</STRING>
        </VAR>
        <VAR name = "Description">
            <STRING>&quot;STK Radar RCS Extension&quot;</STRING>
        </VAR>
        <VAR name = "Type">
            <STRING>&quot;STK Radar RCS Extension&quot;</STRING>
        </VAR>
        <VAR name = "UserComment">
            <STRING>&quot;STK Radar RCS Extension&quot;</STRING>
        </VAR>
        <VAR name = "ReadOnly">
            <BOOL>false</BOOL>
        </VAR>
        <VAR name = "Clonable">
            <BOOL>true</BOOL>
        </VAR>
        <VAR name = "Category">
            <STRING>&quot;&quot;</STRING>
        </VAR>
        <VAR name = "Model">
            <VAR name = "Radar_Cross_Section">
                <SCOPE Class = "RCS">
                    <VAR name = "Version">
                        <STRING>&quot;1.0.0 a&quot;</STRING>
                    </VAR>
                    <VAR name = "ComponentName">
                        <STRING>&quot;Radar_Cross_Section&quot;</STRING>
                    </VAR>
                    <VAR name = "Description">
                        <STRING>&quot;Radar Cross Section&quot;</STRING>
                    </VAR>
                    <VAR name = "Type">
                        <STRING>&quot;Radar Cross Section&quot;</STRING>
                    </VAR>
                    <VAR name = "UserComment">
                        <STRING>&quot;Radar Cross Section&quot;</STRING>
                    </VAR>
                    <VAR name = "ReadOnly">
                        <BOOL>false</BOOL>
                    </VAR>
                    <VAR name = "Clonable">
                        <BOOL>true</BOOL>
                    </VAR>
                    <VAR name = "Category">
                        <STRING>&quot;&quot;</STRING>
                    </VAR>
                    <VAR name = "FrequencyBandList">
                        <LIST>
                            <SCOPE>
                                <VAR name = "MinFrequency">
                                    <QUANTITY Dimension = "BandwidthUnit" Unit = "Hz">
                                        <REAL>2997920</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "ComputeTypeStrategy">
                                    <VAR name = "Constant Value">
                                        <SCOPE Class = "RCS Compute Strategy">
                                            <VAR name = "ConstantValue">
                                                <QUANTITY Dimension = "RcsUnit" Unit = "sqm">
                                                    <REAL>1</REAL>
                                                </QUANTITY>
                                            </VAR>
                                            <VAR name = "Type">
                                                <STRING>&quot;Constant Value&quot;</STRING>
                                            </VAR>
                                            <VAR name = "ComponentName">
                                                <STRING>&quot;Constant Value&quot;</STRING>
                                            </VAR>
                                        </SCOPE>
                                    </VAR>
                                </VAR>
                                <VAR name = "SwerlingCase">
                                    <STRING>&quot;0&quot;</STRING>
                                </VAR>
                            </SCOPE>
                            <SCOPE>
                                <VAR name = "MinFrequency">
                                    <QUANTITY Dimension = "BandwidthUnit" Unit = "Hz">
                                        <REAL>3000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "ComputeTypeStrategy">
                                    <VAR name = "Constant Value">
                                        <SCOPE Class = "RCS Compute Strategy">
                                            <VAR name = "ConstantValue">
                                                <QUANTITY Dimension = "RcsUnit" Unit = "sqm">
                                                    <REAL>1</REAL>
                                                </QUANTITY>
                                            </VAR>
                                            <VAR name = "Type">
                                                <STRING>&quot;Constant Value&quot;</STRING>
                                            </VAR>
                                            <VAR name = "ComponentName">
                                                <STRING>&quot;Constant Value&quot;</STRING>
                                            </VAR>
                                        </SCOPE>
                                    </VAR>
                                </VAR>
                                <VAR name = "SwerlingCase">
                                    <STRING>&quot;0&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </LIST>
                    </VAR>
                </SCOPE>
            </VAR>
        </VAR>
    </SCOPE>
</VAR>    END RadarCrossSection
    
    BEGIN RadarClutter
<?xml version = "1.0" standalone = "yes"?>
<VAR name = "STK_Radar_Clutter_Extension">
    <SCOPE Class = "RadarClutterExtension">
        <VAR name = "Version">
            <STRING>&quot;1.0.0 a&quot;</STRING>
        </VAR>
        <VAR name = "ComponentName">
            <STRING>&quot;STK_Radar_Clutter_Extension&quot;</STRING>
        </VAR>
        <VAR name = "Description">
            <STRING>&quot;STK Radar Clutter Extension&quot;</STRING>
        </VAR>
        <VAR name = "Type">
            <STRING>&quot;STK Radar Clutter Extension&quot;</STRING>
        </VAR>
        <VAR name = "UserComment">
            <STRING>&quot;STK Radar Clutter Extension&quot;</STRING>
        </VAR>
        <VAR name = "ReadOnly">
            <BOOL>false</BOOL>
        </VAR>
        <VAR name = "Clonable">
            <BOOL>true</BOOL>
        </VAR>
        <VAR name = "Category">
            <STRING>&quot;&quot;</STRING>
        </VAR>
        <VAR name = "ClutterMap">
            <VAR name = "Constant Coefficient">
                <SCOPE Class = "Clutter Map">
                    <VAR name = "ClutterCoefficient">
                        <QUANTITY Dimension = "RatioUnit" Unit = "units">
                            <REAL>1</REAL>
                        </QUANTITY>
                    </VAR>
                    <VAR name = "Type">
                        <STRING>&quot;Constant Coefficient&quot;</STRING>
                    </VAR>
                    <VAR name = "ComponentName">
                        <STRING>&quot;Constant Coefficient&quot;</STRING>
                    </VAR>
                </SCOPE>
            </VAR>
        </VAR>
    </SCOPE>
</VAR>    END RadarClutter
    
    BEGIN Gator
    END Gator
    
    BEGIN Crdn
		BEGIN	ANGLE
			Type	ANGLE_BETWEEN
			Name	True_Long_Angle
			Description	<Enter description (up to 300 chars)>
			AbsolutePath	CentralBody/Earth
				Origin
					BEGIN	VECTOR
						Type	VECTOR_LINKTO
						Name	FixedAtJ2000_X
						AbsolutePath	CentralBody/Earth
					END	VECTOR
				Destination
					BEGIN	VECTOR
						Type	VECTOR_LINKTO
						Name	True_Long_Projection
						AbsolutePath	CentralBody/Earth
					END	VECTOR
		END	ANGLE
		BEGIN	VECTOR
			Type	VECTOR_FIXED
			Name	FixedAtJ2000_X
			Description	Vector fixed in the reference axes using the selected coordinate type
			AbsolutePath	CentralBody/Earth
				Dimension	6
				FixedVector
					1.00000000000000e+000
					0.00000000000000e+000
					0.00000000000000e+000
					UiSequence      321
					UiCoordType      4
				ReferenceAxes
					BEGIN	AXES
						Type	AXES_LINKTO
						Name	FixedAtJ2000
						AbsolutePath	CentralBody/Earth
					END	AXES
		END	VECTOR
		BEGIN	VECTOR
			Type	VECTOR_PROJECTION
			Name	True_Long_Projection
			Description	<Enter description (up to 300 chars)>
			AbsolutePath	CentralBody/Earth
				Vector
					BEGIN	VECTOR
						Type	VECTOR_LINKTO
						Name	ICRF-X
						AbsolutePath	CentralBody/Earth
					END	VECTOR
				ReferencePlane
					BEGIN	PLANE
						Type	PLANE_LINKTO
						Name	Equator
						AbsolutePath	CentralBody/Earth
					END	PLANE
		END	VECTOR
    END Crdn
    
    BEGIN SpiceExt
    END SpiceExt
    
    BEGIN FlightScenExt
    END FlightScenExt
    
    BEGIN DIS

		Begin General

			Verbose                    Off
			Processing                 Off
			Statistics                 Off
			ExerciseID                 -1
			ForceID                    -1

		End General


		Begin Output

			Version                    5
			ExerciseID                 1
			forceID                    1
			HeartbeatTimer             5.000000
			DistanceThresh             1.000000
			OrientThresh               3.000000

		End Output


		Begin Time

			Mode                       rtPDUTimestamp

		End Time


		Begin PDUInfo


		End PDUInfo


		Begin Parameters

			ParmData  COLORFRIENDLY        blue
			ParmData  COLORNEUTRAL         white
			ParmData  COLOROPFORCE         red
			ParmData  MAXDRELSETS          1000

		End Parameters


		Begin Network

			NetIF                      Default
			Mode                       Broadcast
			McastIP                    224.0.0.1
			Port                       3000
			rChannelBufferSize         65000
			ReadBufferSize             1500
			QueuePollPeriod            20
			MaxRcvQueueEntries         1000
			MaxRcvIOThreads            4
			sChannelBufferSize         65000

		End Network


		Begin EntityTypeDef


#			order: kind:domain:country:catagory:subCatagory:specific:xtra ( -1 = * )


		End EntityTypeDef


		Begin EntityFilter
			Include                    *:*:*
		End EntityFilter

    END DIS
    
    BEGIN VO
    END VO

END Extensions

BEGIN SubObjects

Class Satellite

	SaInit
	Sat1
	SatFinal
	SatIter

END Class

END SubObjects

BEGIN References
    Instance *
        *
    END Instance
    Instance Satellite/SaInit
        Satellite/SaInit
    END Instance
    Instance Satellite/Sat1
        Satellite/Sat1
    END Instance
    Instance Satellite/SatFinal
        Satellite/SatFinal
    END Instance
    Instance Satellite/SatIter
        Satellite/SatIter
    END Instance
END References

END Scenario
